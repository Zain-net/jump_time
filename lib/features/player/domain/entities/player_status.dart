enum PlayerStatus {
  playing('يلعب'),
  finished('انتهى'),
  waiting('ينتظر');

  const PlayerStatus(this.status);
  final String status;
}
