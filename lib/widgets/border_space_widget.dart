import 'package:flutter/material.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';

// ignore: must_be_immutable
class BorderSpace extends StatelessWidget {
  bool isThemeDark;

  BorderSpace({
    Key? key,
    this.isThemeDark = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: isThemeDark
                  ? const Color.fromRGBO(255, 255, 255, 0.3)
                  : const Color.fromRGBO(0, 0, 0, 0.15),
            ),
          ),
        ),
      ),
    );
  }
}
