// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_caculator/app_ui/app_class.dart';
import 'package:flutter_caculator/app_ui/app_pattern.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';
import 'package:flutter_caculator/widgets/box_history_express.dart';

class RestorePage extends StatefulWidget {
  late bool isThemeDark;
  late List<ExpressHistory> expressHistory;
  RestorePage({
    Key? key,
    this.isThemeDark = true,
    required this.expressHistory,
  }) : super(key: key);

  @override
  State<RestorePage> createState() => _RestorePageState();
}

class _RestorePageState extends State<RestorePage> {
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
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Ios
          statusBarBrightness:
              widget.isThemeDark ? Brightness.dark : Brightness.light,
          // Android
          statusBarIconBrightness:
              widget.isThemeDark ? Brightness.dark : Brightness.light,
        ),
        backgroundColor: AppColors(isThemeDark: widget.isThemeDark).bgSec,
        shadowColor: Colors.black26,
        title: Text(
          'Restore',
          style: TextStyle(
              color: AppColors(isThemeDark: widget.isThemeDark).text,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        ),
        iconTheme: IconThemeData(
          color: AppColors(isThemeDark: widget.isThemeDark).text,
        ),
      ),
      backgroundColor: AppColors(isThemeDark: widget.isThemeDark).bg,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.builder(
          controller: _controller,
          itemCount: widget.expressHistory.length,
          addAutomaticKeepAlives: false,
          reverse: true,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            ExpressHistory item = widget.expressHistory[index];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Opacity(
                    opacity: 0.5,
                    child: Text(
                      AppTimePattern().getDateTime(item.timeInit),
                      style: TextStyle(
                        color: AppColors(isThemeDark: widget.isThemeDark).text,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                BoxHistoryExpress(
                  result: item.result,
                  express: item.express,
                  isThemeDark: widget.isThemeDark,
                  trailingOnTab: () {
                    Navigator.pop(
                        context,
                        ExpressHistory(
                            express: item.express,
                            result: item.result,
                            timeInit: item.timeInit));
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
