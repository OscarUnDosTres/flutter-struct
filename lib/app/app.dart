import 'package:flutter/material.dart';
import 'package:undostresflutter/navigation/route_map.dart';
import 'package:undostresflutter/theme/base_app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerConfig: router,
        title: 'undostres',
        theme: BaseAppTheme.lightTheme);
  }
}
