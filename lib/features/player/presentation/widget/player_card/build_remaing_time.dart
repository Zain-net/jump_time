import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/extensions/extensions.dart';
import '../../controller/player_controller.dart';
import 'player_raw_info.dart';

class BuildRemainingTime extends StatelessWidget {
  const BuildRemainingTime(this.playerId, {super.key});
  final int playerId;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final remainingTime = ref.watch(
          playerProvider.select(
            (state) => state.players[playerId]?.remainigTime ?? Duration.zero,
          ),
        );

        return PlayerRawInfo(
          label: 'الوقت المتبقي',
          value: remainingTime.format,
        );
      },
    );
  }
}
