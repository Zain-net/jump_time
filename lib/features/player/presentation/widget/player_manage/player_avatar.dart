import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presentation/widget/conditional_builder.dart';
import '../../../domain/entities/photo_source.dart';
import '../../../domain/entities/player_photo.dart';
import '../../helpers/helpers.dart';

class PlayerAvatar extends ConsumerWidget {
  const PlayerAvatar(this.playerPhoto, {super.key});

  final PlayerPhoto playerPhoto;
  @override
  Widget build(BuildContext context,ref) {
    final photoWidget = switch (playerPhoto.photoSource) {
      PhotoSource.asset => const _DefaultAsset(),
      PhotoSource.picked => _PickedPhoto(playerPhoto.path),
    };

    return Stack(children: [photoWidget,PickPhotoButton(ref)]);
  }
}

class _DefaultAsset extends StatelessWidget {
  const _DefaultAsset();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/boy_jumping.jpg', fit: BoxFit.cover);
  }
}

class _PickedPhoto extends StatelessWidget {
  const _PickedPhoto(this.pickedImagePath);
  final String? pickedImagePath;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: pickedImagePath != null,
      builder: (_) => Image.file(
        File(pickedImagePath!),
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => const _DefaultAsset(),
      ),
      fallback: (_) => const _DefaultAsset(),
    );
  }
}

class PickPhotoButton extends StatelessWidget {
  const PickPhotoButton(this.ref, {super.key});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: IconButton(
        onPressed: () => pickCameraImage(ref),
        icon: const Icon(Icons.add_a_photo,size: 15,),
      ),
    );
  }
}
