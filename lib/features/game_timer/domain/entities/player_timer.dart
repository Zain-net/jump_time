class PlayerEntity {
  PlayerEntity({
    required this.id,
    required this.name,
    required this.remainingTime,
  });

  final int id;
  final String name;
  Duration remainingTime;

  void decreaseSecond() {
    final seconds = remainingTime.inSeconds - 1;
    remainingTime = Duration(seconds: seconds);
  }
}
