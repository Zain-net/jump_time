import '../../domain/entities/player_entity.dart';

class PlayerState {
  PlayerState({required this.readyPlayer, required this.players});

  factory PlayerState.empty() {
    return PlayerState(readyPlayer: PlayerEntity.empty(), players: {});
  }

  final Set<PlayerEntity> players;
  final PlayerEntity readyPlayer;

  PlayerState copyWith({
    Set<PlayerEntity>? players,
    PlayerEntity? readyPlayer,
  }) {
    return PlayerState(
      players: players ?? this.players,
      readyPlayer: readyPlayer ?? this.readyPlayer,
    );
  }
}
