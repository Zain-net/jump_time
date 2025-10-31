import 'package:flutter/material.dart';

class ExtendTimeScreen extends StatelessWidget {
  const ExtendTimeScreen(this.playerId,{super.key});

  final int playerId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تمديد فترة اللاعب')),
      body: ListView(
        children: const [
          Text(
            '?كيف تود أن يتم تمديد فترة اللاعب',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          
        ],
      ),
    );
  }
}
