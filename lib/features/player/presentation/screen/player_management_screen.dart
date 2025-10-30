import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
import '../controller/player_controller.dart';
import '../widget/player_manage/player_avatar.dart';

class PlayerManagementScreen extends StatelessWidget {
  const PlayerManagementScreen(this.playerId, {super.key});
  final int playerId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدارة اللاعب')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Consumer(
              builder: (context, ref, child) {
                final playerPhoto = ref.watch(
                  playerProvider.select(
                    (state) => state.players[playerId]!.playerPhoto,
                  ),
                );

                return CircleAvatar(
                  radius: 30,
                  child: PlayerAvatar(playerPhoto),
                );
              },
            ),

            Consumer(
              builder: (context, ref, child) {
                final playerName = ref.watch(
                  playerProvider.select(
                    (state) => state.players[playerId]!.name,
                  ),
                );

                return Text(
                  playerName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            Column(
              children: [
                const Text('الوقت المتبقي'),
                Consumer(
                  builder: (context, ref, child) {
                    final remainingTime = ref.watch(
                      playerProvider.select(
                        (state) =>
                            state.players[playerId]?.remainigTime ??
                            Duration.zero,
                      ),
                    );
                    final totalDuration = ref.watch(
                      playerProvider.select(
                        (state) =>
                            state.players[playerId]?.totalDuration ??
                            Duration.zero,
                      ),
                    );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinearProgressIndicator(
                          value:
                              remainingTime.inMilliseconds /
                              totalDuration.inMilliseconds,
                          backgroundColor: const Color(0xACE0E0E0),
                          color: const Color(0xFF1C1D1E),
                        ),

                        Text(remainingTime.format),
                      ],
                    );
                  },
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconedButton(
                  label: 'ايقاف مؤقت',
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    // TODO: Pause Time Playing of the player
                  },
                ),
                IconedButton(
                  label: 'إنهاء',
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    // TODO: Finish Playing Time
                  },
                ),
              ],
            ),

            const IconedButton(
              label: 'تمديد فترة اللعب',
              icon: Icon(Icons.restore),
            ),
          ],
        ),
      ),
    );
  }
}
