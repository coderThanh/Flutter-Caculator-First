import 'app_const_model.dart';
import 'app_pattern_model.dart';
import 'keypress_model.dart';

class AppFunc {
  String getExpressString(List<KeyPress> inputExpress) {
    String result = '';
    // ignore: avoid_function_literals_in_foreach_calls
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
