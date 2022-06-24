import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator_bloc/calculator_bloc.dart';
import '../bloc/theme_bloc/theme_bloc.dart';
import '../models/app_color_model.dart';
import '../models/keypress_model.dart';
import '../widgets/board_num_widget.dart';
import '../widgets/border_space_widget.dart';
import '../widgets/express_box_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/result_widget.dart';

class CaculatePage extends StatefulWidget {
  const CaculatePage({Key? key}) : super(key: key);

  @override
  State<CaculatePage> createState() => _CaculatePageState();
}

class _CaculatePageState extends State<CaculatePage> {
  List<KeyPress> _express = CalculatorInitial.express;
  bool _isThemeDark = ThemeInitial.isThemeDark;

  @override
  Widget build(BuildContext context) {
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
              const Header(),

              // Express Widget
              MultiBlocListener(
                listeners: [
                  BlocListener<ThemeBloc, ThemeState>(
                      listener: (context, state) {
                    if (state is ThemeLoadded) {
                      setState(() {
                        _isThemeDark = state.isThemeDark;
                      });
                    }
                  }),
                  BlocListener<CalculatorBloc, CalculatorState>(
                      listener: (context, state) {
                    if (state is CalculatorLoadded) {
                      setState(() {
                        _express = state.express;
                      });
                    }
                  }),
                ],
                child: Expanded(
                  child: ExpressBox(
                    express: _express,
                    isThemeDark: _isThemeDark,
                  ),
                ),
              ),

              const SizedBox(height: 7),
              BorderSpace(isThemeDark: _isThemeDark),
              const SizedBox(height: 10),

              // Result Widget
              BlocBuilder<CalculatorBloc, CalculatorState>(
                buildWhen: (previous, current) {
                  if (previous is CalculatorLoadded &&
                      current is CalculatorLoadded) {
                    if (previous.result != current.result ||
                        previous.resultError != current.resultError) {
                      return true;
                    }
                  }
                  return false;
                },
                builder: (context, state) {
                  double _result = CalculatorInitial.result;
                  bool _resultError = CalculatorInitial.resultError;

                  if (state is CalculatorLoadded) {
                    _result = state.result;
                    _resultError = state.resultError;
                  }

                  return ResultCaulator(
                    result: _result,
                    isError: _resultError,
                    isThemeDark: _isThemeDark,
                  );
                },
              ),

              const SizedBox(height: 15),
              // Keyboard Widget
              BoardNum(
                onTab: (KeyPress keypress) {
                  context
                      .read<CalculatorBloc>()
                      .add(CalculatorEventKeyPress(keyPress: keypress));
                },
                isThemeDark: _isThemeDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
