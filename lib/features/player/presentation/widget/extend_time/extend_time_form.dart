import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/extensions/extensions.dart';
import '../../../../../core/presentation/widget/iconed_button.dart';
import '../../../../game_timer/presentation/controller/player_timer_controller.dart';
import '../../../domain/entities/playing_method.dart';
import '../../../domain/entities/time_extend_entity.dart';
import '../../controller/player_controller.dart';
import '../custom_tab.dart';
import '../form_fields/money_form_field.dart';
import '../form_fields/playing_time_form_field.dart';

class ExtendTimeForm extends StatefulWidget {
  const ExtendTimeForm(this.playerId, {super.key});
  final int playerId;

  @override
  State<ExtendTimeForm> createState() => _ExtendTimeFormState();
}

class _ExtendTimeFormState extends State<ExtendTimeForm>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  final playingTimeController = TextEditingController();
  final playingMoneyController = TextEditingController();
  PlayingMethod extendMethod = PlayingMethod.money;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: PlayingMethod.values.length - 1,
      vsync: this,
    );
  }

  @override
  void dispose() {
    playingTimeController.dispose();
    playingMoneyController.dispose();
    tabController.dispose();
    super.dispose();
  }

  int get currentTab => tabController.index;
  int get playerId => widget.playerId;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Builder(
            builder: (_) {
              final timeExtendMethods = PlayingMethod.values
                ..remove(PlayingMethod.unlimited);

              final tabs = timeExtendMethods
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
                MoneyFormField(
                  playingMoneyController: playingMoneyController,
                  currentTab: currentTab,
                ),

                PlayingTimeFormField(
                  playingTimeController: playingTimeController,
                  currentTab: currentTab,
                ),
              ],
            ),
          ),

          Consumer(
            builder: (context, ref, child) {
              return IconedButton(
                onPressed: () {
                  final isValidForm = formKey.currentState?.validate() ?? false;

                  if (!isValidForm) return;

                  final controller = ref.read(playerProvider.notifier);
                  final player = ref.read(playerProvider).players[playerId];
                  if (player == null) return;

                  final extendParams = TimeExtendEntity(
                    extendType: ref
                        .read(playerProvider)
                        .readyPlayer
                        .playingMethod,
                    minutes: playingTimeController.text.toInt ?? 0,
                    money: playingMoneyController.text.toInt ?? 0,
                  );

                  controller.extendPlayerTime(player, extendParams);
                },
                icon: const Icon(Icons.restore_outlined),
                label: 'تمديد اللعب',
              );
            },
          ),
        ],
      ),
    );
  }
}
