// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/calculator_bloc/calculator_bloc.dart';
import '../bloc/theme_bloc/theme_bloc.dart';
import '../models/app_color_model.dart';
import '../models/app_pattern_model.dart';
import '../models/express_history_model.dart';
import '../widgets/box_history_express.dart';

class RestorePage extends StatefulWidget {
  const RestorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<RestorePage> createState() => _RestorePageState();
}

class _RestorePageState extends State<RestorePage> {
  // bool _isThemeDark = ThemeInitial.isThemeDark;
  // List<ExpressHistory> _expressHistory = [];

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      //write or call your logic
      //code will run when widget rendering complete
      double positionStart = _controller.position.maxScrollExtent;

      _controller.jumpTo(positionStart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        bool _isThemeDark = ThemeInitial.isThemeDark;
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
            backgroundColor: AppColors(isThemeDark: _isThemeDark).bgSec,
            shadowColor: Colors.black26,
            title: Text(
              'Restore',
              style: TextStyle(
                  color: AppColors(isThemeDark: _isThemeDark).text,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1),
            ),
            iconTheme: IconThemeData(
              color: AppColors(isThemeDark: _isThemeDark).text,
            ),
          ),
          backgroundColor: AppColors(isThemeDark: _isThemeDark).bg,
          body: SafeArea(
            child: BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                List<ExpressHistory> _expressHistory = [];
                if (state is CalculatorLoadded) {
                  _expressHistory = state.expressHistory;
                }

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _expressHistory.length,
                    addAutomaticKeepAlives: false,
                    reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ExpressHistory item = _expressHistory[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 32),
                          ),

                          // Text time
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Opacity(
                              opacity: 0.5,
                              child: Text(
                                AppTimePattern().getDateTime(item.timeInit),
                                style: TextStyle(
                                  color:
                                      AppColors(isThemeDark: _isThemeDark).text,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                          ),

                          //
                          BoxHistoryExpress(
                            result: item.result,
                            express: item.express,
                            isThemeDark: _isThemeDark,
                            trailingOnTab: () {
                              context
                                  .read<CalculatorBloc>()
                                  .add(CalculatorEventRestore(
                                    express: item.express,
                                    result: item.result,
                                    timeInit: item.timeInit,
                                  ));
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
