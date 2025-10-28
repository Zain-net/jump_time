import 'package:equatable/equatable.dart';
import '../../../../core/enums/enums.dart';
import 'player_photo.dart';

class PlayerEntity extends Equatable {
  const PlayerEntity({
    required this.id,
    required this.name,
    required this.playerPhoto,
    required this.playingMethod,
    required this.playerState,
     this.playingPrice,
     this.remainigTime,
  });

  factory PlayerEntity.empty() {
    return const PlayerEntity(
      name: '',
      id: 0,
      playerPhoto: PlayerPhoto(photoSource: PlayerPhotoSource.asset),
      playingMethod: PlayingMethod.money,
      playerState: PlayerStatus.finished,
    );
  }

  final int id;
  final String name;
  final PlayerPhoto playerPhoto;
  final PlayingMethod playingMethod;
  final PlayerStatus playerState;
  final int? playingPrice;
  final Duration? remainigTime;

  PlayerEntity copyWith({
    int? id,
    String? name,
    PlayerPhoto? playerPhoto,
    PlayingMethod? playingMethod,
    PlayerStatus? playerState,
    int? playingPrice,
    Duration? remainigTime,
  }) {
    return PlayerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      playerPhoto: playerPhoto ?? this.playerPhoto,
      playingMethod: playingMethod ?? this.playingMethod,
      playerState: playerState ?? this.playerState,
      playingPrice: playingPrice ?? this.playingPrice,
      remainigTime: remainigTime ?? this.remainigTime,
    );
  }

  @override
  List<Object?> get props => [id,name, playerPhoto];
}
