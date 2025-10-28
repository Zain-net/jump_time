import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/presentation/widget/custom_form_field.dart';
import '../validators/validators.dart';
import 'custom_tab.dart';

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
  int get currentTab => widget.tabController.index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 30,
      children: [
        Consumer(
          builder: (_, ref, __) {
            final tabs = PlayingMethod.values
                .map(
                  (method) => CustomTab(
                    playingMethod: method,
                    tabController: widget.tabController,
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

                      validator: (value) =>
                          playingMoneyValidator(value, currentTab),
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
                      validator: (value) =>
                          playingTimeValidator(value, currentTab),
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
