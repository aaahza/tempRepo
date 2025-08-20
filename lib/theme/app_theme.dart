import 'package:flutter/material.dart';

class AppTheme {
  static const Duration animationDuration = Duration(milliseconds: 250);
  static const Curve animationCurve = Curves.easeInOut;
  
  // Responsive breakpoints
  static const double mobileBreakpoint = 768;
  static const double smallTabletBreakpoint = 900;
  static const double tabletBreakpoint = 1200;
  static const double smallDesktopBreakpoint = 1400;
  
  // Light mode colors
  static const Color lightWhite = Color(0xFFFEFFFE);
  static const Color lightBlack = Color(0xFF242027);
  static const Color lightGrey = Color(0xFF565657);
  
  // Dark mode colors
  static const Color darkWhite = Color(0xFF252026);
  static const Color darkBlack = Color(0xFFc4c4c8);
  static const Color darkGrey = Color(0xFF969696);
  
  // Font weights
  static FontWeight get medium => FontWeight.values[4];
  static FontWeight get semiBold => FontWeight.values[5];
  static FontWeight get bold => FontWeight.bold;
  
  // Typography - Desktop
  static const double largeTitleDesktop = 350;
  static const double sectionTitleDesktop = 80;
  static const double subtitleDesktop = 50;
  static const double headingDesktop = 35;
  static const double subheadingDesktop = 30;
  static const double bodyDesktop = 20;
  static const double smallBodyDesktop = 18;
  static const double captionDesktop = 22;
  static const double collaborateTextDesktop = 110;
  
  // Typography - Tablet
  static const double largeTitleTablet = 270;
  static const double sectionTitleTablet = 70;
  static const double subtitleTablet = 44;
  static const double headingTablet = 32;
  static const double subheadingTablet = 28;
  static const double bodyTablet = 19;
  static const double smallBodyTablet = 17;
  static const double captionTablet = 21;
  static const double collaborateTextTablet = 95;
  
  // Typography - Small Tablet (between mobile and tablet)
  static const double largeTitleSmallTablet = 220;
  static const double sectionTitleSmallTablet = 55;
  static const double subtitleSmallTablet = 36;
  static const double headingSmallTablet = 26;
  static const double subheadingSmallTablet = 22;
  static const double bodySmallTablet = 17;
  static const double smallBodySmallTablet = 15;
  static const double captionSmallTablet = 19;
  static const double collaborateTextSmallTablet = 75;
  
  // Typography - Small Desktop (between tablet and full desktop)
  static const double largeTitleSmallDesktop = 310;
  static const double sectionTitleSmallDesktop = 75;
  static const double subtitleSmallDesktop = 47;
  static const double headingSmallDesktop = 33;
  static const double subheadingSmallDesktop = 29;
  static const double bodySmallDesktop = 19;
  static const double smallBodySmallDesktop = 17;
  static const double captionSmallDesktop = 21;
  static const double collaborateTextSmallDesktop = 100;
  
  // Typography - Mobile
  static const double largeTitleMobile = 110;
  static const double sectionTitleMobile = 45;
  static const double subtitleMobile = 30;
  static const double headingMobile = 24;
  static const double subheadingMobile = 22;
  static const double bodyMobile = 16;
  static const double smallBodyMobile = 14;
  static const double captionMobile = 18;
  static const double collaborateTextMobile = 55;
  
  // Legacy typography for backward compatibility
  static const double largeTitle = largeTitleDesktop;
  static const double sectionTitle = sectionTitleDesktop;
  static const double subtitle = subtitleDesktop;
  static const double heading = headingDesktop;
  static const double subheading = subheadingDesktop;
  static const double body = bodyDesktop;
  static const double smallBody = smallBodyDesktop;
  static const double caption = captionDesktop;
  static const double collaborateText = collaborateTextDesktop;
  
  // Spacing - Desktop
  static const double spacingXSDesktop = 4;
  static const double spacingSDesktop = 20;
  static const double spacingMDesktop = 40;
  static const double spacingLDesktop = 50;
  static const double spacingXLDesktop = 80;
  static const double spacingXXLDesktop = 120;
  static const double spacingSectionGapDesktop = 250;
  static const double spacingProjectGapDesktop = 100;
  
