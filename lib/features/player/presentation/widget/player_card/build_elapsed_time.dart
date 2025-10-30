import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/extensions.dart';
import '../../controller/player_controller.dart';
import 'player_raw_info.dart';

class BuildElapsedTime extends StatelessWidget {
  const BuildElapsedTime(this.playerId, {super.key});
  final int playerId;
  
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final elapsedTime = ref.watch(
          playerProvider.select(
            (state) => state.players[playerId]?.elapsedTime,
          ),
        );
        return PlayerRawInfo(
          label: 'الوقت المنقضي',
          value: elapsedTime?.format ?? '00:00:00',
        );
      },
    );
  }
}
