import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../app_ui/app_pattern.dart';
import '../app_ui/app_ui.dart';

// ignore: must_be_immutable
class ResultCaulator extends StatelessWidget {
  double result = 0;
  bool isError;
  bool isThemeDark;

  ResultCaulator({
    Key? key,
    required this.result,
    this.isError = false,
    this.isThemeDark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
      child: isError
          ? Text(
              'Error input',
              style: TextStyle(
                color: AppColors(isThemeDark: isThemeDark).text,
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            )
          : AutoSizeText(
              AppNumPattern().formatDecimal(result),
              maxLines: 1,
              minFontSize: 40,
              style: TextStyle(
                color: AppColors(isThemeDark: isThemeDark).text,
                fontSize: 80,
                fontWeight: FontWeight.w400,
              ),
              overflowReplacement: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  AppNumPattern().formatDecimal(result),
                  style: TextStyle(
                    color: AppColors(isThemeDark: isThemeDark).text,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
    );
  }
}
