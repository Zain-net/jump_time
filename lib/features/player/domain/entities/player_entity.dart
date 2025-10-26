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
    required this.cachedMoney,
    required this.remainigTime,
  });

  factory PlayerEntity.empty() {
    return const PlayerEntity(
      name: '',
      id: 0,
      playerPhoto: PlayerPhoto(photoSource: PlayerPhotoSource.asset),
      playingMethod: PlayingMethod.money,
      cachedMoney: 0,
      playerState: PlayerStatus.finished,
      remainigTime: Duration.zero,
    );
  }

  final int id;
  final String name;
  final PlayerPhoto playerPhoto;
  final PlayingMethod playingMethod;
  final PlayerStatus playerState;
  final int cachedMoney;
  final Duration remainigTime;

  PlayerEntity copyWith({
    int? id,
    String? name,
    PlayerPhoto? playerPhoto,
    PlayingMethod? playingMethod,
    PlayerStatus? playerState,
    int? cachedMoney,
    Duration? remainigTime,
  }) {
    return PlayerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      playerPhoto: playerPhoto ?? this.playerPhoto,
      playingMethod: playingMethod ?? this.playingMethod,
      playerState: playerState ?? this.playerState,
      cachedMoney: cachedMoney ?? this.cachedMoney,
      remainigTime: remainigTime ?? this.remainigTime,
    );
  }

  @override
  List<Object?> get props => [name, playerPhoto];
}
