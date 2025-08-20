import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/widgets/hover_button.dart';
import 'package:protfolio/utils/url_launcher.dart';

class FooterSection extends StatelessWidget {
  final AppColors colors;
  final ResponsiveTheme theme;

  const FooterSection({super.key, required this.colors, required this.theme});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCollaborateSection(screenWidth),
        SizedBox(height: theme.spacingXXL),
        _buildCopyrightSection(screenWidth),
      ],
    );
  }

  Widget _buildCollaborateSection(double screenWidth) {
    // Mobile layout - stack vertically
    if (AppTheme.isTablet(screenWidth) ||
        AppTheme.isSmallTablet(screenWidth) ||
        AppTheme.isMobile(screenWidth)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PortfolioData.collaborateText,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.collaborateText,
              fontWeight: AppTheme.semiBold,
            ),
          ),
          SizedBox(height: theme.spacingM),
          HoverButton(
            text: PortfolioData.email,
            onPressed: UrlLauncher.launchEmail,
            textColor: colors.primaryText,
            fontSize: theme.subheading,
            lineColor: colors.secondaryText,
          ),
        ],
      );
    }

    // Desktop and tablet layout - side by side
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          PortfolioData.collaborateText,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.collaborateText,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        HoverButton(
          text: PortfolioData.email,
          onPressed: UrlLauncher.launchEmail,
          textColor: colors.primaryText,
          fontSize: theme.subheading,
          lineColor: colors.secondaryText,
        ),
      ],
    );
  }

  Widget _buildCopyrightSection(double screenWidth) {
    // Mobile layout - stack vertically
    if (AppTheme.isMobile(screenWidth)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HoverButton(
                text: 'Github',
                onPressed: UrlLauncher.launchGithub,
                textColor: colors.primaryText,
                withArrow: true,
                lineColor: colors.secondaryText,
                fontSize: theme.body,
              ),
              SizedBox(width: theme.spacingS),
              HoverButton(
                text: 'LinkedIn',
                onPressed: UrlLauncher.launchLinkedIn,
                textColor: colors.primaryText,
                withArrow: true,
                lineColor: colors.secondaryText,
                fontSize: theme.body,
              ),
            ],
          ),
          SizedBox(height: theme.spacingS),
          Text(
            PortfolioData.copyright,
            style: TextStyle(
              color: colors.secondaryText,
              fontWeight: AppTheme.semiBold,
              fontSize: theme.body,
            ),
          ),
        ],
      );
    }

    // Desktop and tablet layout - side by side
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          PortfolioData.copyright,
          style: TextStyle(
            color: colors.secondaryText,
            fontWeight: AppTheme.semiBold,
            fontSize: theme.body,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HoverButton(
              text: 'Github',
              onPressed: UrlLauncher.launchGithub,
              textColor: colors.primaryText,
              withArrow: true,
              lineColor: colors.secondaryText,
              fontSize: theme.body,
            ),
            SizedBox(width: theme.spacingS),
            HoverButton(
              text: 'LinkedIn',
              onPressed: UrlLauncher.launchLinkedIn,
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
}
