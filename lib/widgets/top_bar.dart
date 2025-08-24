import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/widgets/hover_button.dart';
import 'package:protfolio/utils/url_launcher.dart';

class TopBar extends StatelessWidget {
  final AppColors colors;
  final VoidCallback onThemeToggle;
  final Function(String) onNavigationTap;
  final ResponsiveTheme theme;
  final bool isLightMode;

  const TopBar({
    super.key,
    required this.colors,
    required this.onThemeToggle,
    required this.onNavigationTap,
    required this.theme,
    required this.isLightMode,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // On mobile, show collapsed menu
    if (AppTheme.isTablet(screenWidth) ||
        AppTheme.isSmallTablet(screenWidth) ||
        AppTheme.isMobile(screenWidth)) {
      return _buildMobileTopBar();
    }

    // Desktop - full layout
    return _buildDesktopTopBar();
  }

  Widget _buildDesktopTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          PortfolioData.location,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        HoverButton(
          text: 'Say hello\n${PortfolioData.email}',
          onPressed: UrlLauncher.launchEmail,
          textColor: colors.primaryText,
          lineColor: colors.secondaryText,
          fontSize: theme.body,
        ),
        HoverButton(
          text: isLightMode ? 'Switch to\nDark Mode': 'Switch to\nLight Mode',
          onPressed: onThemeToggle,
          textColor: colors.primaryText,
          lineColor: colors.secondaryText,
          fontSize: theme.body,
        ),
        _buildNavigationMenu(),
      ],
    );
  }

  Widget _buildMobileTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          PortfolioData.location,
          style: TextStyle(
            color: colors.primaryText,
            fontSize: theme.body,
            fontWeight: AppTheme.semiBold,
          ),
        ),
        _MobileMenu(
          colors: colors,
          theme: theme,
          onNavigationTap: onNavigationTap,
          onThemeToggle: onThemeToggle,
          isLightMode: isLightMode,
        ),
      ],
    );
  }

  Widget _buildNavigationMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: PortfolioData.navigationItems.map((item) {
        return TextButton(
          onPressed: () => onNavigationTap(item.toLowerCase()),
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            // hoverColor: Colors.transparent,
          ),
          child: Text(
            item,
            style: TextStyle(
              color: colors.primaryText,
              fontSize: theme.body,
              fontWeight: AppTheme.semiBold,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _MobileMenu extends StatefulWidget {
  final AppColors colors;
  final ResponsiveTheme theme;
  final Function(String) onNavigationTap;
  final VoidCallback onThemeToggle;
  final bool isLightMode; 

  const _MobileMenu({
    required this.colors,
    required this.theme,
    required this.onNavigationTap,
    required this.onThemeToggle,
    required this.isLightMode,
  });

  @override
  State<_MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<_MobileMenu> {
  void _openFullScreenMenu() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Menu',
      barrierColor: Colors.transparent,
      transitionDuration: AppTheme.animationDuration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return _FullScreenMenu(
          colors: widget.colors,
          theme: widget.theme,
          onNavigationTap: widget.onNavigationTap,
          onThemeToggle: () => widget.onThemeToggle(),
          onClose: () => Navigator.of(context).pop(),
          isLightMode: widget.isLightMode,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      text: 'Menu',
      onPressed: _openFullScreenMenu,
      textColor: widget.colors.primaryText,
      lineColor: widget.colors.secondaryText,
      fontSize: widget.theme.body,
    );
  }
}

class _FullScreenMenu extends StatelessWidget {
  final AppColors colors;
  final ResponsiveTheme theme;
  final Function(String) onNavigationTap;
  final VoidCallback onThemeToggle;
  final VoidCallback onClose;
  final bool isLightMode; 

  const _FullScreenMenu({
    required this.colors,
    required this.theme,
    required this.onNavigationTap,
    required this.onThemeToggle,
    required this.onClose,
    required this.isLightMode, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: theme.pagePadding,
          child: Column(
            children: [
              // Close button row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  HoverButton(
                    text: 'CLOSE',
                    onPressed: onClose,
                    textColor: colors.primaryText,
                    lineColor: colors.secondaryText,
                    fontSize: theme.body,
                  ),
                ],
              ),

              // Content (nav + actions) fills remaining space
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      // Navigation items (stacked vertically)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: PortfolioData.navigationItems.map((item) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: theme.spacingS / 2,
                            ),
                            child: TextButton(
                              onPressed: () {
                                onNavigationTap(item.toLowerCase());
                                onClose();
                              },
                              style: ButtonStyle(
                                overlayColor: WidgetStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: colors.primaryText,
                                  fontSize: theme.sectionTitle,
                                  fontWeight: AppTheme.semiBold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      Spacer(),

                      // Action buttons (centered row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HoverButton(
                            text: 'Say hello\n${PortfolioData.email}',
                            onPressed: () {
                              UrlLauncher.launchEmail();
                              // optionally close the menu
                              // onClose();
                            },
                            textColor: colors.primaryText,
                            lineColor: colors.secondaryText,
                            fontSize: theme.body,
                          ),
                          SizedBox(width: theme.spacingXL),
                          HoverButton(
                            text: isLightMode ? 'Switch to\nDark Mode': 'Switch to\nLight Mode',
                            onPressed: () {
                              onThemeToggle();
                              onClose();
                            },
                            textColor: colors.primaryText,
                            lineColor: colors.secondaryText,
                            fontSize: theme.body,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
