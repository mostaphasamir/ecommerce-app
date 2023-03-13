import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../core/api/constance.dart';
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
    if (kDebugMode) {
      print(token);
    }
    super.onInit();
  }
  int currentIndex = 0 ;
  List<Widget> screen = [
    HomeScreen(),
     FavoriteScreen(),
     CartScreen(),
    ProfileScreen(),
  ];


  void changeIndex(int index)
  {
    currentIndex = index ;
    update();
  }

}
