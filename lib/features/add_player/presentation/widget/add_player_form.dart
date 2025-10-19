import 'package:flutter/material.dart';

import '../../../../core/extensions/extensions.dart';
import '../../../../core/presentation/widget/iconed_button.dart';

class AddPlayerForm extends StatefulWidget {
  const AddPlayerForm({super.key});

  @override
  State<AddPlayerForm> createState() => _AddPlayerFormState();
}

class _AddPlayerFormState extends State<AddPlayerForm>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final playerNameController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {});
  }

  @override
  void dispose() {
    playerNameController.dispose();
    tabController.dispose();
    super.dispose();
  }

  Widget _buildTab({
    required String label,
    required Widget icon,
    required int tabIndex,
  }) {
    return IconedButton(
      label: label,
      icon: icon,
      backgroundColor: tabController.index == tabIndex
          ? null
          : const Color(0xFFE7EEF4).withOpacity(.5),
      foregroundColor: tabController.index == tabIndex
          ? null
          : const Color(0xFF41677F).withOpacity(0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    final tabs = [
      _buildTab(
        label: 'الوقت',
        icon: const Icon(Icons.av_timer),
        tabIndex: index++,
      ),
      _buildTab(
        label: 'الفلوس',
        icon: const Icon(Icons.attach_money_rounded),
        tabIndex: index++,
      ),
    ];

    return Form(
      key: formKey,
      child: Column(
        spacing: 30,
        children: [
          TextFormField(
            controller: playerNameController,
            style: context.textTheme.labelMedium,
            cursorColor: const Color(0xFF41677F).withOpacity(.5),
            cursorErrorColor: const Color(0xFF41677F).withOpacity(.5),
            cursorRadius: const Radius.circular(10),
            decoration: const InputDecoration(hintText: 'اسم اللاعب'),
            validator: (value) {
              final isEmpty = value?.isEmpty ?? true;
              return isEmpty ? 'يجب إدخال اسم اللاعب أولا' : null;
            },
          ),

          SizedBox(
            height: 200,

            child: Column(
              children: [
                Expanded(
                  child: TabBar(
                    controller: tabController,
                    onTap: (newIndex) => tabController.animateTo(newIndex),
                    
                    tabs: tabs,
                  ),
                ),

                Expanded(
                  child: TabBarView(
                    controller: tabController,

                    children: [
                      Center(
                        child: Container(
                          color: Colors.amberAccent,
                          child: const Text('time'),
                        ),
                      ),
                      Center(
                        child: Container(
                          color: const Color(0xFFFF4040),
                          child: const Text('money'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
