import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/widgets/hover_button.dart';
import 'package:protfolio/utils/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  final AppColors colors;
  final List<Project> projects;
  final ResponsiveTheme theme;

  const ProjectsSection({
    super.key,
    required this.colors,
    required this.projects,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < projects.length; i++) ...[
          _ProjectItem(
            colors: colors,
            project: projects[i],
            isReversed: i % 2 == 1,
            theme: theme,
          ),
          if (i < projects.length - 1)
            SizedBox(height: theme.spacingProjectGap),
        ],
      ],
    );
  }
}

class _ProjectItem extends StatefulWidget {
  final AppColors colors;
  final Project project;
  final bool isReversed;
  final ResponsiveTheme theme;

  const _ProjectItem({
    required this.colors,
    required this.project,
    required this.isReversed,
    required this.theme,
  });

  @override
  State<_ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<_ProjectItem> {
  // keep the carousel key so we can call prev/next and preserve carousel state across rebuilds
  final GlobalKey<_ProjectImageCarouselState> _carouselKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Mobile layout - always vertical stack
    if (AppTheme.isTablet(screenWidth) ||
        AppTheme.isSmallTablet(screenWidth) ||
        AppTheme.isMobile(screenWidth)) {
      return _buildMobileLayout();
    }

    // Desktop and tablet layout - side by side
    return _buildDesktopLayout();
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProjectImage(),
        SizedBox(height: widget.theme.spacingM),
        _buildProjectContent(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    final content = _buildProjectContent();
    final image = _buildProjectImage();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.isReversed
          ? [
              Expanded(flex: 5, child: image),
              const Spacer(flex: 1),
              Expanded(flex: 2, child: content),
            ]
          : [
              Expanded(flex: 2, child: content),
              const Spacer(flex: 1),
              Expanded(flex: 5, child: image),
            ],
    );
  }

  Widget _buildProjectContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.project.title,
          style: TextStyle(
            color: widget.colors.primaryText,
            fontSize: widget.theme.subheading,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: widget.theme.spacingS),
        Text(
          widget.project.category,
          style: TextStyle(
            color: widget.colors.primaryText,
            fontSize: widget.theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: widget.theme.spacingS),
        Text(
          widget.project.year,
          style: TextStyle(
            color: widget.colors.primaryText,
            fontSize: widget.theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: widget.theme.spacingM),
        ...widget.project.descriptions.map((description) {
          return Padding(
            padding: EdgeInsets.only(bottom: widget.theme.spacingM),
            child: Text(
              description,
              style: TextStyle(
                color: widget.colors.secondaryText,
                fontSize: widget.theme.body,
                fontWeight: AppTheme.semiBold,
              ),
            ),
          );
        }),
        SizedBox(height: widget.theme.spacingL),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HoverButton(
              text: widget.project.linkText,
              onPressed: () => UrlLauncher.launchCustomUrl(widget.project.linkUrl),
              textColor: widget.colors.primaryText,
              withArrow: true,
              lineColor: widget.colors.secondaryText,
              fontSize: widget.theme.body,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectImage() {
    final projectImageCarousel = _ProjectImageCarousel(
      key: _carouselKey, // <-- pass the key so prev()/next() work
      imagePaths: widget.project.imagePaths,
      colors: widget.colors,
      theme: widget.theme,
    );
    final showArrows = widget.project.imagePaths.length > 1;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.black,
          padding: widget.theme.imagePadding,
          child: projectImageCarousel,
        ),

        if (showArrows)
          Positioned(
            right: widget.theme.spacingS,
            bottom: widget.theme.spacingS,
            child: Row(
              children: [
                _SmallIconButton(
                  icon: Icons.chevron_left,
                  onPressed: () => _carouselKey.currentState?.prev(),
                  colors: widget.colors,
                  theme: widget.theme,
                ),
                SizedBox(width: 8),
                _SmallIconButton(
                  icon: Icons.chevron_right,
                  onPressed: () => _carouselKey.currentState?.next(),
                  colors: widget.colors,
                  theme: widget.theme,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ProjectImageCarousel extends StatefulWidget {
  final List<String> imagePaths;
  final AppColors colors;
  final ResponsiveTheme theme;

  const _ProjectImageCarousel({
    required super.key,
    required this.imagePaths,
    required this.colors,
    required this.theme,
  });

  @override
  State<_ProjectImageCarousel> createState() => _ProjectImageCarouselState();
}

class _ProjectImageCarouselState extends State<_ProjectImageCarousel> {
  int _index = 0;

  void prev() {
    setState(() {
      _index = (_index - 1) % widget.imagePaths.length;
      if (_index < 0) _index += widget.imagePaths.length;
    });
  }

  void next() {
    setState(() {
      _index = (_index + 1) % widget.imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final paths = widget.imagePaths;

    return AspectRatio(
      aspectRatio: 16/10,
      child: Stack(
        children: [
          // image
          Positioned.fill(
            child: ClipRect(
              child: Image.asset(
                paths[_index],
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: widget.colors.backgroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final AppColors colors;
  final ResponsiveTheme theme;

  const _SmallIconButton({
    required this.icon,
    required this.onPressed,
    required this.colors,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Icon(
          icon,
          size: theme.body * 1.2,
          color: Colors.white,
        ),
      ),
    );
  }
}
