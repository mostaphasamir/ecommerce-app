import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../widget/favorite_screen_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: AppColor.gray,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text('Favorites',style: Theme.of(context).textTheme.displayLarge,) ,
            const SizedBox(height: 10,),
            GetX<BottomNavigationControllerImp>(
              builder: (controller) => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => favoriteScreenItem(
                    productModel: controller.favoriteScreenProduct[index],
                    onPressedFavorite: (){
                      controller.removeFromFavorite(index);
                    },
                    onPressedNavigate: (){
                      controller.goToProductDetails(controller.favoriteScreenProduct[index]);
                    },
                    context: context ,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 6,),
                  itemCount: controller.favoriteScreenProduct.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
