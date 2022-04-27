import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';

class RestorePage extends StatelessWidget {
  late bool isThemeDark;
  RestorePage({
    Key? key,
    this.isThemeDark = true,
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
        backgroundColor: AppColors(isThemeDark: isThemeDark).bg,
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
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors(isThemeDark: isThemeDark).bgLinear,
        ),
        child: Center(child: Text('Hello Restore Page')),
      ),
    );
  }
}
