import 'package:ecommerce/core/service/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/cart.dart';
import '../view/screen/favorite_screen.dart';
import '../view/screen/home.dart';
import '../view/screen/profile_screen.dart';

abstract class BottomNavigationController extends GetxController
{

}
class BottomNavigationControllerImp extends BottomNavigationController {

  @override
  void onInit() {
   MyServices myServices = Get.find();
    if (kDebugMode) {
      print( myServices.sharedPreferences.getString('token')
      );
    }
    super.onInit();
  }

  Widget currentScreen = HomeScreen();
  int  currentIndex = 0 ;

  changeScreen(int value)
  {
    currentIndex =value ;
    switch(currentIndex) {
      case 0: {
        currentScreen =HomeScreen();
      }
      break;
      case 1: {
        currentScreen=FavoriteScreen();
      }
        break;
      case 2: {
      currentScreen=  CartScreen();
      }
        break;
      case 3:{
      currentScreen=  ProfileScreen();
      }
        break;
      default: {
        //statements;
      }
      break;
    }
    update();
  }

  // List<Widget> screen = [
  //   HomeScreen(),
  //    FavoriteScreen(),
  //    CartScreen(),
  //   ProfileScreen(),
  // ];


  // void changeIndex(int index)
  // {
  //   currentIndex = index ;
  //   update();
  // }

}
