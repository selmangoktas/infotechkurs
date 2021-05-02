import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotechkurs/sqllite/theme/app_lightTheme.dart';

class ThemeState extends GetxController {
  ThemeData currentTheme = appLightTheme;

  changeTheme(ThemeData themeData) {
    currentTheme = themeData;
    update();

    Get.changeTheme(currentTheme);
  }
}
