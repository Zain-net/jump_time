import 'playing_method.dart';

class TimeExtendEntity {
  TimeExtendEntity({
    required this.extendType,
    required this.minutes,
    required this.money,
  });

  final PlayingMethod extendType;
  final int minutes;
  final int money;
}
