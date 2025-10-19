import 'package:flutter/material.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/presentation/widget/iconed_button.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/player_photo.png',

                    fit: BoxFit.cover,
                  ),
                ),
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

        const PlayerRawInfo(label: 'الاسم', value: 'محمد سالم'),
        const PlayerRawInfo(label: 'حالة اللاعب', value: 'يلعب'),
        const PlayerRawInfo(label: 'الوقت المتبقي', value: '00:05:30'),
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
