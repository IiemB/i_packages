import 'package:flutter/material.dart';

class ISizer {
  static double widthPercent(BuildContext context, double percent) =>
      MediaQuery.of(context).size.width * (percent / 100);

  static double heightPercent(BuildContext context, double percent) =>
      MediaQuery.of(context).size.height * (percent / 100);

  static double widthFull(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double heightFull(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
