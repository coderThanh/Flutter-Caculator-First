import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_caculator/bloc/theme_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../models/app_color_model.dart';
import '../models/app_style_model.dart';
import '../models/express_history_model.dart';
import '../pages/restore_page.dart';
import 'button_widget.dart';
import 'switch_icon_widget.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  String assetName = 'assets/images/ic_back.svg';
  bool _isThemeDark = true;
  final List<ExpressHistory> _expressHistory = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is ThemeLoadded) {
          _isThemeDark = state.isThemeDark;
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: AppStyles.paddHori),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonInkWell(
                color: Colors.transparent,
                height: 32,
                width: 32,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: SvgPicture.asset(
                  assetName,
                  color: AppColors(isThemeDark: _isThemeDark).text,
                  semanticsLabel: 'History',
                  height: 26,
                ),
                onTap: () async {
                  ExpressHistory? _reExpress = await Navigator.push(
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
                          RestorePage(
                        isThemeDark: _isThemeDark,
                        expressHistory: _expressHistory,
                      ),
                    ),
                  );

                  // if (_reExpress != null) {
                  //   setState(() {
                  //     _express = _reExpress.express;
                  //     _result = _reExpress.result;
                  //   });
                  // }
                },
              ),
              SwitchIcon(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
