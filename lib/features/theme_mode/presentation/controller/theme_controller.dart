import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/database/cache/cache_helper.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._cacheHelper) : super(ThemeMode.light) {
    _loadTheme();
  }

  final CacheHelper _cacheHelper;

  static const savedThemeKey = 'savedThemeKey';

  void changeTheme(ThemeMode newMode) {
    if (state == newMode) return;

    state = newMode;
    saveTheme();
  }

  void saveTheme() {
    _cacheHelper.setString(key: savedThemeKey, value: state.name);
  }

  Future<void> _loadTheme() async {
    final savedTheme = await _cacheHelper.getString(key: savedThemeKey);
    if (savedTheme == null) return;

    state = ThemeMode.values.firstWhere(
      (t) => t.name == savedTheme,
      orElse: () => ThemeMode.light,
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(
    CacheHelper(
      const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      ),
    ),
  ),
);
