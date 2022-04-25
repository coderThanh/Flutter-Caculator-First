import 'package:intl/intl.dart';

class AppNumPattern {
  late double number;
  final NumberFormat _decimalPattern = NumberFormat('#,##0.#########', 'vi');
  final NumberFormat _decimalZeroPattern =
      NumberFormat('#,##0.0########', 'vi');
  final NumberFormat _thousandPattern = NumberFormat('#,###', 'vi');

  AppNumPattern({required this.number});

  String get formatDecimal {
    String result = _decimalPattern.format(number);
    return result;
  }

  String get formatDecimalZero {
    String result = _decimalZeroPattern.format(number);
    return result;
  }

  String get formatThousand {
    String result = _thousandPattern.format(number);
    return result;
  }
}
