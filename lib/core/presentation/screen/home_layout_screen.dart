import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/bottom_navigation_bar/presentation/controller/bottom_nav_controller.dart';
import '../../../features/player/presentation/screen/players_list_screen.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('وقت التنطيط'))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Consumer(
        builder: (context, ref, child) {
          final controller = ref.read(bottomNavProvider.notifier);
          return PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              const PlayersListScreen(),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.lightBlueAccent,
                child: const Center(child: Text('الألعاب')),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.pinkAccent,
                child: const Center(child: Text('التقارير')),
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.greenAccent,
                child: const Center(child: Text('الإعدادات')),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 25),
          child: Consumer(
            builder: (context, ref, child) {
              final controller = ref.read(bottomNavProvider.notifier);
              final currentIndex = ref.watch(bottomNavProvider);

              return BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: controller.changeIndex,

                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_gymnastics_outlined),
                    activeIcon: Icon(Icons.sports_martial_arts_rounded),
                    label: 'اللاعبون',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.games_outlined),
                    activeIcon: Icon(Icons.games),
                    label: 'الألعاب',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.report_gmailerrorred_rounded),
                    activeIcon: Icon(Icons.report_sharp),
                    label: 'التقارير',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings_suggest),
                    activeIcon: Icon(Icons.settings),
                    label: 'الإعدادات',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
