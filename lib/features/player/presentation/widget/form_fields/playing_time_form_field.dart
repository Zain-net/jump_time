import 'package:flutter/material.dart';

import '../../../../../core/presentation/widget/custom_form_field.dart';
import '../../validators/validators.dart';


class PlayingTimeFormField extends StatelessWidget {
  const PlayingTimeFormField({
    super.key,
    required this.playingTimeController,
    required this.currentTab,
  });

  final TextEditingController playingTimeController;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: CustomFormField(
            controller: playingTimeController,
            hintText: '10',
            helperText: 'اقصى دقائق هي 90 دقيقة',
            maxLength: 2,
            textInputType: const TextInputType.numberWithOptions(),
            validator: (value) => playingTimeValidator(value, currentTab),
          ),
        ),
        const Text('دقائق'),
      ],
    );
  }
}
