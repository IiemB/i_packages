import 'package:flutter/material.dart';

class IColors {
  static const Color colorEt = Colors.green;
  static const Color colorRorET = Colors.teal;
  static const Color colorBt = Colors.blue;
  static const Color colorRorBT = Colors.red;

  static Color primary(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color primaryVariant(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color secondary(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
  static Color secondaryVariant(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;
}
