// Class for List express
import 'app_const.dart';
import 'app_pattern.dart';

class KeyPress {
  late String type;
  late String value;

  KeyPress({required this.type, required this.value});
}

// Class express history
class ExpressHistory {
  late List<KeyPress> express;
  late double result;
  late DateTime timeInit;

  ExpressHistory({
    required this.express,
    required this.result,
    required this.timeInit,
  });
}

// Class app functions
class AppFunc {
  String getExpressString(List<KeyPress> inputExpress) {
    String result = '';
    inputExpress.forEach((element) {
      String value = element.value;
      String type = element.type;

      switch (type) {
        case AppConst.keyOperator:
          if (value == AppConst.multi) {
            result += ' \u00d7 ';
          } else if (value == AppConst.devider) {
            result += ' \u00f7 ';
          } else {
            result += ' ' + value + ' ';
          }
          break;
        default: //Keynum
          if (value.isEmpty) {
            return;
          }

          var toNumber = double.tryParse(value) ?? 0;
          int indexDecimalSer = value.indexOf(AppConst.decimalSerpa);
          if (indexDecimalSer != -1) {
            result += AppNumPattern().formatDecimalZero(toNumber);
          } else {
            result += AppNumPattern().formatDecimal(toNumber);
          }
      }
    });
    return result.isNotEmpty ? result : '0';
  }
}
