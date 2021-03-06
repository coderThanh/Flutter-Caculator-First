import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../models/app_color_model.dart';
import '../models/app_func_model.dart';
import '../models/app_style_model.dart';
import '../models/keypress_model.dart';

// ignore: must_be_immutable
class ExpressBox extends StatelessWidget {
  List<KeyPress> express = [];
  bool isThemeDark;

  ExpressBox({
    Key? key,
    required this.express,
    this.isThemeDark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
      alignment: Alignment.bottomRight,
      constraints: const BoxConstraints(
        maxHeight: 200,
      ),
      child: AutoSizeText(
        AppFunc.getExpressString(express),
        textAlign: TextAlign.right,
        minFontSize: 25,
        style: TextStyle(
          color: AppColors(isThemeDark: isThemeDark).text,
          fontSize: 38,
          fontWeight: FontWeight.w400,
          height: 1.3,
        ),
        overflowReplacement: SingleChildScrollView(
          reverse: true,
          clipBehavior: Clip.antiAlias,
          child: Text.rich(
            TextSpan(
              text: AppFunc.getExpressString(express),
              style: TextStyle(
                color: AppColors(isThemeDark: isThemeDark).text,
                fontSize: 25,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
