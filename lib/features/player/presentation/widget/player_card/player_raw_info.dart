import 'package:flutter/material.dart';

import '../../../../../core/extensions/extensions.dart';

class PlayerRawInfo extends StatelessWidget {
  const PlayerRawInfo({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.labelSmall),
        Text(value, style: textTheme.labelMedium),
      ],
    );
  }
}
