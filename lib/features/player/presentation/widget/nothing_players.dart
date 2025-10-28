import 'package:flutter/material.dart';

import '../../../../core/extensions/extensions.dart';
import 'add_player_button.dart';

class NothingPlayers extends StatelessWidget {
  const NothingPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    const nothingImagePath = 'assets/images/nothing_players.png';
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(nothingImagePath, height: 250),
          const SizedBox(height: 20),
          Text(
            'لم يتم إضافة لاعبين بعد!',
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall,
          ),
          const SizedBox(height: 40),
          const AddPlayerButton(),
        ],
      ),
    );
  }
}
