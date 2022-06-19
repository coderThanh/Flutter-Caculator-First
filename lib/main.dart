import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/caculator_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'route_navigator/route_generator.dart';
import 'route_navigator/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()..add(ThemeLoadDark())),
        BlocProvider(
            create: (context) => CaculatorBloc()..add(CaculatorEventLoadded())),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: RoutesName.home,
      ),
    );
  }
}
