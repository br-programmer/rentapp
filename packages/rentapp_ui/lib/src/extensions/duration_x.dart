extension DurationX on Duration {
  String get remainingTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitHour = twoDigits(inHours.remainder(60));
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    if (twoDigitHour == '00') {
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
    return '$twoDigitHour:$twoDigitMinutes:$twoDigitSeconds';
  }

  String get remainingMinutes {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String oneDigits(int n) => n.toString().padLeft(1, '0');
    final twoDigitMinutes = oneDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  Duration subtract(int seconds) => Duration(seconds: inSeconds - seconds);
  Duration add(int seconds) => Duration(seconds: inSeconds + seconds);
}
