import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../app_ui/app_class.dart';
import '../app_ui/app_const.dart';
import '../app_ui/app_pattern.dart';
import '../app_ui/app_ui.dart';

class ExpressBox extends StatelessWidget {
  List<KeyPress> express = [];
  bool isThemeDark;

  ExpressBox({
    Key? key,
    required this.express,
    this.isThemeDark = true,
  }) : super(key: key);

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
            result += AppNumPattern(number: toNumber).formatDecimalZero;
          } else {
            result += AppNumPattern(number: toNumber).formatDecimal;
          }
      }
    });
    return result.isNotEmpty ? result : '0';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
      alignment: Alignment.bottomRight,
      constraints: const BoxConstraints(
        maxHeight: 200,
      ),
      child: AutoSizeText(
        getExpressString(express),
        textAlign: TextAlign.right,
        minFontSize: 25,
        style: TextStyle(
          color: AppColors(isThemeDark: isThemeDark).text,
          fontSize: 38,
          fontWeight: FontWeight.w400,
          height: 1.3,
        ),
        overflowReplacement: SingleChildScrollView(
          reverse: true,
          clipBehavior: Clip.antiAlias,
          child: Text.rich(
            TextSpan(
              text: getExpressString(express),
              style: TextStyle(
                color: AppColors(isThemeDark: isThemeDark).text,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
