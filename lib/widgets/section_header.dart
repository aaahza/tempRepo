import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final AppColors colors;
  final ResponsiveTheme theme;

  const SectionHeader({
    super.key,
    required this.title,
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
            title,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.sectionTitle,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        ),
        SizedBox(height: theme.spacingS),
        Divider(color: Colors.grey.shade400),
        SizedBox(height: theme.spacingXL),
      ],
    );
  }
}
