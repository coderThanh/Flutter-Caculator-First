import 'package:flutter/material.dart';
import 'package:flutter_caculator/app_ui/app_class.dart';

import '../app_ui/app_ui.dart';
import '../app_ui/app_const.dart';

import 'button_widget.dart';
import 'iconinner_btn_widget.dart';

class BoardNum extends StatelessWidget {
  late Function onTab;
  BoardNum({Key? key, required this.onTab}) : super(key: key);

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
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyAction,
                            value: AppConst.ac,
                          ),
                        ),
                        child: Text('AC',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyAction,
                            value: AppConst.delete,
                          ),
                        ),
                        child: IconInnerBtn(iconData: Icons.backspace),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyOperator,
                            value: AppConst.devider,
                          ),
                        ),
                        child: Text('\u00F7',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '7',
                          ),
                        ),
                        child: Text('7',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '8',
                          ),
                        ),
                        child: Text('8',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '9',
                          ),
                        ),
                        child: Text('9',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '4',
                          ),
                        ),
                        child: Text('4',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '5',
                          ),
                        ),
                        child: Text('5',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '6',
                          ),
                        ),
                        child: Text('6',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '1',
                          ),
                        ),
                        child: Text('1',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '2',
                          ),
                        ),
                        child: Text('2',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '3',
                          ),
                        ),
                        child: Text('3',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: '0',
                          ),
                        ),
                        child: Text('0',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => onTab(
                          KeyPress(
                            type: AppConst.keyNum,
                            value: AppConst.decimalSerpa,
                          ),
                        ),
                        child: Text(',',
                            style: AppStyles(isThemeDark: true).textBtn),
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
                  onTap: () => onTab(
                    KeyPress(
                      type: AppConst.keyOperator,
                      value: AppConst.multi,
                    ),
                  ),
                  child: IconInnerBtn(iconData: Icons.clear),
                ),
                ButtonInkWell(
                  onTap: () => onTab(
                    KeyPress(
                      type: AppConst.keyOperator,
                      value: AppConst.plus,
                    ),
                  ),
                  child: IconInnerBtn(iconData: Icons.add),
                ),
                ButtonInkWell(
                  onTap: () => onTab(
                    KeyPress(
                      type: AppConst.keyOperator,
                      value: AppConst.minus,
                    ),
                  ),
                  child: IconInnerBtn(iconData: Icons.remove),
                ),
                Expanded(
                  child: ButtonInkWell(
                    color: AppColors(isThemeDark: true).primary,
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
