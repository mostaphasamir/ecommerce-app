import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/constance/app_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';
import '../../core/localization/change_local.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
   final LocalController localController=Get.find();
   final controller = Get.put(ProfileControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(
      builder: (controller) =>
      controller.isLoading?
      const Center(child: CircularProgressIndicator(color: AppColor.primary,),)
          :Container(
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
              const SizedBox(height: 5,),
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
                  title: Text('Update Profile'.tr,style: const TextStyle(color: AppColor.black),),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppHeight.h3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.white,
                ),
                child: ListTile(leading: const Icon(Icons.sunny,color: AppColor.black,),
                  onTap:(){
                    localController.changeTheme();
                  } ,
                  title:  Text('dark theme'.tr,style: const TextStyle(color: AppColor.black)),
                  trailing: Switch(
                      onChanged: (value) {
                    controller.changeTheme(value);
                  }, value: controller.darkTheme
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: AppHeight.h3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: AppColor.white,
                ),
                child: ListTile(leading: const Icon(Icons.sunny,color: AppColor.black,),
                  onTap:(){
                  localController.changeLang();
                  } ,
                  title:  Text('change language'.tr,style: const TextStyle(color: AppColor.black)),
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
                  title:  Text('Logout'.tr,style: const TextStyle(color: AppColor.black)),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
