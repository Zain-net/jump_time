import 'package:flutter/material.dart';

import '../../../../core/presentation/widget/iconed_button.dart';
import '../widget/player_card.dart';

class KidsListScreen extends StatelessWidget {
  const KidsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playersList = List.generate(20, (_) => const PlayerCard());

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconedButton(
            onPressed: () {
              // TODO: Add New Player
            },
            icon: const Icon(Icons.add),
            label: 'أضف لاعب جديد',
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => playersList[index],
              separatorBuilder: (_, _) => const Divider(
                height: 50,
                thickness: 1.2,
                indent: 100,
                endIndent: 100,
                color: Color(0x21020934),
              ),
              itemCount: playersList.length,
            ),
          ),
        ],
      ),
    );
  }
}
