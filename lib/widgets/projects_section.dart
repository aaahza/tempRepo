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

class _ProjectItem extends StatelessWidget {
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
        SizedBox(height: theme.spacingM),
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
      children: isReversed
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
          project.title,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.subheading,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: theme.spacingS),
        Text(
          project.category,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: theme.spacingS),
        Text(
          project.year,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: theme.spacingM),
        ...project.descriptions.map((description) {
          return Padding(
            padding: EdgeInsets.only(bottom: theme.spacingM),
            child: Text(
              description,
              style: TextStyle(
                color: colors.secondaryText,
                fontSize: theme.body,
                fontWeight: AppTheme.semiBold,
              ),
            ),
          );
        }),
        SizedBox(height: theme.spacingL),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HoverButton(
              text: project.linkText,
              onPressed: () => UrlLauncher.launchCustomUrl(project.linkUrl),
              textColor: colors.primaryText,
              withArrow: true,
              lineColor: colors.secondaryText,
              fontSize: theme.body,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectImage() {
    return Container(
      color: Colors.black,
      padding: theme.imagePadding,
      child: Image.asset(project.imagePath),
    );
  }
}
