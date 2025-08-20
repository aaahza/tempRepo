import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color lineColor;
  final bool withArrow;
  final double fontSize;
  final double lineHeight;

  const HoverButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.lineColor,
    this.withArrow = false,
    this.fontSize = AppTheme.body,
    this.lineHeight = 3,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;
  final GlobalKey _contentKey = GlobalKey();
  double _contentWidth = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = _contentKey.currentContext?.size;
      if (size != null) {
        setState(() {
          _contentWidth = size.width;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() => _isHovering = true),
      onExit: (event) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ButtonText(key: _contentKey, widget: widget),
            const SizedBox(height: AppTheme.spacingXS),
            _UnderLine(
              contentWidth: _contentWidth,
              isHovering: _isHovering,
              widget: widget,
            ),
          ],
        ),
      ),
    );
  }
}

class _UnderLine extends StatelessWidget {
  const _UnderLine({
    required this.contentWidth,
    required this.isHovering,
    required this.widget,
  });

  final double contentWidth;
  final bool isHovering;
  final HoverButton widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: AppTheme.animationDuration,
          curve: Curves.easeOut,
          width: contentWidth,
          height: 3,
          color: widget.lineColor,
        ),
        AnimatedContainer(
          duration: AppTheme.animationDuration,
          curve: Curves.easeOut,
          width: isHovering ? contentWidth : 0,
          height: widget.lineHeight,
          color: widget.textColor,
        ),
      ],
    );
  }
}

class _ButtonText extends StatelessWidget {
  final HoverButton widget;

  const _ButtonText({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    if (widget.withArrow) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.fontSize,
              fontWeight: AppTheme.semiBold,
            ),
          ),
          const SizedBox(width: AppTheme.spacingXS),
          Icon(
            Icons.arrow_outward,
            color: widget.textColor,
            size: 18,
          ),
        ],
      );
    } else {
      return Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize,
          fontWeight: AppTheme.semiBold,
        ),
      );
    }
  }
}
