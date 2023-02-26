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
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Favorite',
              activeIcon:  Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined ),
              label: 'Cart',
              activeIcon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
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
