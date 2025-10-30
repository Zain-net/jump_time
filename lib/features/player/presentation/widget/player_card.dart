import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
import '../../domain/entities/player_entity.dart';
import '../controller/player_controller.dart';
import 'build_player_photo.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.index,
    required this.playerEntity,
  });
  final PlayerEntity playerEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 20,
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: BuildPlayerPhoto(playerEntity.playerPhoto),
              ),
              Positioned(
                bottom: 15,
                right: 15,
                child: SizedBox(
                  height: 45,

                  child: IconedButton(
                    onPressed: () {
                      // TODO: Go to Manage Player Screen
                    },
                    label: 'إدارة',
                    icon: const Icon(Icons.manage_accounts),
                  ),
                ),
              ),
            ],
          ),
        ),

        PlayerRawInfo(label: 'الاسم', value: playerEntity.name),
        Consumer(
          builder: (_, ref, __) {
            final playerStatus = ref.watch(
              playerProvider.select(
                (state) => state.players.elementAt(index).playerStatus,
              ),
            );
            return PlayerRawInfo(
              label: 'حالة اللاعب',
              value: playerStatus.status,
            );
          },
        ),
        Consumer(
          builder: (_, ref, __) {
            final remainigTime = ref.watch(
              playerProvider.select(
                (state) => state.players.elementAt(index).remainigTime,
              ),
            );
            return PlayerRawInfo(
              label: 'الوقت المتبقي',
              value: remainigTime?.format ?? '00:00:00',
            );
          },
        ),
        Consumer(
          builder: (_, ref, __) {
            final elapsedTime = ref.watch(
              playerProvider.select(
                (state) => state.players.elementAt(index).elapsedTime,
              ),
            );
            return PlayerRawInfo(
              label: 'الوقت المنقضي',
              value: elapsedTime.format,
            );
          },
        ),
      ],
    );
  }
}

class PlayerRawInfo extends StatelessWidget {
  const PlayerRawInfo({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.labelSmall),
        Text(value, style: textTheme.labelMedium),
      ],
    );
  }
}
