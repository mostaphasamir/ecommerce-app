
import 'package:ecommerce/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constance/app_color.dart';

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
    color: AppColor.blueGreyDark,
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
          child: Image(
            image:NetworkImage(
              productModel.image,
            ),
            width: 100,
            height: 100,
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
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Spacer(),

                Row(
                  children: [
                    Text(
                        '${productModel.price} \$'),
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