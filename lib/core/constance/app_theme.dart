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
  static const appFontArabicTheme = TextTheme(
    headline1: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: 40,color: AppColor.black),
    bodyText1: TextStyle(height: 2,color: AppColor.gray) ,
  );
  static const appFontEnglishTheme = TextTheme(
    headline1: TextStyle(fontFamily: 'Source_Serif_Pro',fontWeight: FontWeight.bold,fontSize: 40,color: AppColor.black),
    bodyText1: TextStyle(color: AppColor.black,fontSize: 16,fontWeight: FontWeight.w300),
  );


}