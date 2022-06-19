import 'package:flutter/material.dart';
import 'package:flutter_caculator/pages/caculator_page.dart';
import 'package:flutter_caculator/route_navigator/routes_name.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return _GeneratePageRoute(
          routeName: RoutesName.home,
          widget: const CaculatePage(),
        );
      default:
        return _GeneratePageRoute(
          routeName: RoutesName.home,
          widget: const CaculatePage(),
        );
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.routeName, required this.widget})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 500),
          // transitionsBuilder: (
          //   BuildContext context,
          //   Animation<double> animation,
          //   Animation<double> secondaryAnimation,
          //   Widget child,
          // ) {
          //   return SharedAxisTransition(
          //     fillColor: Colors.transparent,
          //     animation: animation,
          //     secondaryAnimation: secondaryAnimation,
          //     transitionType: SharedAxisTransitionType.horizontal,
          //     child: child,
          //   );
          // },
        );
}
