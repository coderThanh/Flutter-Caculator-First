import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';
import 'package:flutter_caculator/widgets/board_num_widget.dart';

import '../app_ui/app_pattern.dart';

class CaculatePage extends StatelessWidget {
  // String _equal = '';
  // String _result = '690';
  // String _express = '';

  const CaculatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors(isThemeDark: true).bgLinear,
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  constraints: const BoxConstraints(
                    maxHeight: 200,
                  ),
                  child: AutoSizeText(
                    '400 + 500 + 600 + 500 + 600400 + 500 + 400 + 500 + 600 + 500 + 600400 + 500 + 400 + 500 + 600 + 500 + 600400 + 500 ',
                    textAlign: TextAlign.right,
                    minFontSize: 22,
                    style: TextStyle(
                      color: AppColors(isThemeDark: true).text,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: AutoSizeText(
                    AppNumPattern(number: 690).formatThousand,
                    maxLines: 1,
                    minFontSize: 25,
                    style: TextStyle(
                      color: AppColors(isThemeDark: true).text,
                      fontSize: 80,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const BoardNum(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
