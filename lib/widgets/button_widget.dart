import 'package:flutter/material.dart';

import '../app_ui/app_ui.dart';

class ButtonInkWell extends StatelessWidget {
  Widget child;
  Function onTap;
  BorderRadius? borderRadius;
  EdgeInsets? margin;
  Color? color;
  AlignmentGeometry? alignment;
  double? height;
  double? width;

  ButtonInkWell({
    Key? key,
    required this.child,
    required this.onTap,
    this.borderRadius,
    this.margin,
    this.color,
    this.alignment,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(7),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width ?? width,
      height: height ?? height,
      decoration: BoxDecoration(
        color: color ?? AppColors(isThemeDark: true).bg,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(),
          highlightColor: Colors.transparent,
          child: Container(
            alignment: alignment ?? Alignment.center,
            constraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 70,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
