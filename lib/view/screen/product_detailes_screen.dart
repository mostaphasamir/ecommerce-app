import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/favorite_controller.dart';
import '../../controller/product_details_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({super.key});
  final ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
             controller.goBack();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 40,
              color: AppColor.blueGreyVeryDark,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SizedBox(
              //width: Get.width,
              height: 100,
              child: Row(
                children: [
                  GetBuilder<CartControllerImp>
                    (
                    init: CartControllerImp(),
                    builder: (cartController) => Expanded(
                    child: InkWell(
                      onTap: ()
                      {
                        cartController.addToCart(controller.productModel);
                      },
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.only(
                            bottom: 50,),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Add TO Cart".tr,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.white)),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),),
                  const SizedBox(width: 10,),
                  Container(
                    color: Theme.of(context).primaryColor,
                    margin: const EdgeInsets.only(bottom: 50,),
                    child: GetBuilder<FavoriteControllerImp>(
                      init: FavoriteControllerImp(),
                      builder: (favController) => IconButton(
                        onPressed: () {
                          favController.addOrRemoveFromFavorite(controller.productModel.id);
                        },
                        icon:favController.favoritesProduct[controller.productModel.id]==true?const Icon(
                          Icons.favorite,
                          color: Colors.red)
                              :const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Hero(
                    tag: controller.productModel.id,
                    child: PageStorage(
                      bucket: PageStorageBucket(),
                      child: CarouselSlider(
                        carouselController: controller.carouselController,
                        items: controller.productModel.images?.map((e) => CachedNetworkImage(
                          width: double.infinity,
                          imageUrl: e,
                          placeholder: (context, url) => FadeShimmer.round(
                            size: 60,
                            fadeTheme:FadeTheme.light,
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),


                        )
                            .toList(),
                        options: CarouselOptions(
                          height: 300,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 6),
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.ease,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index, reason) {
                           controller.changeImageIndex(index);
                          },
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<ProductDetailsControllerImp>(
                    builder: (controller) => AnimatedSmoothIndicator(
                      activeIndex: controller.currentImageIndex,
                      count: controller.productModel.images!.length,
                      effect: const WormEffect(),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 100),
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: Get.width,
                constraints: BoxConstraints(
                    minHeight:
                        Get.height - 310 - MediaQuery.of(context).padding.top),
                decoration:  BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.productModel.name,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${controller.productModel.price}\$',
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20)
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        controller.productModel.discount != 0
                            ? Text(
                                '${controller.productModel.oldPrice}\$',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              )
                            : const Text(''),
                      ],
                    ),
                    const Divider(
                      color: AppColor.white,
                    ),
                    Text(
                      "Description :".tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 20),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(controller.productModel.description,style:Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 14)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
