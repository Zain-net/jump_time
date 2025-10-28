import '../../../../core/enums/enums.dart';
import '../../../../core/extensions/extensions.dart';

String? validateEmptyNumbers({
  required String? value,
  required String fieldName,
}) {
  final isEmpty = value?.isEmpty ?? true;
  if (isEmpty) return 'يجب إدخال $fieldName أولا';

  final digits = RegExp(r'^[0-9]+$');
  if (!digits.hasMatch(value!)) {
    return 'الرجاء إدخال أرقام موجبة فقط';
  }
  return null;
}

String? playingTimeValidator(String? value, int tabIndex) {
  final isSelected = tabIndex == PlayingMethod.time.index;
  if (!isSelected) return null;

  final validator = validateEmptyNumbers(value: value, fieldName: 'زمن اللعب');

  if (validator != null) return validator;

  if (value!.toInt! > 90) {
    return 'لايمكن أن تزيد الدقائق عن 90 دقيقة';
  }

  return null;
}

String? playingMoneyValidator(String? value, int tabIndex) {
  final isSelected =tabIndex == PlayingMethod.money.index;
  if (!isSelected) return null;

  final validator = validateEmptyNumbers(value: value, fieldName: 'مبلغ اللعب');

  if (validator != null) return validator;

  if (value!.toInt! > 5000) {
    return 'لا يمكن إدخال مبلغ أكثر من 5000 ريال';
  }

  return null;
}
