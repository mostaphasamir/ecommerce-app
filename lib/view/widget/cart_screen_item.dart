import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constance/app_value.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/constance/app_color.dart';
import '../../data/model/home_model.dart';

Widget cartItem({
  required VoidCallback onPressedDelete,
  required ProductModel cartProduct ,
  required context,
  required VoidCallback incQuantity ,
  required VoidCallback decQuantity ,

})=> Container(
  color: Theme.of(context).colorScheme.primary,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
        child:  CachedNetworkImage(
          width: 100,
          height: 100,
          imageUrl: cartProduct.image,
          placeholder: (context, url) => FadeShimmer.round(
            size: 10,
            fadeTheme: Get.isDarkMode?FadeTheme.dark:FadeTheme.light,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),

        // Image(
        //   image:NetworkImage(
        //     cartProduct.image,
        //   ),
        //   width: 100,
        //   height: 100,
        // ),
      ),
      const SizedBox(
        width: 10,
      ),
      SizedBox(
          height: AppHeight.h14,
          width: Get.width*0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartProduct.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textDirection: Get.locale!.languageCode=="ar"? TextDirection.rtl :TextDirection.ltr ,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Row(
                children: [
                  Text(
                      '${cartProduct.price} \$',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  cartProduct.discount != 0 ? Text(
                    '${cartProduct.oldPrice.floor()} \$',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.red,
                      fontSize: 10,
                    ),
                  ) : const Text(''),
                ],

              ),
              const Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      backgroundColor: AppColor.black,
                      onPressed: decQuantity,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero
                      ),
                      child:Icon(Icons.remove ,color: AppColor.white),

                    ),
                  ),
                   Container(
                    width: 30,
                    height: 30,
                    color: AppColor.black,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: Center(
                      child: GetX<CartControllerImp>(
                        builder:(controller) =>Text(
                          '${controller.quantity[cartProduct.id]}',
                          style:Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 25,
                            color: AppColor.white
                          ) ,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: FloatingActionButton(
                      backgroundColor: AppColor.black,
                      onPressed:incQuantity,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.zero
                      ),
                      child: const Icon(Icons.add,color: AppColor.white),

                    ),
                  ),
                ],
              )
            ],
          )),
      IconButton(
        onPressed:onPressedDelete,
        icon: const Icon(
          Icons.delete,
          size: 30,
        ),)
    ],
  ),
);