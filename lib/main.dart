import 'package:flutter/material.dart';

import 'package:flutter_caculator/pages/caculator_page.dart';
import 'package:flutter_caculator/route_navigator/route_generator.dart';
import 'package:flutter_caculator/route_navigator/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.home,
    );
  }
}
