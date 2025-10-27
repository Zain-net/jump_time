import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';

class BottomNavNotifier extends StateNotifier<int> {
  BottomNavNotifier() : super(0);

  final _pageController = PageController();

  PageController get pageController => _pageController;

  Future<void> changeIndex(int newIndex) async {
    if (newIndex == state) return;

    await _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.bounceInOut,
    );
    state = newIndex;
  }

  void onPageChanged(int newIndex) => state = newIndex;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

final bottomNavProvider = StateNotifierProvider<BottomNavNotifier, int>(
  (ref) => BottomNavNotifier(),
);
