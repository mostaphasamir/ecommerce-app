import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {

  static ThemeData customLightTheme=ThemeData.light().copyWith(
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(fontFamily:'Source_Serif_Pro' ,color: AppColor.black),
      fillColor: AppColor.black,
    ),
    textTheme: AppFontTheme.appFontEnglishTheme,
  );
  static ThemeData customDarkTheme=ThemeData.dark().copyWith();

}


class AppFontTheme{
  static TextTheme appFontArabicTheme = const TextTheme(
    displayLarge: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w800,fontSize: 40,color: AppColor.white),
    displayMedium: TextStyle(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.w300),
  );
  static const appFontEnglishTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Source_Serif_Pro',fontWeight: FontWeight.w800,fontSize: 40,color: AppColor.white),
    displayMedium: TextStyle(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.w300),
  );


}