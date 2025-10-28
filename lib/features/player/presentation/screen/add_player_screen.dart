import 'package:flutter/material.dart';
import '../widget/add_player_form.dart';
import '../widget/keep_screen_switch.dart';
import '../widget/player_photo_controller.dart';

class AddPlayerScreen extends StatelessWidget {
  const AddPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة لاعب'),
        actions: const [KeepScreenSwitch()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          PlayerPhotoController(),
          SizedBox(height: 30),
          AddPlayerForm(),
        ],
      ),
    );
  }
}
