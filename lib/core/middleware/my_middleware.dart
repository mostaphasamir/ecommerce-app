import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/constance.dart';
import '../constance/app_routs.dart';
import '../service/services.dart';

class MyMiddleWare extends GetMiddleware
{
  MyServices myServices=Get.find();

  @override
  int get priority =>1;

  @override
  RouteSettings?  redirect(String? route) {
    if(myServices.sharedPreferences.getString('token')!=null){
      token = myServices.sharedPreferences.getString('token')!;
      AppApiConstance.baseHeaders.update('Authorization', (value) => token);
      return const RouteSettings(name: AppRoutes.home);
    }
    return null;
  }
}