  // Spacing - Tablet
  static const double spacingXSTablet = 4;
  static const double spacingSTablet = 16;
  static const double spacingMTablet = 32;
  static const double spacingLTablet = 40;
  static const double spacingXLTablet = 60;
  static const double spacingXXLTablet = 80;
  static const double spacingSectionGapTablet = 150;
  static const double spacingProjectGapTablet = 60;
  
  // Spacing - Small Tablet
  static const double spacingXSSmallTablet = 4;
  static const double spacingSSmallTablet = 14;
  static const double spacingMSmallTablet = 28;
  static const double spacingLSmallTablet = 36;
  static const double spacingXLSmallTablet = 50;
  static const double spacingXXLSmallTablet = 70;
  static const double spacingSectionGapSmallTablet = 120;
  static const double spacingProjectGapSmallTablet = 50;
  
  // Spacing - Small Desktop
  static const double spacingXSSmallDesktop = 4;
  static const double spacingSSmallDesktop = 18;
  static const double spacingMSmallDesktop = 36;
  static const double spacingLSmallDesktop = 45;
  static const double spacingXLSmallDesktop = 70;
  static const double spacingXXLSmallDesktop = 100;
  static const double spacingSectionGapSmallDesktop = 200;
  static const double spacingProjectGapSmallDesktop = 80;
  
  // Spacing - Mobile
  static const double spacingXSMobile = 4;
  static const double spacingSMobile = 12;
  static const double spacingMMobile = 24;
  static const double spacingLMobile = 32;
  static const double spacingXLMobile = 40;
  static const double spacingXXLMobile = 60;
  static const double spacingSectionGapMobile = 80;
  static const double spacingProjectGapMobile = 40;
  
  // Legacy spacing for backward compatibility
  static const double spacingXS = spacingXSDesktop;
  static const double spacingS = spacingSDesktop;
  static const double spacingM = spacingMDesktop;
  static const double spacingL = spacingLDesktop;
  static const double spacingXL = spacingXLDesktop;
  static const double spacingXXL = spacingXXLDesktop;
  static const double spacingSectionGap = spacingSectionGapDesktop;
  static const double spacingProjectGap = spacingProjectGapDesktop;
  
  // Layout - Desktop
  static const EdgeInsets pagePaddingDesktop = EdgeInsets.symmetric(horizontal: 80, vertical: 50);
  static const EdgeInsets imagePaddingDesktop = EdgeInsets.all(80);
  
  // Layout - Tablet
  static const EdgeInsets pagePaddingTablet = EdgeInsets.symmetric(horizontal: 40, vertical: 30);
  static const EdgeInsets imagePaddingTablet = EdgeInsets.all(60);
  
  // Layout - Small Tablet
  static const EdgeInsets pagePaddingSmallTablet = EdgeInsets.symmetric(horizontal: 50, vertical: 25);
  static const EdgeInsets imagePaddingSmallTablet = EdgeInsets.all(50);
  
  // Layout - Small Desktop
  static const EdgeInsets pagePaddingSmallDesktop = EdgeInsets.symmetric(horizontal: 60, vertical: 40);
  static const EdgeInsets imagePaddingSmallDesktop = EdgeInsets.all(70);
  
  // Layout - Mobile
  static const EdgeInsets pagePaddingMobile = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  static const EdgeInsets imagePaddingMobile = EdgeInsets.all(40);
  
  // Legacy layout for backward compatibility
  static const EdgeInsets pagePadding = pagePaddingDesktop;
  static const double maxContentWidth = 1000;
  static const EdgeInsets imagePadding = imagePaddingDesktop;
  
  // Helper methods for responsive design
  static bool isMobile(double width) => width < mobileBreakpoint;
  static bool isSmallTablet(double width) => width >= mobileBreakpoint && width < smallTabletBreakpoint;
  static bool isTablet(double width) => width >= smallTabletBreakpoint && width < tabletBreakpoint;
  static bool isSmallDesktop(double width) => width >= tabletBreakpoint && width < smallDesktopBreakpoint;
  static bool isDesktop(double width) => width >= smallDesktopBreakpoint;
  
