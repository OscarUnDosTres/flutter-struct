import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:undostresflutter/core/utils/service_locator.dart';
import 'package:undostresflutter/views/upload_file/image_picker.dart';
import 'package:undostresflutter/views/upload_file/upload_file_view.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app/app.dart';

void main() async {
  setup();
  setPathUrlStrategy();
  runApp(ChangeNotifierProvider(
    create: (context) => ImagePickerProvider(),
    child: MyApp()));
}
