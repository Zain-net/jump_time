import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/playing_method.dart';
import '../../controller/player_controller.dart';
import '../custom_tab.dart';
import '../form_fields/money_form_field.dart';
import '../form_fields/playing_time_form_field.dart';

class PlayingMethodForm extends StatelessWidget {
  const PlayingMethodForm({
    super.key,
    required this.tabController,
    required this.formKey,
    required this.playingTimeController,
    required this.playingMoneyController,
  });

  final GlobalKey<FormState> formKey;
  final TabController tabController;
  final TextEditingController playingTimeController;
  final TextEditingController playingMoneyController;

  int get currentTab => tabController.index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 30,
      children: [
        Consumer(
          builder: (_, ref, __) {
            final tabRecentIndex = ref.watch(
              playerProvider.select(
                (state) => state.readyPlayer.playingMethod.index,
              ),
            );
            if (currentTab != tabRecentIndex) {
              tabController.animateTo(tabRecentIndex);
            }
            
            final tabs = PlayingMethod.values
                .map(
                  (method) => CustomTab(
                    playingMethod: method,
                    tabController: tabController,
                  ),
                )
                .toList();

            return Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabs,
            );
          },
        ),

        SizedBox(
          height: 80,
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              MoneyFormField(playingMoneyController: playingMoneyController, currentTab: currentTab),

              PlayingTimeFormField(playingTimeController: playingTimeController, currentTab: currentTab),

              const Center(child: Text('تم اختيار مفتوح')),
            ],
          ),
        ),
      ],
    );
  }
}

