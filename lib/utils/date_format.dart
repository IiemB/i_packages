import 'package:intl/intl.dart';

class IDateFormatStyle {
  IDateFormatStyle._();

  /// DateFormat('dd MMM yyy')
  static final DateFormat df1 = DateFormat('dd MMM yyy');

  /// DateFormat('HH:mm dd MMM yyy')
  static final DateFormat df2 = DateFormat('HH:mm dd MMM yyy');
}
