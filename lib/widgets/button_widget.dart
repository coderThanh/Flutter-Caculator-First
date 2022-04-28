import 'package:flutter/material.dart';

import '../app_ui/app_ui.dart';

// ignore: must_be_immutable
class ButtonInkWell extends StatelessWidget {
  Widget child;
  Function onTap;
  BorderRadius? borderRadius;
  EdgeInsets? margin;
  Color? color;
  AlignmentGeometry? alignment;
  double? height;
  double? width;
  bool isThemeDark;
  List<BoxShadow>? boxShadow;

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
    this.isThemeDark = true,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(7),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width ?? width,
      height: height ?? height,
      decoration: BoxDecoration(
        color: color ?? AppColors(isThemeDark: isThemeDark).bg,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: boxShadow ??
            const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(3, 5),
                blurRadius: 20,
                spreadRadius: 3,
              ),
            ],
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
