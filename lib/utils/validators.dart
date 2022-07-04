class IValidators {
  IValidators._();

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isNull(dynamic value) => value == null;

  /// Checks if string is URL.
  static bool isURL(String s) => hasMatch(
        s,
        r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-]+))*$",
      );

  /// Checks if string is email.
  static bool isEmail(String s) => hasMatch(
        s,
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      );

  /// Checks if string is phone number.
  static bool isPhoneNumber(String s) {
    if (s.length > 16 || s.length < 9) return false;
    return hasMatch(s, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
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
    final ccode = countryCodeWithPlus.startsWith('+')
        ? _replaceCharAt(countryCodeWithPlus, 0, '')
        : countryCodeWithPlus;

    /// validate startsWith 62
    phoneNumber = phoneNumber.startsWith(ccode, 0)
        ? _replaceCharAt(phoneNumber, 0, countryCodeWithPlus.substring(0, 2))
        : phoneNumber;

    /// validate empty
    if (isNull(phoneNumber) || isNull(countryCodeWithPlus)) {
      return '';
    }

    /// validate isPhoneNumber
    if (!isPhoneNumber(phoneNumber)) {
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
