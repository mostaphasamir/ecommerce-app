import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/constance/app_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_controller.dart';

class ProfileScreen extends GetView<BottomNavigationControllerImp> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width:double.infinity ,
      height: double.infinity,
      color: AppColor.gray,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AppWidth.w5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(controller.userData.data!.image,
              ),
              radius: 60,
            ),
             SizedBox(height: AppHeight.h2,),
            Text(controller.userData.data!.name,style: Theme.of(context).textTheme.displayMedium),
            Text(controller.userData.data!.email  ,style: Theme.of(context).textTheme.displayMedium),
            SizedBox(height: 5,),
            const Divider(color: AppColor.blueGreyDark,thickness: 0.2,),
            Container(
              margin: EdgeInsets.only(top: AppHeight.h1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColor.white,
              ),
              child: ListTile(leading: const Icon(Icons.person,color: AppColor.black,),
                onTap:(){} ,
                iconColor: AppColor.white,
                title: const Text('Update Profile',style: TextStyle(color: AppColor.black),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppHeight.h3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColor.white,
              ),
              child: ListTile(leading: const Icon(Icons.logout,color: AppColor.black,),
                onTap:(){
                controller.logout();
                } ,
                title: const Text('Logout',style: TextStyle(color: AppColor.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
