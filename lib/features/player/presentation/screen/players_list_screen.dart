import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/player_controller.dart';
import '../widget/add_player_button.dart';
import '../widget/nothing_players.dart';
import '../widget/player_card/player_card.dart';

class PlayersListScreen extends ConsumerWidget {
  const PlayersListScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isPlayersEmpty = ref.watch(
      playerProvider.select((state) => state.players.isEmpty),
    );

    if (isPlayersEmpty) return const NothingPlayers();

    final playersCount = ref.watch(
      playerProvider.select((state) => state.players.length),
    );

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AddPlayerButton(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) {
                final playerId = ref
                    .read(playerProvider)
                    .players
                    .values
                    .elementAt(index)
                    .id;
                return PlayerCard(playerId);
              },
              separatorBuilder: (_, _) => const SizedBox(height: 50),
              itemCount: playersCount,
            ),
          ),
        ],
      ),
    );
  }
}
