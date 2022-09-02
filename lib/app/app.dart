import 'package:flutter/material.dart';
import 'package:undostresflutter/navigation/route_map.dart';
import 'package:undostresflutter/theme/base_app_theme.dart';
import 'package:undostresflutter/views/home/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'undostres',
      theme: BaseAppTheme.lightTheme,
      // darkTheme: BaseAppTheme.darkTheme,
      // home: HomeView(title: 'UnDosTres Mexico'),
      initialRoute: RouterMap.initialRoute,
      routes: RouterMap.allRoutes,
    );
  }
}
