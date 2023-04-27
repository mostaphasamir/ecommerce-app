import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData customLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColorLight: AppColor.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColor.white,
      background: AppColor.gray,
    ),
    indicatorColor: AppColor.primary,
    secondaryHeaderColor: AppColor.gray,
    scaffoldBackgroundColor: AppColor.gray,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.white,
      selectedItemColor: AppColor.primary,
      unselectedItemColor: AppColor.black,
      elevation: 10,
    ),
    appBarTheme: AppBarTheme(
        color: AppColor.primary,
        titleTextStyle: AppFontTheme.appFontLightTheme.titleLarge),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(fontFamily: 'Source_Serif_Pro', color: Colors.grey),
      fillColor: AppColor.black,
    ),
    primaryColor: AppColor.primary,
    textTheme: AppFontTheme.appFontLightTheme,
  );
  static ThemeData customDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColorLight: AppColor.primaryDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColor.primaryDark,
      background: AppColor.black,
    ),
    indicatorColor: AppColor.primaryDark,
    secondaryHeaderColor: AppColor.gray,
    scaffoldBackgroundColor: AppColor.gray,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.black,
      selectedItemColor: Color(0xff9147ff),
      unselectedItemColor: AppColor.white,
      elevation: 10,
    ),
    appBarTheme: AppBarTheme(
        color: AppColor.primaryDark,
        titleTextStyle: AppFontTheme.appFontLightTheme.titleLarge),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(fontFamily: 'Source_Serif_Pro', color: Colors.grey),
      fillColor: AppColor.white,
    ),
    primaryColor: AppColor.primaryDark,
    textTheme: AppFontTheme.appFontDarkTheme,
  );

  // static ThemeData customDarkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColorLight: Color(0xff3b3e6d),
  //   colorScheme: const ColorScheme.dark(background: Color(0xff1F1F1F)),
  //   secondaryHeaderColor: Color(0xff353535),
  //   scaffoldBackgroundColor: Color(0xff1F1F1F),
  //   appBarTheme: AppBarTheme(
  //     color: Color(0xff3b3e6d),
  //     titleTextStyle: AppFontTheme.appFontLightTheme.titleLarge!
  //         .copyWith(color: Colors.white),
  //   ),
  //   inputDecorationTheme: const InputDecorationTheme(
  //     border: InputBorder.none,
  //     hintStyle: TextStyle(fontFamily: 'Source_Serif_Pro', color: Colors.grey),
  //     fillColor: Colors.white,
  //   ),
  //   primaryColor: Color(0xff3b3e6d),
  //   textTheme: TextTheme(
  //     displayLarge: TextStyle(
  //         fontFamily:
  //             Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
  //         fontWeight: FontWeight.w800,
  //         fontSize: 40,
  //         color: Colors.white),
  //     displayMedium: const TextStyle(
  //         color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
  //     titleLarge: TextStyle(
  //         fontFamily:
  //             Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
  //         fontSize: 20,
  //         fontWeight: FontWeight.w300,
  //         color: Colors.white),
  //   ),
  // );
}

class AppFontTheme {
  static TextTheme appFontLightTheme = TextTheme(
    bodyMedium: TextStyle(
      fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color: AppColor.black,
      fontSize: 16,
      fontWeight: FontWeight.w300,),
    displayLarge: TextStyle(
        fontFamily:
            Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        fontWeight: FontWeight.w800,
        fontSize: 30,
        color: AppColor.black),
    displayMedium: TextStyle(
        fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        color: AppColor.black,
        fontSize: 16,
        fontWeight: FontWeight.w300,),
    displaySmall: TextStyle(
        fontFamily:
            Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        color: AppColor.black,
        fontSize: 12,
        fontWeight: FontWeight.w300,),
    titleLarge: TextStyle(
        fontFamily:
            Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: AppColor.black,),
    titleMedium: TextStyle(
        fontFamily:
            Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: AppColor.white,),
    titleSmall: TextStyle(
        fontFamily:
            Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: AppColor.white),
  );
  static  TextTheme appFontDarkTheme = TextTheme(
    bodyMedium: TextStyle(
      fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color: AppColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,),
    displayLarge: TextStyle(
        fontFamily:
        Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        fontWeight: FontWeight.w800,
        fontSize: 30,
        color: AppColor.white),
    displayMedium: TextStyle(
      fontFamily:Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color: AppColor.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,),
    displaySmall: TextStyle(
      fontFamily:
      Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      color: AppColor.white,
      fontSize: 12,
      fontWeight: FontWeight.w300,),
    titleLarge: TextStyle(
      fontFamily:
      Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      fontSize: 40,
      fontWeight: FontWeight.w800,
      color: AppColor.white,),
    titleMedium: TextStyle(
      fontFamily:
      Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColor.white,),
    titleSmall: TextStyle(
        fontFamily:
        Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Source_Serif_Pro',
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: AppColor.black,
    ),
  );
}
