import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_caculator/app_ui/app_class.dart';
import 'package:flutter_caculator/app_ui/app_pattern.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';
import 'package:flutter_caculator/widgets/box_history_express.dart';

class RestorePage extends StatelessWidget {
  late bool isThemeDark;
  late List<ExpressHistory> expressHistory;
  RestorePage({
    Key? key,
    this.isThemeDark = true,
    required this.expressHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Ios
          statusBarBrightness: isThemeDark ? Brightness.dark : Brightness.light,
          // Android
          statusBarIconBrightness:
              isThemeDark ? Brightness.dark : Brightness.light,
        ),
        backgroundColor: AppColors(isThemeDark: isThemeDark).bgSec,
        shadowColor: Colors.transparent,
        title: Text(
          'Restore',
          style: TextStyle(
              color: AppColors(isThemeDark: isThemeDark).text,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        iconTheme: IconThemeData(
          color: AppColors(isThemeDark: isThemeDark).text,
        ),
      ),
      backgroundColor: AppColors(isThemeDark: isThemeDark).bg,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.builder(
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          addSemanticIndexes: false,
          semanticChildCount: 1,
          itemCount: expressHistory.length,
          reverse: true,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    AppTimePattern()
                        .getDateTime(expressHistory[index].timeInit),
                    style: TextStyle(
                      color: AppColors(isThemeDark: isThemeDark).text,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                BoxHistoryExpress(
                  result: expressHistory[index].result,
                  express: expressHistory[index].express,
                  onTab: () => print('hello tad'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
