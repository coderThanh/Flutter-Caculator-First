import 'package:flutter/material.dart';
import 'package:flutter_caculator/app_ui/app_ui.dart';

class BorderSpace extends StatelessWidget {
  const BorderSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color.fromRGBO(255, 255, 255, 0.3),
            ),
          ),
        ),
      ),
    );
  }
}
