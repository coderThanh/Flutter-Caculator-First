import 'package:intl/intl.dart';

class AppNumPattern {
  late double number;
  final NumberFormat _decimalPattern = NumberFormat('#,##0.#########', 'vi');
  final NumberFormat _thousandPattern = NumberFormat('#,###', 'vi');
  final NumberFormat _compactCurrPattern =
      NumberFormat.compactCurrency(locale: 'vi');

  AppNumPattern({required this.number});

  String get formatDecimal {
    String result = _decimalPattern.format(number);
    return result;
  }

  String get formatCompactCurr {
    String result = _compactCurrPattern.format(number);
    return result;
  }

  String get formatThousand {
    String result = _thousandPattern.format(number);
    return result;
  }
}