  static ResponsiveTheme responsive(double screenWidth) {
    if (isMobile(screenWidth)) {
      return ResponsiveTheme.mobile();
    } else if (isSmallTablet(screenWidth)) {
      return ResponsiveTheme.smallTablet();
    } else if (isTablet(screenWidth)) {
      return ResponsiveTheme.tablet();
    } else if (isSmallDesktop(screenWidth)) {
      return ResponsiveTheme.smallDesktop();
    } else {
      return ResponsiveTheme.desktop();
    }
  }
}

class ResponsiveTheme {
  final double largeTitle;
  final double sectionTitle;
  final double subtitle;
  final double heading;
  final double subheading;
  final double body;
  final double smallBody;
  final double caption;
  final double collaborateText;
  
  final double spacingXS;
  final double spacingS;
  final double spacingM;
  final double spacingL;
  final double spacingXL;
  final double spacingXXL;
  final double spacingSectionGap;
  final double spacingProjectGap;
  
  final EdgeInsets pagePadding;
  final EdgeInsets imagePadding;
  
  const ResponsiveTheme({
    required this.largeTitle,
    required this.sectionTitle,
    required this.subtitle,
    required this.heading,
    required this.subheading,
    required this.body,
    required this.smallBody,
    required this.caption,
    required this.collaborateText,
    required this.spacingXS,
    required this.spacingS,
    required this.spacingM,
    required this.spacingL,
    required this.spacingXL,
    required this.spacingXXL,
    required this.spacingSectionGap,
    required this.spacingProjectGap,
    required this.pagePadding,
    required this.imagePadding,
  });
  
  static ResponsiveTheme desktop() => const ResponsiveTheme(
    largeTitle: AppTheme.largeTitleDesktop,
    sectionTitle: AppTheme.sectionTitleDesktop,
    subtitle: AppTheme.subtitleDesktop,
    heading: AppTheme.headingDesktop,
    subheading: AppTheme.subheadingDesktop,
    body: AppTheme.bodyDesktop,
    smallBody: AppTheme.smallBodyDesktop,
    caption: AppTheme.captionDesktop,
    collaborateText: AppTheme.collaborateTextDesktop,
    spacingXS: AppTheme.spacingXSDesktop,
    spacingS: AppTheme.spacingSDesktop,
    spacingM: AppTheme.spacingMDesktop,
    spacingL: AppTheme.spacingLDesktop,
    spacingXL: AppTheme.spacingXLDesktop,
    spacingXXL: AppTheme.spacingXXLDesktop,
    spacingSectionGap: AppTheme.spacingSectionGapDesktop,
    spacingProjectGap: AppTheme.spacingProjectGapDesktop,
    pagePadding: AppTheme.pagePaddingDesktop,
    imagePadding: AppTheme.imagePaddingDesktop,
  );
  
  static ResponsiveTheme tablet() => const ResponsiveTheme(
    largeTitle: AppTheme.largeTitleTablet,
    sectionTitle: AppTheme.sectionTitleTablet,
    subtitle: AppTheme.subtitleTablet,
    heading: AppTheme.headingTablet,
    subheading: AppTheme.subheadingTablet,
    body: AppTheme.bodyTablet,
    smallBody: AppTheme.smallBodyTablet,
    caption: AppTheme.captionTablet,
    collaborateText: AppTheme.collaborateTextTablet,
    spacingXS: AppTheme.spacingXSTablet,
    spacingS: AppTheme.spacingSTablet,
    spacingM: AppTheme.spacingMTablet,
    spacingL: AppTheme.spacingLTablet,
    spacingXL: AppTheme.spacingXLTablet,
    spacingXXL: AppTheme.spacingXXLTablet,
    spacingSectionGap: AppTheme.spacingSectionGapTablet,
    spacingProjectGap: AppTheme.spacingProjectGapTablet,
    pagePadding: AppTheme.pagePaddingTablet,
    imagePadding: AppTheme.imagePaddingTablet,
  );
  
