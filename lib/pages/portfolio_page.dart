import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;
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
  late final Ticker? _ticker;

  double _currentScroll = 0.0;
  double _targetScroll = 0.0;
  bool _isLightMode = true;
  bool _isAnimatingScroll = false;

  // Global keys for section positioning
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _experienceSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    // Only use custom scroll handling on web
    if (kIsWeb) {
      _ticker = createTicker((_) {
        if (_isAnimatingScroll && (_targetScroll - _currentScroll).abs() > 0.1) {
          _currentScroll = lerpDouble(_currentScroll, _targetScroll, 0.035)!;
          _scrollController.jumpTo(_currentScroll);
        } else if (_isAnimatingScroll) {
          _isAnimatingScroll = false;
        }
      });
      _ticker?.start();
    } else {
      _ticker = null;
    }
  }

  @override
  void dispose() {
    _ticker?.dispose();
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
      child: kIsWeb ? _buildWebLayout(colors, theme) : _buildMobileLayout(colors, theme),
    );
  }

  Widget _buildWebLayout(dynamic colors, dynamic theme) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        if (pointerSignal is PointerScrollEvent) {
          final newTarget = _targetScroll + pointerSignal.scrollDelta.dy;
          final maxScroll = _scrollController.position.maxScrollExtent;
          _targetScroll = newTarget.clamp(0.0, maxScroll);
          _isAnimatingScroll = true;
        }
      },
      child: _buildScaffold(colors, theme, const NeverScrollableScrollPhysics()),
    );
  }

  Widget _buildMobileLayout(dynamic colors, dynamic theme) {
    return _buildScaffold(colors, theme, const ClampingScrollPhysics());
  }

  Widget _buildScaffold(dynamic colors, dynamic theme, ScrollPhysics physics) {
    return AnimatedContainer(
      duration: AppTheme.animationDuration,
      curve: AppTheme.animationCurve,
      color: colors.backgroundColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: physics,
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

    if (targetKey?.currentContext != null) {
      final RenderBox renderBox = targetKey!.currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      
      // Account for the top bar height and padding
      final targetPosition = position.dy + _currentScroll - 150;
      
      if (kIsWeb) {
        // Use custom smooth scrolling on web
        final maxScroll = _scrollController.position.maxScrollExtent;
        _targetScroll = targetPosition.clamp(0.0, maxScroll);
        _isAnimatingScroll = true;
      } else {
        // Use standard scrolling on mobile
        final maxScroll = _scrollController.position.maxScrollExtent;
        final clampedPosition = targetPosition.clamp(0.0, maxScroll);
        _scrollController.animateTo(
          clampedPosition,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    }
  }
}
