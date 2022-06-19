import 'package:intl/intl.dart';

class AppNumPattern {
  final NumberFormat _decimalPattern = NumberFormat('#,##0.#########', 'vi');
  final NumberFormat _decimalZeroPattern =
      NumberFormat('#,##0.0########', 'vi');
  final NumberFormat _toStringDecimalPattern = NumberFormat('#0.#########');
  final NumberFormat _thousandPattern = NumberFormat('#,###', 'vi');

  String formatDecimal(dynamic number) {
    return _decimalPattern.format(number);
  }

  String formatDecimalZero(dynamic number) {
    return _decimalZeroPattern.format(number);
  }

  String toStringDecimalPattern(dynamic number) {
    return _toStringDecimalPattern.format(number);
  }

  String formatThousand(dynamic number) {
    return _thousandPattern.format(number);
  }
}

class AppTimePattern {
  String getDateTime(DateTime time) {
    return DateFormat('E, d MMMM - h:m a', 'en-US').format(time);
  }
}
