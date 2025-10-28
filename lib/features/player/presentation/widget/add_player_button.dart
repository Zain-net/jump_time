import 'package:flutter/material.dart';

import '../../../../core/presentation/widget/iconed_button.dart';
import '../../../../core/routes/app_routes.dart';

class AddPlayerButton extends StatelessWidget {
  const AddPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconedButton(
      onPressed: () =>
          Navigator.pushNamed(context, ViewRoute.addPlayer.routeName),
      icon: const Icon(Icons.add),
      label: 'أضف لاعب جديد',
    );
  }
}
