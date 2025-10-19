import 'package:flutter/material.dart';

class IconedButton extends StatelessWidget {
  const IconedButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 8), Text(label)],
      ),
    );
  }
}
