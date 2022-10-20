import 'package:flutter/material.dart';
import 'package:undostresflutter/core/utils/service_locator.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/app.dart';

void main() async {
  setup();
  setPathUrlStrategy();
  runApp(MyApp());
}
