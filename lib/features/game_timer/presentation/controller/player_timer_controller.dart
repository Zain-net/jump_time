import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../player/presentation/controller/player_controller.dart';

class PlayerTimerNotifier extends StateNotifier<Map<int, Timer>> {
  PlayerTimerNotifier(this.playerRef) : super({});

  final Ref playerRef;

  void startTimer(int playerId) {
    final playersTimers = {...state};
    final players = playerRef.read(playerProvider).players;

    playersTimers[playerId] = Timer.periodic(const Duration(seconds: 1), (
      timer,
    ) {
      final player = players.firstWhere((p) => p.id == playerId);
      players.remove(player);

      if (player.remainigTime.inSeconds <= 0) return timer.cancel();

      final updatedPlayer = player.copyWith(
        remainigTime: _decreaseSecond(player.remainigTime),
      );

      players.add(updatedPlayer);

      state = playersTimers;
    });
  }

  Duration _decreaseSecond(Duration duration) {
    return Duration(seconds: duration.inSeconds - 1);
  }
}

final playerTimerProvider =
    StateNotifierProvider<PlayerTimerNotifier, Map<int, Timer>>((ref) {
      return PlayerTimerNotifier(ref);
    });
