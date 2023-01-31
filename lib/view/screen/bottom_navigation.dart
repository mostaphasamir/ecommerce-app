import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_controller.dart';


class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationControllerImp>(
      init: BottomNavigationControllerImp(),
      builder:(controller)=> Scaffold(
        backgroundColor: AppColor.blueGrey,
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.white30,
          backgroundColor: Colors.white,
          elevation: 100,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: AppColor.blueGreyDark,
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColor.blueGreyDark,
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorite',
              activeIcon:  Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColor.blueGreyDark,
              icon: Icon(Icons.shopping_cart_outlined ),
              label: 'Cart',
              activeIcon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColor.blueGreyDark,
              icon: Icon(Icons.account_circle_outlined),
              label: 'Account',
              activeIcon: Icon(Icons.account_circle),
            ),
          ],
          onTap:(value) {
            controller.changeIndex(value) ;
          } ,
        ) ,
        body:controller.screen[controller.currentIndex],
      ),
    );
  }
}
