class ITickerFormater {
  static String printDuration(int ticker) {
    String twoDigits(num n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final Duration duration = Duration(seconds: ticker);
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
