import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
import '../../domain/entities/photo_source.dart';
import '../../domain/entities/player_photo.dart';
import '../controller/player_controller.dart';
import 'build_player_photo.dart';

class PlayerPhotoController extends ConsumerWidget {
  const PlayerPhotoController({super.key});

  Future<void> _pickCameraImage(WidgetRef ref) async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    final playerPhoto = PlayerPhoto(
      photoSource: PhotoSource.picked,
      path: pickedFile?.path,
    );
    ref.read(playerProvider.notifier).changePhoto(playerPhoto);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerPhoto = ref.watch(
      playerProvider.select((state) => state.readyPlayer.playerPhoto),
    );

    return Column(
      spacing: 30,
      children: [
        BuildPlayerPhoto(playerPhoto),

        SizedBox(
          height: 40,
          child: IconedButton(
            label: 'التقط صورة',
            icon: const Icon(Icons.camera_enhance_sharp),
            backgroundColor: const Color(0xFFE7EEF4).withOpacity(.5),
            foregroundColor: const Color(0xFF000000),
            onPressed: () => _pickCameraImage(ref),
          ),
        ),
      ],
    );
  }
}
