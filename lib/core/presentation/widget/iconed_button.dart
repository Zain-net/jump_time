import 'package:flutter/material.dart';

class IconedButton extends StatelessWidget {
  const IconedButton({
    super.key,
    this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor, this.borderRadius,
  });

  final VoidCallback? onPressed;
  final String label;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed?.call(),

      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: borderRadius!=null?  RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius!)): null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 8), Text(label)],
      ),
    );
  }
}
