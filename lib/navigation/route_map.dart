import 'package:flutter/material.dart';
import 'package:undostresflutter/views/home/home_view.dart';

const homeScreen = "/home";
final routes = <String, Widget Function(BuildContext)>{
  "/home": (context) => HomeView(title: 'UnDosTres')
};

class RouterMap {
  Navigator navigator;

  RouterMap({required this.navigator});

  static String get initialRoute {
    return homeScreen;
  }

  static Map<String, Widget Function(BuildContext)> get allRoutes {
    return routes;
  }
}
