import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/constance.dart';
import '../service/services.dart';


class LocalController extends GetxController
{
  MyServices services=Get.find();
  Locale? local ;
  ThemeData themeData = ThemeData();
  TextTheme textTheme = const TextTheme();
<<<<<<< HEAD


=======
>>>>>>> parent of 6a1b720 (last commit)
   changeLang()
  {
    if(local==const Locale('ar'))
      {
        local=const Locale('en');
        services.sharedPreferences.setString('lang', 'en');
<<<<<<< HEAD
        AppApiConstance.baseHeaders.update('lang', (value) => 'en');
=======
        //AppApiConstance.baseHeaders.update('lang', (value) => 'en');
>>>>>>> parent of 6a1b720 (last commit)
        Get.updateLocale(local!);
      }
    else
      {
        local=const Locale('ar');
        services.sharedPreferences.setString('lang', 'ar');
<<<<<<< HEAD
       AppApiConstance.baseHeaders.update('lang', (value) => 'ar');
=======
       // AppApiConstance.baseHeaders.update('lang', (value) => 'ar');
>>>>>>> parent of 6a1b720 (last commit)
        Get.updateLocale(local!);
      }
  }

  changeTheme()
  {
    if(Get.isDarkMode)
      {
        services.sharedPreferences.setString('mode', 'light');
        Get.changeThemeMode(ThemeMode.light);
      }
    else
      {
        services.sharedPreferences.setString('mode', 'dark');
        Get.changeThemeMode(ThemeMode.dark);
      }
  }
  @override
  void onInit() {

    String? sharedPrefLang = services.sharedPreferences.getString('lang');
    String? sharedPrefMode = services.sharedPreferences.getString('mode');
    if(sharedPrefLang=='ar')
    {
      local=const Locale('ar');
    }
    else if (sharedPrefLang=='en')
    {
      local=const Locale('en');
    }
    else
    {
      local=const Locale('ar');
      local=Locale(Get.deviceLocale!.languageCode);
    }
    if(sharedPrefMode=='light')
      {
        Get.changeThemeMode(ThemeMode.light);
      }
    else if (sharedPrefMode=='dark')
      {
        Get.changeThemeMode(ThemeMode.dark);
      }
    else
      {
        Get.changeThemeMode(ThemeMode.light);
      }
    super.onInit();
  }
}