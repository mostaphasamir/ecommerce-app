import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/constance.dart';
import '../constance/app_theme.dart';
import '../service/services.dart';


class LocalController extends GetxController
{
  MyServices services=Get.find();
  late Locale local ;
  ThemeData themeData = ThemeData();
   changeLang()
  {
    if(local==const Locale('ar'))
      {
        local=const Locale('en');
        services.sharedPreferences.setString('lang', 'en');
        Get.updateLocale(local);
      }
    else
      {
        local=const Locale('ar');
        services.sharedPreferences.setString('lang', 'ar');
        Get.updateLocale(local);
      }
  }

  changeTheme()
  {
    if(Get.isDarkMode)
      {
        services.sharedPreferences.setString('mode', 'light');
        Get.changeTheme(AppTheme.customLightTheme);
      }
    else
      {
        services.sharedPreferences.setString('mode', 'dark');
        Get.changeTheme(AppTheme.customDarkTheme);
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
    else if (sharedPrefLang =='en')
    {
      local=const Locale('en');
    }
    else
    {
      var deviceLanguage = Get.deviceLocale!.languageCode ;
      local=Locale(deviceLanguage);
    }

    if(sharedPrefMode=='dark')
    {
      Get.changeTheme(AppTheme.customDarkTheme);
    }
    else{
      Get.changeTheme(AppTheme.customLightTheme);
    }
    super.onInit();
  }
}