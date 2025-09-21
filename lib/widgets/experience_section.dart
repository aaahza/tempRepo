import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/models/experience_model.dart';
import 'package:protfolio/widgets/hover_button.dart';
import 'package:protfolio/utils/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  final AppColors colors;
  final List<Experience> experiences;
  final ResponsiveTheme theme;

  const ExperienceSection({
    super.key,
    required this.colors,
    required this.experiences,
    required this.theme,
  });

    @override
  Widget build(BuildContext context) {
    return Column(
      children: experiences.asMap().entries.map((entry) {
        final index = entry.key;
        final experience = entry.value;
        
        return Column(
          children: [
            _ExperienceItem(
              colors: colors,
              experience: experience,
              theme: theme,
            ),
            // Add gap after each item except the last one
            if (index < experiences.length - 1)
              SizedBox(height: theme.spacingProjectGap),
          ],
        );
      }).toList(),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final AppColors colors;
  final Experience experience;
  final ResponsiveTheme theme;

  const _ExperienceItem({
    required this.colors,
    required this.experience,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Mobile layout - vertical stack
    if (!AppTheme.isDesktop(screenWidth)) {
      return _buildMobileLayout();
    }
    
    // Desktop and tablet layout - side by side
    return _buildDesktopLayout();
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.company,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.subtitle,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: theme.spacingS),
        Text(
          experience.subtitle,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: theme.spacingS),
        Text(
          experience.duration,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        SizedBox(height: theme.spacingM),
        _buildDetailRow('Position', experience.position),
        SizedBox(height: theme.spacingS),
        _buildDetailRow('Location', experience.location),
        SizedBox(height: theme.spacingS),
        _buildDetailRow('Industry', experience.industry),
        if (experience.websiteText != null && experience.websiteUrl != null) ...[
          SizedBox(height: theme.spacingS),
          _buildWebsiteRow(),
        ],
        SizedBox(height: theme.spacingM),
        ...experience.descriptions.map((description) {
          return Padding(
            padding: EdgeInsets.only(bottom: theme.spacingS),
            child: Text(
              description,
              style: TextStyle(
                color: colors.secondaryText,
                fontSize: theme.smallBody,
                fontWeight: AppTheme.semiBold,
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            experience.company,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.subtitle,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
        SizedBox(height: theme.spacingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          experience.subtitle,
                          style: TextStyle(
                            color: colors.primaryText,
                            fontSize: theme.body,
                            fontWeight: AppTheme.semiBold,
                          ),
                        ),
                        SizedBox(height: theme.spacingS),
                        Text(
                          experience.duration,
                          style: TextStyle(
                            color: colors.primaryText,
                            fontSize: theme.body,
                            fontWeight: AppTheme.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 2,
                    child: _buildExperienceDetails(),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: experience.descriptions.map((description) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: theme.spacingS),
                    child: Text(
                      description,
                      style: TextStyle(
                        color: colors.secondaryText,
                        fontSize: theme.smallBody,
                        fontWeight: AppTheme.semiBold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExperienceDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Position', experience.position),
        SizedBox(height: theme.spacingS),
        _buildDetailRow('Location', experience.location),
        SizedBox(height: theme.spacingS),
        _buildDetailRow('Industry', experience.industry),
        SizedBox(height: theme.spacingS),
        if (experience.websiteText != null && experience.websiteUrl != null)
          _buildWebsiteRow(),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(
              color: colors.secondaryText,
              fontSize: theme.body,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
        SizedBox(width: theme.spacingS),
        Expanded(
          flex: 2,
          child: Text(
            value,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.body,
              fontWeight: AppTheme.semiBold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildWebsiteRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Website',
            style: TextStyle(
              color: colors.secondaryText,
              fontSize: theme.body,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
        SizedBox(width: theme.spacingS),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HoverButton(
                text: experience.websiteText!,
                onPressed: () => UrlLauncher.launchCustomUrl(experience.websiteUrl!),
                textColor: colors.primaryText,
                withArrow: true,
                lineColor: colors.secondaryText,
                fontSize: theme.body,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
