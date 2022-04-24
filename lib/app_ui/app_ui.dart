import 'package:flutter/material.dart';

class AppColors {
  bool isThemeDark;

  AppColors({required this.isThemeDark});

  static const Color _primary = Color(0xff56CB95);
  static const Color _textDark = Color(0xFF707070);
  static const Color _textLight = Color(0xffffffff);

  static const Color _bgDark = Color(0xFF424242);
  static const Color _bgLight = Color(0xFFFBFBFB);
  static const Color _bgSecDark = Color(0xff4E4E4E);
  static const Color _bgSecLight = Color(0xFFFBFBFB);

  static const LinearGradient _bgLinearDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff424242),
      Color(0xFF585858),
    ],
  );
  static const LinearGradient _bgLinearLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffFBFBFB),
      Color.fromRGBO(229, 252, 233, 1),
    ],
  );

  Color get primary => isThemeDark ? _primary : _primary;
  Color get text => isThemeDark ? _textLight : _textDark;
  Color get bg => isThemeDark ? _bgDark : _bgLight;
  Color get bgSec => isThemeDark ? _bgSecDark : _bgSecLight;
  LinearGradient get bgLinear => isThemeDark ? _bgLinearDark : _bgLinearLight;
}

class AppStyles {
  bool isThemeDark;

  AppStyles({required this.isThemeDark});

  TextStyle get textBtn => TextStyle(
        fontSize: 33,
        color: AppColors(isThemeDark: isThemeDark).text,
      );
}