import 'package:flutter/material.dart';

import 'app_color_model.dart';

class AppStyles {
  bool isThemeDark;
  static const double paddHori = 18;

  AppStyles({required this.isThemeDark});

  TextStyle get textBtn => TextStyle(
        fontSize: 33,
        color: AppColors(isThemeDark: isThemeDark).text,
      );
}
