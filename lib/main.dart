import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/presentation/screen/material_app.dart';

void main() {
  runApp(const ProviderScope(child: CustomMaterialApp()));
}
