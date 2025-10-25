import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
import '../../../../core/routes/app_routes.dart';
import '../controller/player_controller.dart';
import '../widget/player_card.dart';

class PlayersListScreen extends StatelessWidget {
  const PlayersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconedButton(
            onPressed: () =>
                Navigator.pushNamed(context, ViewRoute.addPlayer.routeName),
            icon: const Icon(Icons.add),
            label: 'أضف لاعب جديد',
          ),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final playersList = ref.watch(playerProvider).players;
                return ListView.separated(
                  itemBuilder: (_, index) =>
                      PlayerCard(playersList.elementAt(index)),
                  separatorBuilder: (_, _) => const Divider(
                    height: 50,
                    thickness: 1.2,
                    indent: 100,
                    endIndent: 100,
                    color: Color(0x21020934),
                  ),
                  itemCount: playersList.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
