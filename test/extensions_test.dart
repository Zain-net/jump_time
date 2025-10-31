import 'package:flutter_test/flutter_test.dart';
import 'package:jump_time/core/extensions/extensions.dart';



void main() {
  test('تجربة تحويل النص الى رقم', () {
    final result = ''.toInt;
    const int? exceptedValue = null;

    expect(result, exceptedValue);
  });

}
