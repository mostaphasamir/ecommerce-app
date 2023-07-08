import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/constance/app_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(
        builder: (controller) => controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                color: Theme.of(context).colorScheme.background,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppWidth.w5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      CachedNetworkImage(
                        imageUrl: controller.userData.data!.image,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundImage: imageProvider,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          radius: 60,
                        ),
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => CircleAvatar(
                            radius: 60,
                            child: Image.asset("assets/images/profileimage.png")),
                      ),
                      SizedBox(
                        height: AppHeight.h2,
                      ),
                      Text(controller.userData.data!.name,
                          style: Theme.of(context).textTheme.displayMedium),
                      Text(controller.userData.data!.email,
                          style: Theme.of(context).textTheme.displayMedium),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: AppColor.blueGreyDark,
                        thickness: 0.2,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: AppHeight.h1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.pageview_rounded,
                          ),
                          onTap: () {
                            controller.goToUpdateProfile(controller.userData);
                          },
                          iconColor: AppColor.white,
                          title: Text(
                            'Update Profile'.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: AppHeight.h3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.sunny,
                          ),
                          onTap: () {
                          },
                          title: Text(
                            'dark theme'.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          trailing: Switch(
                              onChanged: (value) {
                                controller.changeTheme();
                              },
                              value: controller.darkTheme,
                            activeColor: AppColor.primary,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: AppHeight.h3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.language,
                          ),
                          onTap: () {
                            controller.changeLanguage();
                          },
                          title: Text(
                            'change language'.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: AppHeight.h3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout,
                          ),
                          onTap: () {
                            controller.logout();
                          },
                          title: Text(
                            'Logout'.tr,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
