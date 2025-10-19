import 'package:flutter/material.dart';

class IconedButton extends StatelessWidget {
  const IconedButton({
    super.key,
    this.onPressed,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
  });

  final VoidCallback? onPressed;
  final String label;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=> onPressed?.call(),

      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 8), Text(label)],
      ),
    );
  }
}
