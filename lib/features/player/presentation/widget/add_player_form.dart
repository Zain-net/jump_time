import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/presentation/domain/id_generator.dart';
import '../../../../core/presentation/widget/custom_form_field.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
import '../../domain/entities/player_entity.dart';
import '../controller/player_controller.dart';
import 'playing_style_form.dart';

class AddPlayerForm extends StatefulWidget {
  const AddPlayerForm({super.key});

  @override
  State<AddPlayerForm> createState() => _AddPlayerFormState();
}

class _AddPlayerFormState extends State<AddPlayerForm>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  final playerNameController = TextEditingController();
  final playingTimeController = TextEditingController();
  final playingMoneyController = TextEditingController();

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: PlayingMethod.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    playerNameController.dispose();
    playingTimeController.dispose();
    playingMoneyController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 30,
        children: [
          CustomFormField(
            controller: playerNameController,
            hintText: 'اسم اللاعب',
            validator: (value) {
              final isEmpty = value?.isEmpty ?? true;
              return isEmpty ? 'يجب إدخال اسم اللاعب أولا' : null;
            },
          ),

          PlayingStyleForm(
            formKey: formKey,
            playingMoneyController: playingMoneyController,
            playingTimeController: playingTimeController,
            tabController: tabController,
          ),

          SizedBox(
            width: double.infinity,
            child: Consumer(
              builder: (context, ref, child) {
                final controller = ref.read(playerProvider.notifier);
                return IconedButton(
                  label: 'ابدأ اللعب',
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    final isValidForm =
                        formKey.currentState?.validate() ?? false;

                    if (!isValidForm) return;

                    final readyPlayer = ref.read(playerProvider).readyPlayer;

                    final remainigMinutes = playingTimeController.text.toInt;
                    final remainigTime = remainigMinutes != null
                        ? Duration(minutes: remainigMinutes)
                        : null;

                    final player = PlayerEntity(
                      id: IdGenerator.nextId,
                      name: playerNameController.text,
                      playerPhoto: readyPlayer.playerPhoto,
                      playingMethod: readyPlayer.playingMethod,
                      playerState: readyPlayer.playerState,
                      playingPrice: playingMoneyController.text.toInt,
                      remainigTime: remainigTime,
                    );

                    controller.addPlayer(player);
                    controller.startPlaying(player);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
