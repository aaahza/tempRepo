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
    // Compute horizontal space available for the hero text:
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = theme.pagePadding.horizontal;
    final availableWidth = screenWidth - horizontalPadding;

    return Column(
      children: [
        // First name (left aligned)
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: availableWidth,
            // FittedBox will scale the Text down to fit the width if needed
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                PortfolioData.name,
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: colors.primaryText,
                  fontSize: theme.largeTitle, // stays as "base" size
                  fontWeight: AppTheme.bold,
                ),
              ),
            ),
          ),
        ),

        // Surname (right aligned) — also forced to single line and scaled down if needed
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: availableWidth,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                PortfolioData.surname,
                maxLines: 1,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  color: colors.primaryText,
                  fontSize: theme.largeTitle,
                  fontWeight: AppTheme.bold,
                ),
              ),
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
