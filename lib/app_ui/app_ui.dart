import 'package:flutter/material.dart';

class AppColors {
  bool isThemeDark;

  AppColors({required this.isThemeDark});

  static const Color _primaryDark = Color.fromARGB(255, 241, 145, 10);
  static const Color _primaryLight = Color(0xff56CB95);
  static const Color _textDark = Color.fromARGB(255, 82, 82, 82);
  static const Color _textLight = Color(0xffffffff);

  static const Color _bgDark = Color(0xFF424242);
  static const Color _bgLight = Color(0xFFFBFBFB);
  static const Color _bgSecDark = Color(0xff4E4E4E);
  static const Color _bgSecLight = Color.fromARGB(255, 244, 244, 244);

  static const LinearGradient _bgLinearDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF424242),
      Color(0xFF424242),
      Color(0xFF585858),
      Color(0xFF585858),
    ],
  );
  static const LinearGradient _bgLinearLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffFBFBFB),
      Color(0xffFBFBFB),
      Color.fromRGBO(229, 252, 233, 0.5),
      Color.fromRGBO(229, 252, 233, 0.8),
      Color.fromRGBO(229, 252, 233, 0.9),
      Color.fromRGBO(229, 252, 233, 1),
    ],
  );

  Color get primary => isThemeDark ? _primaryDark : _primaryLight;
  Color get text => isThemeDark ? _textLight : _textDark;
  Color get bg => isThemeDark ? _bgDark : _bgLight;
  Color get bgSec => isThemeDark ? _bgSecDark : _bgSecLight;
  LinearGradient get bgLinear => isThemeDark ? _bgLinearDark : _bgLinearLight;
}

class AppStyles {
  bool isThemeDark;
  static const double paddHori = 18;

  AppStyles({required this.isThemeDark});

  TextStyle get textBtn => TextStyle(
        fontSize: 33,
        color: AppColors(isThemeDark: isThemeDark).text,
      );
}
