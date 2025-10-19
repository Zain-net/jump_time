import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(0));

  final _pageController = PageController();

  PageController get pageController => _pageController;

  Future<void> changeIndex(int newIndex) async {
    if (newIndex == state.currentIndex) return;

    await _pageController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 600),
      curve: Curves.bounceInOut,
    );
    emit(state.copyWith(newIndex));
  }

  void onPageChanged(int newIndex) => emit(state.copyWith(newIndex));
}
