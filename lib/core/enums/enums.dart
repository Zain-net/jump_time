import 'package:flutter/material.dart';

enum PlayingMethod {
  money('المبلغ', Icon(Icons.attach_money_rounded)),
  time('الوقت', Icon(Icons.av_timer)),
  unlimited('مفتوح', Icon(Icons.local_fire_department_outlined));

  const PlayingMethod(this.label, this.icon);
  final String label;
  final Widget icon;
}

enum PlayerPhotoSource { asset, picked }

enum PlayerStatus {
  playing('يلعب'),
  finished('انتهى'),
  waiting('ينتظر');

  const PlayerStatus(this.status);
  final String status;
}
