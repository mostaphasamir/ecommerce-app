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
        backgroundColor: AppColor.gray,
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: controller.currentIndex,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.black,
          backgroundColor: Colors.white,
          elevation: 10,
          items:  [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: 'Home'.tr,
              activeIcon: const Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border_outlined),
              label: 'Favorite'.tr,
              activeIcon:  const Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart_outlined ),
              label: 'Cart'.tr,
              activeIcon: const Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_outlined),
              label: 'Account'.tr,
              activeIcon: const Icon(Icons.account_circle),
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
