import 'package:flutter/material.dart';

class AppColor {
  // static Color myPrimaryColor = Color.fromARGB(252, 234, 107, 100);

  static Color myPrimaryColor = const Color.fromARGB(210, 216, 143, 88);
  static Color mySeconderyColor = myPrimaryColor.withAlpha(150);
  static Color textColor = Colors.white;
}

class AppTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: AppColor.myPrimaryColor,
    scaffoldBackgroundColor: AppColor.myPrimaryColor,
    // brightness: Brightness.dark
    // brightness: Brightness.dark,
  );
}
