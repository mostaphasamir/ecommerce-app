import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../widget/favorite_screen_item.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(FavoriteControllerImp(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: AppColor.gray,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Favorites'.tr, style: Theme
                .of(context)
                .textTheme
                .displayLarge,),
            const SizedBox(height: 10,),
            GetBuilder<FavoriteControllerImp>
              (
              builder: (controller) =>
            controller.isLoading ?
            const Center(child: CircularProgressIndicator(color: AppColor.primary,)):
                GetX<FavoriteControllerImp>(
                  builder: (controller) =>
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              favoriteScreenItem(
                                productModel: controller
                                    .favoriteScreenProduct[index],
                                onPressedFavorite: () {
                                  controller.addOrRemoveFromFavorite(controller.favoriteScreenProduct[index].id);
                                },
                                onPressedNavigate: () {
                                  controller.goToProductDetails(
                                      controller.favoriteScreenProduct[index]);
                                },
                                context: context,
                              ),
                          separatorBuilder: (_, __) =>
                          const SizedBox(height: 6,),
                          itemCount: controller.favoriteScreenProduct.length,
                        ),
                      ),
                ) ,)
          ],
        ),
      ),
    );
  }
}
