
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/home_model.dart';

Widget favoriteScreenItem(
  {
    required ProductModel productModel ,
  required VoidCallback onPressedFavorite ,
  required VoidCallback onPressedNavigate ,
  required context ,

}
    )=> GestureDetector(
  onTap: onPressedNavigate,
  child:   Container(
    color: Theme.of(context).colorScheme.primary,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
          child:  CachedNetworkImage(
            fit: BoxFit.fill ,
            width: 100,
            height: 100,
            imageUrl: productModel.image,
            placeholder: (context, url) => FadeShimmer.round(
              size: 1,
              fadeTheme:Get.isDarkMode?FadeTheme.dark:FadeTheme.light,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            height: 100,
            width: Get.width*0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                        '${productModel.price} \$',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                   productModel.discount != 0 ? Text(
                      '${productModel.oldPrice.floor()} \$',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                        fontSize: 9,
                      ),
                    ) : const Text(''),
                  ],

                ),
              ],
            )),
        IconButton(
          onPressed:onPressedFavorite,
          icon: const Icon(
            Icons.favorite,
            size: 35,
            color: Colors.red,
          ),)
      ],
    ),
  ),
);