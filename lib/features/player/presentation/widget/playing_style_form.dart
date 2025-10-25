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
  Widget _buildTab(PlayingMethod playingMethod) {
    final selectedIndex = widget.tabController.index;
    final tabIndex = playingMethod.index;

    return IconedButton(
      label: playingMethod.label,
      icon: playingMethod.icon,
      onPressed: () {
        widget.tabController.animateTo(tabIndex);

        final container = ProviderScope.containerOf(context);
        container
            .read(playerProvider.notifier)
            .changePlayingMethod(playingMethod);
      },
      backgroundColor: selectedIndex == tabIndex
          ? null
          : const Color(0xFFE7EEF4).withOpacity(.5),
      foregroundColor: selectedIndex == tabIndex
          ? null
          : const Color(0xFF41677F).withOpacity(0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabs = PlayingMethod.values.map(_buildTab).toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 30,
      children: [
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabs,
        ),

        SizedBox(
          height: 80,
          child: Consumer(
            builder: (context, ref, child) {
              return TabBarView(
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
                          textInputType:
                              const TextInputType.numberWithOptions(),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
