import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IDateFormatStyle {
  IDateFormatStyle._();

  static IDateFormatStyle? _instance;

  factory IDateFormatStyle() => _instance ??= IDateFormatStyle._();

  static Locale _settedLocale = const Locale('en', '');

  static Locale get _locale => _settedLocale;

  static void changeLocale(Locale locale) => _settedLocale = locale;

  /// DateFormat('dd MMM yyy')
  static final DateFormat df1 = DateFormat('dd MMM yyy', _locale.languageCode);

  /// DateFormat('HH:mm, dd MMM yyy')
  static final DateFormat df2 =
      DateFormat('HH:mm, dd MMM yyy', _locale.languageCode);

  /// DateFormat('HH:mm dd MMM yyy')
  static final DateFormat hourMinute =
      DateFormat('HH:mm:ss', _locale.languageCode);
}
