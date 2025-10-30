import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../player/domain/entities/player_entity.dart';
import '../../../player/domain/entities/player_status.dart';
import '../../../player/domain/entities/playing_method.dart';
import '../../../player/presentation/controller/player_controller.dart';

class PlayerTimerNotifier extends StateNotifier<Map<int, Timer>> {
  PlayerTimerNotifier(this.ref) : super({});

  final Ref ref;

  void startTimer(PlayerEntity player) {
    // إذا كان اللاعب لديه تايمر بالفعل، لا تنشئ واحد جديد
    if (state.containsKey(player.id)) return;

    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final players = ref.watch(playerProvider).players;

      final currentPlayer = players.firstWhere(
        (p) => p.id == player.id,
        orElse: () => player,
      );

      final remainig = currentPlayer.remainigTime;
      if (currentPlayer.playingMethod != PlayingMethod.unlimited &&
          remainig != null &&
          remainig.inSeconds <= 0) {
        stopTimer(player.id);
        return;
      }

      final updatedPlayer = currentPlayer.copyWith(
        remainigTime: _decreaseSecond(currentPlayer.remainigTime!),
        elapsedTime: _increaseSecond(currentPlayer.elapsedTime),
      );

      ref.read(playerProvider.notifier).addPlayer(updatedPlayer);
    });

    final updatedPlayer = player.copyWith(playerState: PlayerStatus.playing);
    ref.read(playerProvider.notifier).addPlayer(updatedPlayer);

    state = {...state, updatedPlayer.id: timer};
  }

  Duration _decreaseSecond(Duration duration) {
    return Duration(seconds: duration.inSeconds - 1);
  }

  Duration _increaseSecond(Duration duration) {
    return Duration(seconds: duration.inSeconds + 1);
  }

  void stopTimer(int playerId) {
    final copiedTimers = {...state};
    copiedTimers[playerId]?.cancel();

    copiedTimers.remove(playerId);

    state = copiedTimers;
  }
}

final playerTimerProvider =
    StateNotifierProvider<PlayerTimerNotifier, Map<int, Timer>>(
      PlayerTimerNotifier.new,
    );
