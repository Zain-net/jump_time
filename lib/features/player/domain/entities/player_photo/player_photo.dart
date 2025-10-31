import 'package:equatable/equatable.dart';
import 'photo_source.dart';

class PlayerPhoto extends Equatable {
  const PlayerPhoto({this.path, required this.photoSource});

  factory PlayerPhoto.asset() {
    return const PlayerPhoto(photoSource: PhotoSource.asset);
  }

  final String? path;
  final PhotoSource photoSource;

  PlayerPhoto copyWith({String? path, PhotoSource? photoSource}) {
    return PlayerPhoto(
      path: path ?? this.path,
      photoSource: photoSource ?? this.photoSource,
    );
  }

  bool get isDefaultPhoto => photoSource == PhotoSource.asset;

  @override
  List<Object?> get props => [path, photoSource];
}
