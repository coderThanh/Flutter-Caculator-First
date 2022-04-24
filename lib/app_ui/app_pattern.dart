import 'package:intl/intl.dart';

class AppNumPattern {
  late num number;
  var decimalPattern = NumberFormat.decimalPattern('vi');

  AppNumPattern({required this.number});

  String get formatThousand {
    var result = decimalPattern.format(number);
    return result;
  }
}
