import 'package:custom_snackbar_plus/custom_snackbar_plus.dart';
import 'package:flutter/material.dart';

enum MessageType {
  
  
  error(Icons.dnd_forwardslash_outlined, Colors.redAccent, SnackbarType.error ),
  warning(Icons.warning_rounded, Colors.cyan, SnackbarType.warning),
  success(Icons.check_circle_outline_rounded, Color(0xFF69BD0A), SnackbarType.success);

  const MessageType(this.icon, this.color,this.type);
  final IconData icon;
  final Color color;
  final SnackbarType type;
}
