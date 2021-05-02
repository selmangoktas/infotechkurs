import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infotechkurs/sqllite/theme/theme_state.dart';
import 'package:infotechkurs/sqllite/view/view_sql.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeState themeState = Get.put(ThemeState());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: themeState.currentTheme,
      debugShowCheckedModeBanner: false,
      home: SqlViewPage(),
    );
  }
}
