import 'package:flutter/material.dart';

import '../models/app_color_model.dart';
import '../models/app_const_model.dart';
import '../models/app_style_model.dart';
import '../models/keypress_model.dart';
import 'button_widget.dart';
import 'iconinner_btn_widget.dart';

// ignore: must_be_immutable
class BoardNum extends StatelessWidget {
  late Function onTab;
  late bool isThemeDark = true;
  BoardNum({Key? key, required this.onTab, this.isThemeDark = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyAction,
                            value: AppConst.ac,
                          ),
                        ),
                        child: Text('AC',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyAction,
                            value: AppConst.delete,
                          ),
                        ),
                        child: IconInnerBtn(
                          iconData: Icons.backspace,
                          color: AppColors(isThemeDark: isThemeDark).text,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyOperator,
                            value: AppConst.devider,
                          ),
                        ),
                        child: Text('\u00F7',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '7',
                          ),
                        ),
                        child: Text('7',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '8',
                          ),
                        ),
                        child: Text('8',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '9',
                          ),
                        ),
                        child: Text('9',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '4',
                          ),
                        ),
                        child: Text('4',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '5',
                          ),
                        ),
                        child: Text('5',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '6',
                          ),
                        ),
                        child: Text('6',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '1',
                          ),
                        ),
                        child: Text('1',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '2',
                          ),
                        ),
                        child: Text('2',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '3',
                          ),
                        ),
                        child: Text('3',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '0',
                          ),
                        ),
                        child: Text('0',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        color: AppColors(isThemeDark: isThemeDark).bg,
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: AppConst.decimalSerpa,
                          ),
                        ),
                        child: Text(',',
                            style: AppStyles(isThemeDark: isThemeDark).textBtn),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                ButtonInkWell(
                  color: AppColors(isThemeDark: isThemeDark).bg,
                  onTap: () => onTab(
                    KeyPress(
                      type: AppConst.keyOperator,
                      value: AppConst.multi,
                    ),
                  ),
                  child: IconInnerBtn(
                    iconData: Icons.clear,
                    color: AppColors(isThemeDark: isThemeDark).text,
                  ),
                ),
                ButtonInkWell(
                  color: AppColors(isThemeDark: isThemeDark).bg,
                  onTap: () => onTab(
                    KeyPress(
                      type: AppConst.keyOperator,
                      value: AppConst.plus,
                    ),
                  ),
                  child: IconInnerBtn(
                    iconData: Icons.add,
                    color: AppColors(isThemeDark: isThemeDark).text,
                  ),
                ),
                ButtonInkWell(
                  color: AppColors(isThemeDark: isThemeDark).bg,
                  onTap: () => onTab(
                    KeyPress(
                      type: AppConst.keyOperator,
                      value: AppConst.minus,
                    ),
                  ),
                  child: IconInnerBtn(
                    iconData: Icons.remove,
                    color: AppColors(isThemeDark: isThemeDark).text,
                  ),
                ),
                Expanded(
                  child: ButtonInkWell(
                    color: AppColors(isThemeDark: isThemeDark).primary,
                    onTap: () => onTab(
                      KeyPress(
                        type: AppConst.keyAction,
                        value: AppConst.equal,
                      ),
                    ),
                    child: IconInnerBtn(iconData: Icons.drag_handle),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
