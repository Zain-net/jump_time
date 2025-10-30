import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/presentation/widget/conditional_builder.dart';
import '../../../domain/entities/photo_source.dart';
import '../../../domain/entities/player_photo.dart';

class PlayerAvatar extends StatelessWidget {
  const PlayerAvatar(this.playerPhoto, {super.key});

  final PlayerPhoto playerPhoto;
  @override
  Widget build(BuildContext context) {
    return switch (playerPhoto.photoSource) {
      PhotoSource.asset => const _DefaultAsset(),
      PhotoSource.picked => _PickedPhoto(playerPhoto.path),
    };
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
