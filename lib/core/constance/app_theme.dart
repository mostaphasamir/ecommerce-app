import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/change_local.dart';
import 'app_color.dart';

class AppTheme {
  LocalController controller = Get.put(LocalController());
  static ThemeData customLightTheme=ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.gray,
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(fontFamily:'Source_Serif_Pro' ,color: Colors.grey),
      fillColor: AppColor.black,
    ),
    primaryColor: AppColor.primary,
    textTheme:AppFontTheme.appFontEnglishTheme,
  );
  static ThemeData customDarkTheme=ThemeData.dark().copyWith();

}


class AppFontTheme{
  static TextTheme appFontArabicTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w800,fontSize: 40,color: AppColor.black),
    displayMedium: TextStyle(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.w300),
  );
  static const appFontEnglishTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Source_Serif_Pro',fontWeight: FontWeight.w800,fontSize: 40,color: AppColor.black),
    displayMedium: TextStyle(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.w300),
    titleMedium:TextStyle(color: AppColor.black),

  );
}