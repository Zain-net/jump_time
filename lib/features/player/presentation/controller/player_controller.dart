import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../game_timer/presentation/controller/player_timer_controller.dart';
import '../../../game_timer/presentation/controller/remainig_time_price.dart';
import '../../domain/entities/player_entity.dart';
import '../../domain/entities/player_photo.dart';
import '../../domain/entities/playing_method.dart';
import 'player_state.dart';

class PlayerNotifier extends StateNotifier<PlayerState> {
  PlayerNotifier(this.ref) : super(PlayerState.empty());

  final Ref ref;

  void addPlayer(PlayerEntity player) {
    final copiedPlayers = {...state.players};
    copiedPlayers.update(player.id, (p) => player, ifAbsent: () => player);
    state = state.copyWith(players: copiedPlayers);
  }

  void startPlaying(PlayerEntity player) {
    addPlayer(player);

    final updatedPlayer = player.copyWith(
      playingPrice: _calculatePlayingPrice(player),
      remainigTime: _calculateRemainigTime(player),
    );

    ref.read(playerTimerProvider.notifier).startTimer(updatedPlayer);
  }

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

  void changePhotoToAsset() {
    final currentPhoto = state.readyPlayer.playerPhoto;
    if (currentPhoto.isDefaultPhoto) return;

    final newPlayer = state.readyPlayer.copyWith(
      playerPhoto: PlayerPhoto.asset(),
    );

    state = state.copyWith(readyPlayer: newPlayer);
  }

  PlayerEntity? deletePlayer(int playerId) {
    final copiedPlayers = {...state.players};
    final player = copiedPlayers.remove(playerId);

    state = state.copyWith(players: copiedPlayers);

    return player;
  }

  void extendPlayerTime(int playerId){
    
  }

  int? _calculatePlayingPrice(PlayerEntity player) {
    final minutePrice = ref.read(minutePriceProvider);
    if (player.remainigTime == null &&
        player.playingMethod != PlayingMethod.money) {
      return null;
    }
    switch (player.playingMethod) {
      case PlayingMethod.money:
        return player.playingPrice;
      case PlayingMethod.time:
        return player.remainigTime!.inMinutes * minutePrice;
      case PlayingMethod.unlimited:
        return null;
    }
  }

  Duration? _calculateRemainigTime(PlayerEntity player) {
    final minutePrice = ref.read(minutePriceProvider);

    switch (player.playingMethod) {
      case PlayingMethod.money:
        return Duration(minutes: player.playingPrice! ~/ minutePrice);
      case PlayingMethod.time:
        return player.remainigTime;
      case PlayingMethod.unlimited:
        return Duration.zero;
    }
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, PlayerState>(
  PlayerNotifier.new,
);
