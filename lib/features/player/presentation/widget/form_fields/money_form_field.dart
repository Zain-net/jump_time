import 'package:flutter/material.dart';

import '../../../../../core/presentation/widget/custom_form_field.dart';
import '../../validators/validators.dart';

class MoneyFormField extends StatelessWidget {
  const MoneyFormField({
    super.key,
    required this.playingMoneyController,
    required this.currentTab,
  });

  final TextEditingController playingMoneyController;
  final int currentTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: CustomFormField(
            controller: playingMoneyController,
            hintText: '500',
            helperText: 'أقصى مبلغ هو 5000 ريال',
            maxLength: 4,
            textInputType: const TextInputType.numberWithOptions(),

            validator: (value) => playingMoneyValidator(value, currentTab),
          ),
        ),
        const Text('ريال'),
      ],
    );
  }
}
