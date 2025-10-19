class BottomNavState {
  BottomNavState(this.currentIndex);
  final int currentIndex;

  BottomNavState copyWith([int? currentIndex]) {
    return BottomNavState(currentIndex ?? this.currentIndex);
  }
}