  static ResponsiveTheme smallTablet() => const ResponsiveTheme(
    largeTitle: AppTheme.largeTitleSmallTablet,
    sectionTitle: AppTheme.sectionTitleSmallTablet,
    subtitle: AppTheme.subtitleSmallTablet,
    heading: AppTheme.headingSmallTablet,
    subheading: AppTheme.subheadingSmallTablet,
    body: AppTheme.bodySmallTablet,
    smallBody: AppTheme.smallBodySmallTablet,
    caption: AppTheme.captionSmallTablet,
    collaborateText: AppTheme.collaborateTextSmallTablet,
    spacingXS: AppTheme.spacingXSSmallTablet,
    spacingS: AppTheme.spacingSSmallTablet,
    spacingM: AppTheme.spacingMSmallTablet,
    spacingL: AppTheme.spacingLSmallTablet,
    spacingXL: AppTheme.spacingXLSmallTablet,
    spacingXXL: AppTheme.spacingXXLSmallTablet,
    spacingSectionGap: AppTheme.spacingSectionGapSmallTablet,
    spacingProjectGap: AppTheme.spacingProjectGapSmallTablet,
    pagePadding: AppTheme.pagePaddingSmallTablet,
    imagePadding: AppTheme.imagePaddingSmallTablet,
  );
  
  static ResponsiveTheme smallDesktop() => const ResponsiveTheme(
    largeTitle: AppTheme.largeTitleSmallDesktop,
    sectionTitle: AppTheme.sectionTitleSmallDesktop,
    subtitle: AppTheme.subtitleSmallDesktop,
    heading: AppTheme.headingSmallDesktop,
    subheading: AppTheme.subheadingSmallDesktop,
    body: AppTheme.bodySmallDesktop,
    smallBody: AppTheme.smallBodySmallDesktop,
    caption: AppTheme.captionSmallDesktop,
    collaborateText: AppTheme.collaborateTextSmallDesktop,
    spacingXS: AppTheme.spacingXSSmallDesktop,
    spacingS: AppTheme.spacingSSmallDesktop,
    spacingM: AppTheme.spacingMSmallDesktop,
    spacingL: AppTheme.spacingLSmallDesktop,
    spacingXL: AppTheme.spacingXLSmallDesktop,
    spacingXXL: AppTheme.spacingXXLSmallDesktop,
    spacingSectionGap: AppTheme.spacingSectionGapSmallDesktop,
    spacingProjectGap: AppTheme.spacingProjectGapSmallDesktop,
    pagePadding: AppTheme.pagePaddingSmallDesktop,
    imagePadding: AppTheme.imagePaddingSmallDesktop,
  );

  static ResponsiveTheme mobile() => const ResponsiveTheme(
    largeTitle: AppTheme.largeTitleMobile,
    sectionTitle: AppTheme.sectionTitleMobile,
    subtitle: AppTheme.subtitleMobile,
    heading: AppTheme.headingMobile,
    subheading: AppTheme.subheadingMobile,
    body: AppTheme.bodyMobile,
    smallBody: AppTheme.smallBodyMobile,
    caption: AppTheme.captionMobile,
    collaborateText: AppTheme.collaborateTextMobile,
    spacingXS: AppTheme.spacingXSMobile,
    spacingS: AppTheme.spacingSMobile,
    spacingM: AppTheme.spacingMMobile,
    spacingL: AppTheme.spacingLMobile,
    spacingXL: AppTheme.spacingXLMobile,
    spacingXXL: AppTheme.spacingXXLMobile,
    spacingSectionGap: AppTheme.spacingSectionGapMobile,
    spacingProjectGap: AppTheme.spacingProjectGapMobile,
    pagePadding: AppTheme.pagePaddingMobile,
    imagePadding: AppTheme.imagePaddingMobile,
  );
}

class AppColors {
  final Color backgroundColor;
  final Color primaryText;
  final Color secondaryText;
  
  const AppColors({
    required this.backgroundColor,
    required this.primaryText,
    required this.secondaryText,
  });
  
  static AppColors light() => const AppColors(
    backgroundColor: AppTheme.lightWhite,
    primaryText: AppTheme.lightBlack,
    secondaryText: AppTheme.lightGrey,
  );
  
  static AppColors dark() => const AppColors(
    backgroundColor: AppTheme.darkWhite,
    primaryText: AppTheme.darkBlack,
    secondaryText: AppTheme.darkGrey,
  );
}
