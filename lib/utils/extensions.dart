import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double widthByPercent(int percent) =>
      MediaQuery.of(this).size.width * (percent / 100);

  double heightByPercent(int percent) =>
      MediaQuery.of(this).size.height * (percent / 100);

  ThemeData get theme => Theme.of(this);
}

extension IntExtension on int {
  String get asFormattedDuration {
    String twoDigits(num n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final Duration duration = Duration(seconds: this);
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Future<void> get secondsDelay async =>
      await Future.delayed(Duration(seconds: this));
}
