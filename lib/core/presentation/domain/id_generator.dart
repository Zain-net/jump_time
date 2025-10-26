class IdGenerator {
  IdGenerator._();
  static int _id = 0;

  static int get nextId => ++_id;

  static void init() => _id = 0;
}
