import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/presentation/widget/custom_form_field.dart';
import '../../../../core/presentation/widget/iconed_button.dart';
import '../controller/player_controller.dart';

class PlayingStyleForm extends StatefulWidget {
  const PlayingStyleForm({
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

  @override
  State<PlayingStyleForm> createState() => _PlayingStyleFormState();
}

class _PlayingStyleFormState extends State<PlayingStyleForm> {
  Widget _buildTab(PlayingMethod playingMethod, WidgetRef ref) {
    final selectedMethod = ref.watch(playerProvider).readyPlayer.playingMethod;

    final tabIndex = playingMethod.index;

    return IconedButton(
      label: playingMethod.label,
      icon: playingMethod.icon,
      onPressed: () {
        widget.tabController.animateTo(tabIndex);

        ref.read(playerProvider.notifier).changePlayingMethod(playingMethod);
      },
      backgroundColor: selectedMethod == playingMethod
          ? null
          : const Color(0xFFE7EEF4).withOpacity(.5),
      foregroundColor: selectedMethod == playingMethod
          ? null
          : const Color(0xFF41677F).withOpacity(0.5),
    );
  }

  List<Widget> _buildTabs(WidgetRef ref) {
    final tabs = PlayingMethod.values.map((t) => _buildTab(t, ref)).toList();
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 30,
      children: [
        Consumer(
          builder: (context, ref, _) {
            return Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildTabs(ref),
            );
          },
        ),

        SizedBox(
          height: 80,
          child: TabBarView(
            controller: widget.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: CustomFormField(
                      controller: widget.playingMoneyController,
                      hintText: '500',
                      helperText: 'أقصى مبلغ هو 5000 ريال',
                      maxLength: 4,
                      textInputType: const TextInputType.numberWithOptions(),

                      validator: (value) {
                        final isSelected =
                            widget.tabController.index ==
                            PlayingMethod.money.index;
                        if (!isSelected) return null;

                        final isEmpty = value?.isEmpty ?? true;
                        if (isEmpty) return 'يجب إدخال مبلغ اللعب أولا';

                        final digits = RegExp(r'^[0-9]+$');
                        if (!digits.hasMatch(value!)) {
                          return 'الرجاء إدخال أرقام موجبة فقط';
                        }

                        if (int.parse(value) > 5000) {
                          return 'لا يمكن إدخال مبلغ أكثر من 5000 ريال';
                        }

                        return null;
                      },
                    ),
                  ),
                  const Text('ريال'),
                ],
              ),

              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: CustomFormField(
                      controller: widget.playingTimeController,
                      hintText: '10',
                      helperText: 'اقصى دقائق هي 90 دقيقة',
                      maxLength: 2,
                      textInputType: const TextInputType.numberWithOptions(),
                      validator: (value) {
                        final isSelected =
                            widget.tabController.index ==
                            PlayingMethod.time.index;
                        if (!isSelected) return null;

                        final isEmpty = value?.isEmpty ?? true;
                        if (isEmpty) return 'يجب إدخال زمن اللعب أولا';

                        final digits = RegExp(r'^[0-9]+$');
                        if (!digits.hasMatch(value!)) {
                          return 'الرجاء إدخال أرقام موجبة فقط';
                        }

                        if (int.parse(value) > 90) {
                          return 'لايمكن أن تزيد الدقائق عن 90 دقيقة';
                        }

                        return null;
                      },
                    ),
                  ),
                  const Text('دقائق'),
                ],
              ),

              const Center(child: Text('تم اختيار مفتوح')),
            ],
          ),
        ),
      ],
    );
  }
}
