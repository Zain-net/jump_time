import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/enums/enums.dart';
import '../../../game_timer/presentation/controller/player_timer_controller.dart';
import '../../domain/entities/player_entity.dart';
import '../../domain/entities/player_photo.dart';
import 'player_state.dart';

class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier(this.playerTimer) : super(PlayerState.empty());

  final Ref playerTimer;

  void changePlayingMethod(PlayingMethod playingMethod) {
    if (playingMethod == state.readyPlayer.playingMethod) return;

    final readyPlayer = state.readyPlayer.copyWith(
      playingMethod: playingMethod,
    );

    state = state.copyWith(readyPlayer: readyPlayer);
  }

  void changePhoto(PlayerPhoto playerPhoto) {
    if (playerPhoto.path == null) return;

    final readyPlayer = state.readyPlayer.copyWith(playerPhoto: playerPhoto);

    state = state.copyWith(readyPlayer: readyPlayer);
  }

  void addPlayer(PlayerEntity player) {
    final copiedPlayers = {...state.players};
    copiedPlayers.add(player);

    if (copiedPlayers.length == state.players.length) return;

    state = state.copyWith(players: copiedPlayers);
    
  }

  void startPlaying(PlayerEntity player, int tenMinutesPrice) {
    final minutePrice = tenMinutesPrice / 10;
    playerTimer.read(playerTimerProvider.notifier).startTimer(player.id);
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  PlayerNotifier.new,
);
