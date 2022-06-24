import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_caculator/models/app_const_model.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/theme_bloc/theme_bloc.dart';
import '../models/app_color_model.dart';
import '../models/app_style_model.dart';
import '../pages/restore_page.dart';
import 'button_widget.dart';
import 'switch_icon_widget.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Button restore
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              bool _isThemeDark = true;

              if (state is ThemeLoadded) {
                _isThemeDark = state.isThemeDark;
              }

              return ButtonInkWell(
                color: Colors.transparent,
                height: 32,
                width: 32,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: SvgPicture.asset(
                  AppConst.iconRestore,
                  color: AppColors(isThemeDark: _isThemeDark).text,
                  semanticsLabel: 'History',
                  height: 26,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    // Packages Animations
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SharedAxisTransition(
                          fillColor: Colors.transparent,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const RestorePage(),
                    ),
                  );

                  // if (_reExpress != null) {
                  //   setState(() {
                  //     _express = _reExpress.express;
                  //     _result = _reExpress.result;
                  //   });
                  // }
                },
              );
            },
          ),

          // Button switch icon
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              bool _isThemeDark = true;

              if (state is ThemeLoadded) {
                _isThemeDark = state.isThemeDark;
              }

              return SwitchIcon(
                isActive: _isThemeDark,
                onChanged: () {
                  context
                      .read<ThemeBloc>()
                      .add(ThemeChangeDark(isThemeDark: !_isThemeDark));
                },
                textOff: 'Light',
                textOn: 'Drak',
                width: 64,
                bgColorOn: const Color.fromARGB(255, 93, 93, 93),
                bgColorOff: const Color.fromARGB(255, 207, 207, 207),
              );
            },
          ),
        ],
      ),
    );
  }
}
