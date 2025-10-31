import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/photo_source.dart';
import '../../domain/entities/player_photo.dart';
import '../controller/player_controller.dart';

Future<void> pickCameraImage(WidgetRef ref) async {
  final imagePicker = ImagePicker();
  final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

  final playerPhoto = PlayerPhoto(
    photoSource: PhotoSource.picked,
    path: pickedFile?.path,
  );
  ref.read(playerProvider.notifier).changePhoto(playerPhoto);
}
