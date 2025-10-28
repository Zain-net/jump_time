import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/extensions/extensions.dart';

final keepScreenProvider = StateProvider((ref) => true);

class KeepScreenSwitch extends StatelessWidget {
  const KeepScreenSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'البقاء',
          style: context.textTheme.labelSmall?.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Consumer(
          builder: (_, ref, __) {
            final isAlwaysOnScreen = ref.watch(keepScreenProvider);
            return Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: isAlwaysOnScreen,
                activeColor: const Color(0xFF2094F3),
                onChanged: (value) {
                  ref.read(keepScreenProvider.notifier).state = value;
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
