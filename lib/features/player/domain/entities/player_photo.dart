import 'package:equatable/equatable.dart';

import '../../../../core/enums/enums.dart';

class PlayerPhoto extends Equatable {
  const PlayerPhoto({this.path, required this.photoSource});

  factory PlayerPhoto.asset() {
    return const PlayerPhoto(photoSource: PlayerPhotoSource.asset);
  }

  final String? path;
  final PlayerPhotoSource photoSource;

  PlayerPhoto copyWith({String? path, PlayerPhotoSource? photoSource}) {
    return PlayerPhoto(
      path: path ?? this.path,
      photoSource: photoSource ?? this.photoSource,
    );
  }

  @override
  List<Object?> get props => [path, photoSource];
}
