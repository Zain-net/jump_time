import 'package:equatable/equatable.dart';

import '../../../../core/enums/enums.dart';
import 'player_photo.dart';

class PlayerEntity extends Equatable {
  const PlayerEntity({
    required this.name,
    required this.playerPhoto,
    required this.playingStateMethod,
  });

  factory PlayerEntity.empty() {
    return const PlayerEntity(
      name: '',
      playerPhoto: PlayerPhoto(photoSource: PlayerPhotoSource.asset),
      playingStateMethod: PlayingMethod.money,
    );
  }

  final String name;
  final PlayerPhoto playerPhoto;
  final PlayingMethod playingStateMethod;

  PlayerEntity copyWith({
    String? name,
    PlayerPhoto? playerPhoto,
    PlayingMethod? playingStateMethod,
  }) {
    return PlayerEntity(
      name: name ?? this.name,
      playerPhoto: playerPhoto ?? this.playerPhoto,
      playingStateMethod: playingStateMethod ?? this.playingStateMethod,
    );
  }

  @override
  List<Object?> get props => [name, playerPhoto, playingStateMethod];
}
