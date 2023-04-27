import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/favorite_controller.dart';
import '../widget/favorite_screen_item.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.lazyPut(() =>FavoriteControllerImp(),fenix: true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Favorites'.tr, style: Theme
                .of(context)
                .textTheme
                .titleLarge,),
            const SizedBox(height: 10,),
            GetBuilder<FavoriteControllerImp>
              (
              builder: (controller) =>
            controller.isLoading ?
             Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)):
                GetX<FavoriteControllerImp>(
                  builder: (controller) =>
                      controller.favoriteScreenProduct.isEmpty?
                          Center(
                            child: Text('oops... Your Favorite is empty',style: Theme.of(context).textTheme.bodyMedium,),
                          )
                          :
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
