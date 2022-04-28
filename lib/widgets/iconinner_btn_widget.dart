import 'package:flutter/material.dart';

import '../app_ui/app_ui.dart';

// ignore: must_be_immutable
class IconInnerBtn extends StatelessWidget {
  IconData iconData;
  double? size;
  Color? color;
  IconInnerBtn({
    Key? key,
    required this.iconData,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color ?? AppColors(isThemeDark: true).text,
      size: size ?? 33,
    );
  }
}
