import 'package:flutter/material.dart';

import '../app_ui/app_class.dart';
import '../app_ui/app_pattern.dart';
import '../app_ui/app_ui.dart';

class BoxHistoryExpress extends StatelessWidget {
  late bool isThemeDark;
  late double result;
  late List<KeyPress> express;
  late Function trailingOnTab;
  BoxHistoryExpress({
    Key? key,
    this.isThemeDark = true,
    required this.result,
    required this.express,
    required this.trailingOnTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors(isThemeDark: isThemeDark).bgSec,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color.fromRGBO(0, 0, 0, 0.03),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.only(top: 5, bottom: 3, left: 14, right: 5),
        horizontalTitleGap: 10,
        dense: true,
        minLeadingWidth: 0,
        trailing: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () => trailingOnTab(),
          icon: Icon(
            Icons.edit,
            color: AppColors(isThemeDark: isThemeDark).primary,
            size: 25,
          ),
        ),
        title: Text(
          AppNumPattern().formatDecimal(result),
          style: TextStyle(
            color: AppColors(isThemeDark: isThemeDark).text,
            fontSize: 23,
            fontWeight: FontWeight.w600,
            height: 1,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Container(
          margin: EdgeInsets.only(top: 5),
          child: Opacity(
            opacity: 0.6,
            child: Text(
              AppFunc().getExpressString(express),
              style: TextStyle(
                color: AppColors(isThemeDark: isThemeDark).text,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
