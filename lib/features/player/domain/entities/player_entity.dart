import 'package:equatable/equatable.dart';
import 'player_photo.dart';
import 'player_status.dart';
import 'playing_method.dart';

class PlayerEntity extends Equatable {
  const PlayerEntity({
    required this.id,
    required this.name,
    required this.playerPhoto,
    required this.playingMethod,
    required this.playerStatus,
    this.elapsedTime = Duration.zero,
    this.playingPrice,
    this.remainigTime,
  });

  factory PlayerEntity.empty() {
    return PlayerEntity(
      name: '',
      id: 0,
      playerPhoto: PlayerPhoto.asset(),
      playingMethod: PlayingMethod.money,
      playerStatus: PlayerStatus.waiting,
    );
  }

  final int id;
  final String name;
  final PlayerPhoto playerPhoto;
  final PlayingMethod playingMethod;
  final PlayerStatus playerStatus;
  final int? playingPrice;
  final Duration? remainigTime;
  final Duration elapsedTime;

  PlayerEntity copyWith({
    int? id,
    String? name,
    PlayerPhoto? playerPhoto,
    PlayingMethod? playingMethod,
    PlayerStatus? playerState,
    int? playingPrice,
    Duration? remainigTime,
    Duration? elapsedTime,
  }) {
    return PlayerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      playerPhoto: playerPhoto ?? this.playerPhoto,
      playingMethod: playingMethod ?? this.playingMethod,
      playerStatus: playerState ?? playerStatus,
      playingPrice: playingPrice ?? this.playingPrice,
      remainigTime: remainigTime ?? this.remainigTime,
      elapsedTime: elapsedTime ?? this.elapsedTime,
    );
  }

  @override
  String toString() {
    return 'PlayerEntity( \n'
        'id: $id, \n'
        'name: $name, \n'
        'playingMethod: $playingMethod, \n'
        'playerStatus: $playerStatus, \n'
        'playingPrice: $playingPrice, \n'
        'remainigTime: $remainigTime, \n'
        'elapsedTime: $elapsedTime, \n'
        'playerPhoto: $playerPhoto \n'
        ')';
  }

  @override
  List<Object?> get props => [id, name, playerPhoto];
}
