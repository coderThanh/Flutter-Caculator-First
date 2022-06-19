import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_caculator/bloc/theme_bloc.dart';
import 'package:flutter_caculator/widgets/header_widget.dart';
import 'package:math_expressions/math_expressions.dart';

import '../models/app_color_model.dart';
import '../models/app_const_model.dart';
import '../models/app_pattern_model.dart';
import '../models/express_history_model.dart';
import '../models/keypress_model.dart';
import '../widgets/board_num_widget.dart';
import '../widgets/border_space_widget.dart';
import '../widgets/express_box_widget.dart';
import '../widgets/result_widget.dart';

class CaculatePage extends StatefulWidget {
  const CaculatePage({Key? key}) : super(key: key);

  @override
  State<CaculatePage> createState() => _CaculatePageState();
}

class _CaculatePageState extends State<CaculatePage> {
  List<KeyPress> _express = [];
  final List<ExpressHistory> _expressHistory = [];
  double _result = 0;
  bool _resultError = false;
  // bool _isThemeDark = true;
  bool _wasEqualPressBefore = false;

  // Create express caculator
  Parser expressCaculator = Parser();

  // Logic Key operator
  void logicKeyOprerator(KeyPress keyPress) {
    if (_express.isEmpty) {
      return;
    }

    setState(() {
      if (_result == double.infinity) {
        _express = [];
        _result = 0;
      } else if (_result != 0) {
        // Continute with new result math
        _express = [
          KeyPress(
            type: AppConst.keyNum,
            value: AppNumPattern().toStringDecimalPattern(_result),
          ),
          keyPress,
        ];
        _result = 0;
      } else if (_express[_express.length - 1].type == AppConst.keyOperator) {
        _express[_express.length - 1] = keyPress;
      } else {
        _express.add(keyPress);
      }
    });
  }

  // Logic Key number
  void logicKeyNum(KeyPress keyPress) {
    setState(() {
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
          _result = 0;
          return;
        }
      } else {
        _express.add(keyPress);
      }
    });
  }

  // Logic Key action
  void logicKeyAction(KeyPress keyPress) {
    // Middleware check something before run Logi
    if (_express.isEmpty || _wasEqualPressBefore) {
      return;
    }
    // Run logic
    setState(() {
      if (keyPress.value == AppConst.ac) {
        // Delete all
        _express = [];
        _result = 0;
      } else if (keyPress.value == AppConst.delete) {
        // Remove Number
        KeyPress lastExpress = _express[_express.length - 1];
        _result = 0;

        if (lastExpress.type == AppConst.keyOperator ||
            lastExpress.value.length == 1) {
          _express.removeLast();
        } else {
          _express[_express.length - 1].value = lastExpress.value.substring(
            0,
            lastExpress.value.length - 1,
          );
        }
      } else if (keyPress.value == AppConst.equal) {
        _wasEqualPressBefore = true;

        // Check last is operator
        if (_express[_express.length - 1].type == AppConst.keyOperator) {
          _express.removeLast();
        }

        try {
          String parseStingExpress = '';
          // ignore: avoid_function_literals_in_foreach_calls
          _express.forEach((KeyPress element) {
            String value = element.value;
            String type = element.type;
            String lastValue = value.substring(element.value.length - 1);

            // Check last  just decimal sera
            if (type == AppConst.keyNum && value == AppConst.decimalSerpa) {
              element.value = '0';
            }
            if (type == AppConst.keyNum && lastValue == AppConst.decimalSerpa) {
              element.value += '0';
            }

            parseStingExpress += element.value;
          });

          Expression exp = expressCaculator.parse(parseStingExpress);
          _result = exp.evaluate(EvaluationType.REAL, ContextModel());
        } catch (e) {
          _resultError = true;
          return;
        }

        // If no error will run here & add history
        _resultError = false;

        if (!_resultError) {
          _expressHistory.add(ExpressHistory(
            express: [..._express],
            result: _result,
            timeInit: DateTime.now(),
          ));
        }
      }
    });
  }

  // Func Key press
  void setExpress(KeyPress keyPress) {
    if (_wasEqualPressBefore && keyPress.value != AppConst.equal) {
      setState(() {
        _wasEqualPressBefore = false;
      });
    }

    switch (keyPress.type) {
      case AppConst.keyOperator:
        logicKeyOprerator(keyPress);

        break;
      case AppConst.keyAction:
        logicKeyAction(keyPress);

        break;
      default: //Keynum
        logicKeyNum(keyPress);
    }
  }

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/images/ic_back.svg';

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool _isThemeDark = true;
        if (state is ThemeLoadded) {
          _isThemeDark = state.isThemeDark;
        }
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              // Ios
              statusBarBrightness:
                  _isThemeDark ? Brightness.dark : Brightness.light,
              // Android
              statusBarIconBrightness:
                  _isThemeDark ? Brightness.dark : Brightness.light,
            ),
            toolbarHeight: 0,
            backgroundColor: AppColors(isThemeDark: _isThemeDark).bg,
            shadowColor: Colors.transparent,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: AppColors(isThemeDark: _isThemeDark).bgLinear,
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Header Widget
                  Header(),
                  // Express Widget
                  Expanded(
                    child: ExpressBox(
                      express: _express,
                      isThemeDark: _isThemeDark,
                    ),
                  ),
                  const SizedBox(height: 7),
                  BorderSpace(isThemeDark: _isThemeDark),
                  const SizedBox(height: 10),
                  // Result Widget
                  ResultCaulator(
                    result: _result,
                    isError: _resultError,
                    isThemeDark: _isThemeDark,
                  ),
                  const SizedBox(height: 15),
                  // Keyboard Widget
                  BoardNum(
                    onTab: setExpress,
                    isThemeDark: _isThemeDark,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
