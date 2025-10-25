import 'package:flutter/material.dart';

extension Themes on BuildContext {
  TextTheme get textTheme => TextTheme.of(this);
}

extension Numbers on String {
  int get toInt => int.tryParse(this) ?? 0;
}

extension DurationFormat on Duration {
  String get format {
    final hours = inHours.toString().length < 2 ? '0$inHours' : '$inHours';
    final minutes = inMinutes.toString().length < 2
        ? '0$inMinutes'
        : '$inMinutes';
    final seconds = inSeconds.toString().length < 2
        ? '0$inSeconds'
        : '$inSeconds';
    return '$hours:$minutes:$seconds';
  }
}
