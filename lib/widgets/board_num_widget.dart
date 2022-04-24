import 'package:flutter/material.dart';

import '../app_ui/app_ui.dart';
import 'button_widget.dart';
import 'iconinner_btn_widget.dart';

class BoardNum extends StatelessWidget {
  const BoardNum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(left: 12),
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('CE'),
                        child: Text('CE',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('backspace'),
                        child: IconInnerBtn(iconData: Icons.backspace),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('/'),
                        child: Text('/',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('CE'),
                        child: Text('7',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('backspace'),
                        child: Text('8',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('/'),
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
                        onTap: () => print('CE'),
                        child: Text('4',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('backspace'),
                        child: Text('5',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('/'),
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
                        onTap: () => print('CE'),
                        child: Text('1',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('backspace'),
                        child: Text('2',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('/'),
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
                        onTap: () => print('CE'),
                        child: Text('0',
                            style: AppStyles(isThemeDark: true).textBtn),
                      ),
                    ),
                    Expanded(
                      child: ButtonInkWell(
                        onTap: () => print('backspace'),
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
            padding: EdgeInsets.only(right: 12),
            child: Column(
              children: [
                // Placeholder(),
                ButtonInkWell(
                  onTap: () => print('*'),
                  child: IconInnerBtn(iconData: Icons.clear),
                ),
                ButtonInkWell(
                  onTap: () => print('*'),
                  child: IconInnerBtn(iconData: Icons.add),
                ),
                ButtonInkWell(
                  onTap: () => print('*'),
                  child: IconInnerBtn(iconData: Icons.remove),
                ),
                Expanded(
                  child: ButtonInkWell(
                    color: AppColors(isThemeDark: true).primary,
                    onTap: () => print('*'),
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
