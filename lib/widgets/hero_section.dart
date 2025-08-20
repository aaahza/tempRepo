import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final AppColors colors;
  final ResponsiveTheme theme;

  const HeroSection({
    super.key,
    required this.colors,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            PortfolioData.name,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.largeTitle,
              fontWeight: AppTheme.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            PortfolioData.surname,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.largeTitle,
              fontWeight: AppTheme.bold,
            ),
          ),
        ),
        SizedBox(height: theme.spacingS),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppTheme.maxContentWidth),
            child: Text(
              PortfolioData.tagline,
              style: TextStyle(
                color: colors.secondaryText,
                fontSize: theme.heading,
                fontWeight: AppTheme.semiBold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
