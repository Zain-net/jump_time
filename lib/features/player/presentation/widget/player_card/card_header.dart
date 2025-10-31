import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/presentation/widget/iconed_button.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../domain/entities/player_photo.dart';
import '../../controller/player_controller.dart';
import '../build_player_photo.dart';

class PlayerCardHeader extends StatelessWidget {
  const PlayerCardHeader({super.key, required this.playerId});

  final int playerId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final playerPhoto = ref.watch(
                playerProvider.select(
                  (state) =>
                      state.players[playerId]?.playerPhoto ??
                      PlayerPhoto.asset(),
                ),
              );
              return Positioned.fill(child: BuildPlayerPhoto(playerPhoto));
            },
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: SizedBox(
              height: 45,

              child: IconedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ViewRoute.playerManagement.routeName,
                    arguments: playerId,
                  );
                },
                label: 'إدارة',
                icon: const Icon(Icons.manage_accounts),
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final playingMethod = ref.watch(
                playerProvider.select(
                  (state) => state.players[playerId]?.playingMethod,
                ),
              );
              return playingMethod != null
                  ? Positioned(
                      bottom: 15,
                      left: 15,
                      child: SizedBox(
                        height: 45,

                        child: IconedButton(
                          onPressed: () {},
                          label: playingMethod.label,
                          icon: playingMethod.icon,
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
