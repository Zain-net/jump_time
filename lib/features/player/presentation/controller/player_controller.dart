import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/enums/enums.dart';
import '../../domain/entities/player_entity.dart';
import '../../domain/entities/player_photo.dart';
import 'player_state.dart';

class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier() : super(PlayerState.empty());

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
}

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  (ref) => PlayerNotifier(),
);
