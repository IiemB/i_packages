import 'package:get/get_utils/src/extensions/internacionalization.dart';

class IValidators {
  /// validataor 'This field cannot be empty'
  static String? validatorCannotBeEmpty(String? value) {
    if (value!.isEmpty) {
      return 'This field cannot be empty'.tr;
    }
    return null;
  }
}
