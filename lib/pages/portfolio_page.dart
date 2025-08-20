import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/widgets/top_bar.dart';
import 'package:protfolio/widgets/hero_section.dart';
import 'package:protfolio/widgets/about_section.dart';
import 'package:protfolio/widgets/experience_section.dart';
import 'package:protfolio/widgets/projects_section.dart';
import 'package:protfolio/widgets/footer_section.dart';
import 'package:protfolio/widgets/section_header.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final Ticker _ticker;

  double _currentScroll = 0.0;
  double _targetScroll = 0.0;
  bool _isLightMode = true;

  // for fling tracking
  Duration? _lastMoveTimestamp;
  double? _lastMoveDy;
  double _lastVelocityPxPerSecond = 0.0;

  // Global keys for section positioning
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _experienceSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _ticker = createTicker((_) {
      // Smoothly interpolate current toward target and apply to controller
      if (!_scrollController.hasClients) return;

      // small threshold to avoid unnecessary jumps
      if ((_targetScroll - _currentScroll).abs() < 0.1) return;

      _currentScroll = lerpDouble(_currentScroll, _targetScroll, 0.035)!;
      // use jumpTo for snappy follow of our computed position
      // (animateTo would conflict with ticker)
      _scrollController.jumpTo(_currentScroll);
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage(PortfolioData.profileImagePath), context);
  }

  @override
  Widget build(BuildContext context) {
    final colors = _isLightMode ? AppColors.light() : AppColors.dark();
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = AppTheme.responsive(screenWidth);

    return Material(
      child: Listener(
        // handle wheel / trackpad scrolls (desktop)
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent && _scrollController.hasClients) {
            final newTarget = _targetScroll + pointerSignal.scrollDelta.dy;
            final maxScroll = _scrollController.position.maxScrollExtent;
            _targetScroll = newTarget.clamp(0.0, maxScroll);
          }
        },
        // handle touch/mouse drags
        onPointerMove: (PointerMoveEvent event) {
          if (!_scrollController.hasClients) return;

          // Update target based on pointer movement.
          // Note: we subtract delta.dy so upward finger movement (delta.dy < 0)
          // increases the scroll offset (page moves up).
          final newTarget = _targetScroll - event.delta.dy;
          final maxScroll = _scrollController.position.maxScrollExtent;
          _targetScroll = newTarget.clamp(0.0, maxScroll);

          // Track the last move to estimate velocity on pointer up
          // We only keep the immediate last delta & timestamp (simple approach).
          _lastMoveTimestamp = event.timeStamp;
          _lastMoveDy = event.delta.dy;
        },
        onPointerDown: (PointerDownEvent event) {
          // reset last velocity; user started a new gesture
          _lastMoveTimestamp = null;
          _lastMoveDy = null;
          _lastVelocityPxPerSecond = 0.0;
        },
        onPointerUp: (PointerUpEvent event) {
          // Compute a simple release velocity from last recorded delta & timestamp
          // and apply a short fling impulse to the target.
          if (_lastMoveTimestamp != null && _lastMoveDy != null && _scrollController.hasClients) {
            // We do not trust extremely old timestamps; safeguard with a minimum dt.
            final dtMillis = event.timeStamp.inMilliseconds - _lastMoveTimestamp!.inMilliseconds;
            if (dtMillis > 0 && dtMillis < 500) {
              final velocity = (_lastMoveDy! / dtMillis) * 1000.0; // px / s
              _lastVelocityPxPerSecond = velocity;

              // Convert this into an impulse on _targetScroll.
              // Because during moves we used `_targetScroll -= delta.dy`,
              // a negative delta (finger moved up) produced an increase in target.
              // The velocity has same sign as delta/dt, so the impulse should follow:
              // applyDelta = -velocity * flingFactor
              const double flingFactorSeconds = 0.25; // tune this (how far the fling travels)
              final flingDelta = -velocity * flingFactorSeconds;
              final maxScroll = _scrollController.position.maxScrollExtent;
              _targetScroll = (_targetScroll + flingDelta).clamp(0.0, maxScroll);
            }
          }

          // reset trackers
          _lastMoveTimestamp = null;
          _lastMoveDy = null;
        },
        child: AnimatedContainer(
          duration: AppTheme.animationDuration,
          curve: AppTheme.animationCurve,
          color: colors.backgroundColor,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              controller: _scrollController,
              // keep NeverScrollableScrollPhysics so native browser scrolling doesn't fight our ticker
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: theme.pagePadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopBar(
                      colors: colors,
                      onThemeToggle: _toggleTheme,
                      onNavigationTap: _scrollToSection,
                      theme: theme,
                    ),
                    SizedBox(height: theme.spacingS),
                    HeroSection(colors: colors, theme: theme),
                    SizedBox(height: theme.spacingSectionGap),
                    SectionHeader(
                      key: _aboutSectionKey,
                      title: 'ABOUT',
                      colors: colors,
                      theme: theme,
                    ),
                    AboutSection(colors: colors, theme: theme),
                    SizedBox(height: theme.spacingSectionGap),
                    SectionHeader(
                      key: _experienceSectionKey,
                      title: 'EXPERIENCE',
                      colors: colors,
                      theme: theme,
                    ),
                    ExperienceSection(
                      colors: colors,
                      experiences: PortfolioData.experiences,
                      theme: theme,
                    ),
                    SizedBox(height: theme.spacingSectionGap),
                    SectionHeader(
                      key: _projectsSectionKey,
                      title: 'PROJECTS',
                      colors: colors,
                      theme: theme,
                    ),
                    ProjectsSection(
                      colors: colors,
                      projects: PortfolioData.projects,
                      theme: theme,
                    ),
                    SizedBox(height: theme.spacingSectionGap),
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: theme.spacingXL),
                    FooterSection(
                      key: _contactSectionKey,
                      colors: colors,
                      theme: theme,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggleTheme() {
    setState(() {
      _isLightMode = !_isLightMode;
    });
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section.toLowerCase()) {
      case 'about':
        targetKey = _aboutSectionKey;
        break;
      case 'experience':
        targetKey = _experienceSectionKey;
        break;
      case 'projects':
        targetKey = _projectsSectionKey;
        break;
      case 'contact':
        targetKey = _contactSectionKey;
        break;
    }

    if (targetKey?.currentContext != null && _scrollController.hasClients) {
      final RenderBox renderBox = targetKey!.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      // Account for the top bar height and padding
      final targetPosition = _scrollController.offset + position.dy - 150; // 150px offset for top bar
      final maxScroll = _scrollController.position.maxScrollExtent;
      _targetScroll = targetPosition.clamp(0.0, maxScroll);
      // we don't call animateTo because our ticker will smoothly lerp toward _targetScroll
      // update _currentScroll as well so there's no visible jump
      _currentScroll = _scrollController.offset;
    }
  }
}
