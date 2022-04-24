import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../app_ui/app_pattern.dart';
import '../app_ui/app_ui.dart';

class ResultCaulator extends StatelessWidget {
  double result = 0;
  ResultCaulator({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AutoSizeText(
        AppNumPattern(number: result).formatDecimal,
        maxLines: 1,
        minFontSize: 40,
        style: TextStyle(
          color: AppColors(isThemeDark: true).text,
          fontSize: 80,
          fontWeight: FontWeight.w400,
        ),
        overflowReplacement: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            AppNumPattern(number: result).formatDecimal,
            style: TextStyle(
              color: AppColors(isThemeDark: true).text,
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
