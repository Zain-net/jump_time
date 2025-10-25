import 'package:flutter/material.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/presentation/widget/custom_form_field.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
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
            child: IconedButton(
              label: 'ابدأ اللعب',
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                final isValidForm = formKey.currentState?.validate() ?? false;

                if (!isValidForm) return;

                // TODO: Make Player Starting Game
               
              },
            ),
          ),
        ],
      ),
    );
  }
}
