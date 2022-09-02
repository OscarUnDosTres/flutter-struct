// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:undostresflutter/core/extensions/color_ext.dart';
import 'package:undostresflutter/theme/color_schemes.g.dart';

class BaseAppTheme {
  static const Color udtBlue = Color(0xFF009FDD);
  static const Color udtDarkBlue = Color(0xFF0B1E3E);

  Color udtBlueDisabled = "#009FDD".toColor();
  Color udtWhite = "#FFFFFF".toColor();
  Color udtAlmostWhite = "#F9F9F9".toColor();
  Color udtGray = "#888888".toColor();
  Color udtMediumGray = "#99A1AD".toColor();
  Color udtGrayBackground = "#E9E9E9".toColor();

  static ThemeData get lightTheme {
    return ThemeData(colorScheme: lightColorScheme, useMaterial3: true);
  }

  static ThemeData get darkTheme {
    return ThemeData(colorScheme: darkColorScheme, useMaterial3: true);
  }
}
