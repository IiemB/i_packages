import 'package:get/utils.dart';

class IPhoneNumberValidator {
  /// Phone Number Is Checker
  static bool isPhoneNumber({required String phoneNumber}) {
    if (GetUtils.isNull(phoneNumber) || !GetUtils.isPhoneNumber(phoneNumber)) {
      return false;
    }
    return true;
  }

  static String fixThisPhoneNumber({
    required String countryCodeWithPlus,
    required String phoneNumber,
  }) {
    phoneNumber = phoneNumber.replaceAll(' ', '');

    /// validate startsWith 0
    phoneNumber = phoneNumber.startsWith('0')
        ? phoneNumber.replaceRange(0, 1, '')
        : phoneNumber;

    /// validate startsWith +
    phoneNumber = phoneNumber.startsWith('+')
        ? _replaceCharAt(phoneNumber, 0, '')
        : phoneNumber;

    /// validate country code startsWith +
    final _ccode = countryCodeWithPlus.startsWith('+')
        ? _replaceCharAt(countryCodeWithPlus, 0, '')
        : countryCodeWithPlus;

    /// validate startsWith 62
    phoneNumber = phoneNumber.startsWith(_ccode, 0)
        ? _replaceCharAt(phoneNumber, 0, countryCodeWithPlus.substring(0, 2))
        : phoneNumber;

    /// validate empty
    if (GetUtils.isNull(phoneNumber) || GetUtils.isNull(countryCodeWithPlus)) {
      return '';
    }

    /// validate isPhoneNumber
    if (!GetUtils.isPhoneNumber(phoneNumber)) {
      return '';
    }

    return phoneNumber;
  }

  static String _replaceCharAt(String oldValue, int index, String newValue) {
    return oldValue.substring(0, index) +
        newValue +
        oldValue.substring(index + 1);
  }
}
