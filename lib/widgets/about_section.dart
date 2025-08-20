import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/widgets/hover_button.dart';
import 'package:protfolio/utils/url_launcher.dart';

class AboutSection extends StatelessWidget {
  final AppColors colors;
  final ResponsiveTheme theme;

  const AboutSection({super.key, required this.colors, required this.theme});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Mobile layout - vertical stack
    if (AppTheme.isTablet(screenWidth) ||
        AppTheme.isSmallTablet(screenWidth) ||
        AppTheme.isMobile(screenWidth)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PortfolioData.aboutMainText,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.heading,
              fontWeight: AppTheme.semiBold,
            ),
          ),
          SizedBox(height: theme.spacingM),
          ...PortfolioData.aboutDescriptions.map((description) {
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
          SizedBox(height: theme.spacingM),
          Text(
            PortfolioData.aboutSkills,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.body,
              fontWeight: AppTheme.semiBold,
            ),
          ),

          SizedBox(height: theme.spacingM),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HoverButton(
                    text: 'Say hello\n${PortfolioData.email}',
                    onPressed: UrlLauncher.launchEmail,
                    textColor: colors.primaryText,
                    lineColor: colors.secondaryText,
                    fontSize: theme.body,
                  ),
                ],
              ),
              SizedBox(height: theme.spacingS),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HoverButton(
                    text: 'Explore LinkedIn',
                    onPressed: UrlLauncher.launchLinkedIn,
                    textColor: colors.primaryText,
                    withArrow: true,
                    lineColor: colors.secondaryText,
                    fontSize: theme.body,
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    }

    // Desktop and tablet layout - side by side
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  PortfolioData.aboutMainText,
                  style: TextStyle(
                    color: colors.primaryText,
                    fontSize: theme.heading,
                    fontWeight: AppTheme.semiBold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      PortfolioData.aboutSkills,
                      style: TextStyle(
                        color: colors.primaryText,
                        fontSize: theme.body,
                        fontWeight: AppTheme.semiBold,
                      ),
                    ),
                    SizedBox(width: theme.spacingM),
                    HoverButton(
                      text: 'Say hello\n${PortfolioData.email}',
                      onPressed: UrlLauncher.launchEmail,
                      textColor: colors.primaryText,
                      lineColor: colors.secondaryText,
                      fontSize: theme.body,
                    ),
                    SizedBox(width: theme.spacingM),
                    HoverButton(
                      text: 'Explore LinkedIn',
                      onPressed: UrlLauncher.launchLinkedIn,
                      textColor: colors.primaryText,
                      withArrow: true,
                      lineColor: colors.secondaryText,
                      fontSize: theme.body,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: PortfolioData.aboutDescriptions.map((description) {
                return Text(
                  description,
                  style: TextStyle(
                    color: colors.secondaryText,
                    fontSize: theme.smallBody,
                    fontWeight: AppTheme.semiBold,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
