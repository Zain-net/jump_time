import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/presentation/widget/iconed_button.dart';

class PlayerPhotoController extends StatefulWidget {
  const PlayerPhotoController({super.key});

  @override
  State<PlayerPhotoController> createState() => _PlayerPhotoControllerState();
}

class _PlayerPhotoControllerState extends State<PlayerPhotoController> {
  String? pickedImagePath;

  Future<void> _pickCameraImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile == null) return;

    setState(() => pickedImagePath = pickedFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      children: [
        pickedImagePath == null
            ? const _FallBackImage()
            : _PickedPhoto(pickedImagePath!),

        SizedBox(
          height: 40,
          child: IconedButton(
            label: 'التقط صورة',
            icon: const Icon(Icons.camera_enhance_sharp),
            backgroundColor: const Color(0xFFE7EEF4).withOpacity(.5),
            foregroundColor: const Color(0xFF000000),
            onPressed: _pickCameraImage,
          ),
        ),
      ],
    );
  }
}

class _FallBackImage extends StatelessWidget {
  const _FallBackImage();
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),

      child: Image.asset('assets/images/boy_jumping.jpg', fit: BoxFit.fill),
    );
  }
}

class _PickedPhoto extends StatelessWidget {
  const _PickedPhoto(this.pickedImagePath);
  final String pickedImagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),

      child: Image.file(
        File(pickedImagePath),
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => const _FallBackImage(),
      ),
    );
  }
}
