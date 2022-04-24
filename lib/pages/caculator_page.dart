import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_caculator/app_ui/app_class.dart';
import 'package:flutter_caculator/app_ui/app_const.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';
import 'package:flutter_caculator/widgets/board_num_widget.dart';
import 'package:flutter_caculator/widgets/express_box_widget.dart';
import 'package:flutter_caculator/widgets/result_widget.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';

import '../app_ui/app_pattern.dart';

class CaculatePage extends StatefulWidget {
  const CaculatePage({Key? key}) : super(key: key);

  @override
  State<CaculatePage> createState() => _CaculatePageState();
}

class _CaculatePageState extends State<CaculatePage> {
  List<KeyPress> _express = [];
  double _result = 0;

  // Create express caculator
  Parser expressCaculator = Parser();

  void setExpress(KeyPress keyPress) {
    setState(() {
      switch (keyPress.type) {
        case AppConst.keyOperator:
          if (_express.isEmpty) {
            return;
          } else if (_express[_express.length - 1].type ==
              AppConst.keyOperator) {
            _express[_express.length - 1] = keyPress;
          } else {
            _express.add(keyPress);
          }
          break;
        case AppConst.keyAction:
          if (keyPress.value == AppConst.equal) {
            // Check last  just decimal sera . or ,
            if (_express.isNotEmpty &&
                _express[_express.length - 1].value == AppConst.decimalSerpa) {
              _express[_express.length - 1].value += '0';
            }
            // Check last is operator
            if (_express[_express.length - 1].type == AppConst.keyOperator) {
              _express.removeLast();
            }

            try {
              String parseStingExpress = '';
              _express.forEach((KeyPress element) {
                parseStingExpress += element.value;
              });
              print(parseStingExpress);

              Expression exp = expressCaculator.parse(parseStingExpress);
              _result = exp.evaluate(EvaluationType.REAL, ContextModel());
            } catch (e) {
              _result = 0;
            }
          } else if (keyPress.value == AppConst.ac) {
            _express = [];
            _result = 0;
          } else if (keyPress.value == AppConst.delete && _express.isNotEmpty) {
            // Remove Number
            KeyPress lastExpress = _express[_express.length - 1];

            if (lastExpress.type == AppConst.keyOperator ||
                lastExpress.value.length == 1) {
              _express.removeLast();
            } else {
              _express[_express.length - 1].value = lastExpress.value.substring(
                0,
                lastExpress.value.length - 1,
              );
            }
          }

          break;
        default: //Keynum
          if (_express.isNotEmpty &&
              _express[_express.length - 1].type == AppConst.keyNum) {
            // Check if number have decimal Serparator before
            if (keyPress.value == AppConst.decimalSerpa &&
                _express[_express.length - 1]
                    .value
                    .contains(AppConst.decimalSerpa)) {
              return;
            }

            if (_express[_express.length - 1].value.length < 12) {
              _express[_express.length - 1].value += keyPress.value;
            }
          } else {
            _express.add(keyPress);
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors(isThemeDark: true).bgLinear,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Express Show
              ExpressBox(express: _express),
              const SizedBox(height: 7),
              // Result show
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: Color.fromRGBO(255, 255, 255, 0.3),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ResultCaulator(result: _result),
              const SizedBox(height: 15),
              // Keyboard show
              BoardNum(onTab: setExpress),
            ],
          ),
        ),
      ),
    );
  }
}
