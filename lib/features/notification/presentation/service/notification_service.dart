import 'package:custom_snackbar_plus/custom_snackbar_plus.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/snackbar_params.dart';

class NotificationService {
  NotificationService._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static void showMessage(SnackBarParams params) {
    if (navigatorKey.currentContext == null) return;
    if (!navigatorKey.currentContext!.mounted) return;
    CustomSnackbar.show(
      context: navigatorKey.currentContext!,
      title: params.msg,
      label: '',
      mode: NotificationMode.auto,
      type: params.type.type,
    );
  }
}
