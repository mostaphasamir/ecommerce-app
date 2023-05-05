import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/constance/app_value.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/api/constance.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final FavoriteControllerImp favController = Get.find();
  final HomeControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetX<HomeControllerImp>(
          builder: (controller) =>
          controller.isLoading.value ?
          Center(
            child: CircularProgressIndicator(color: Theme
                .of(context)
                .indicatorColor,),
          )
              : RefreshIndicator(
            key: controller.refreshKeu,
            onRefresh: () => controller.getData(),
            child: Container(
              color: Theme
                  .of(context)
                  .colorScheme
                  .background,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: AppHeight.h1,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppWidth.w3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Offers'.tr,
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleLarge,
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, size: 30,
                              color: AppColor.blueGreyDark,),
                            onPressed: () {
                              controller.goToSearchScreen();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppHeight.h1,
                    ),
                    CarouselSlider(
                      items: controller.data.data.banners
                          .map((e) =>
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill ,
                              width: double.infinity,
                              imageUrl: e.image,
                              placeholder: (context, url) => FadeShimmer.round(
                                size: 60,
                                fadeTheme: Get.isDarkMode?FadeTheme.dark:FadeTheme.light,
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),

                          ),)
                          .toList(),
                      options: CarouselOptions(
                        height: AppHeight.h26,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        // onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                     SizedBox(
                      height: AppHeight.h05,
                    ),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: AppWidth.w3),
                      child: Text(
                          'Product'.tr,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge),
                    ),
                    GridView.builder(
                      padding:EdgeInsets.symmetric(horizontal: AppWidth.w105) ,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: AppHeight.h37,

                      ),
                      itemBuilder: (context, index) =>GestureDetector(
                        onTap: () =>
                            controller.goToProductDetails(
                                controller.data.data.products[index]),
                        child: Card(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                top: AppHeight.h1,
                                left: AppWidth.w1,
                                right: AppHeight.h1,
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    children: [
                                      Hero(
                                        tag: controller.data.data
                                            .products[index].id,
                                        child:  CachedNetworkImage(
                                          // cacheManager: BaseCacheManager,
                                            width: AppWidth.w55,
                                            height: AppHeight.h20,
                                            fit: BoxFit.contain,
                                          imageUrl: controller.data.data.products[index].image,
                                          placeholder: (context, url) => FadeShimmer.round(
                                            size: 10,
                                            fadeTheme:Get.isDarkMode?FadeTheme.dark:FadeTheme.light,
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),


                                        // Image(
                                        //   image: NetworkImage(controller
                                        //       .data.data.products[index]
                                        //       .image,),
                                        //   width: AppWidth.w55,
                                        //   height: AppHeight.h20,
                                        //   fit: BoxFit.contain,
                                        //   errorBuilder: (context, error,
                                        //       stackTrace) =>
                                        //   const Image(
                                        //       image: NetworkImage(
                                        //           AppApiConstance
                                        //               .imageError)),
                                        // ),
                                      ),
                                       SizedBox(
                                        height: AppHeight.h1,
                                      ),
                                      Text(
                                        controller.data.data
                                            .products[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            '${controller.data.data
                                                .products[index]
                                                .price}\$',
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .displaySmall,
                                          ),
                                           SizedBox(
                                            width: AppWidth.w1,
                                          ),
                                          controller.data.data
                                              .products[index].discount !=
                                              0 ? Text(
                                            '${controller.data.data
                                                .products[index].oldPrice
                                                .floor()} \$',
                                            style:  TextStyle(
                                              decoration: TextDecoration
                                                  .lineThrough,
                                              color: Colors.red,
                                              fontSize: 9.sp,
                                            ),
                                          ) : const Text(''),
                                          const Spacer(),
                                          GetBuilder<
                                              FavoriteControllerImp>(
                                            // init: FavoriteControllerImp(),
                                            builder: (favController) =>
                                                IconButton(
                                                    onPressed: () {
                                                      favController
                                                          .addOrRemoveFromFavorite(
                                                          controller.data
                                                              .data
                                                              .products[index]
                                                              .id
                                                      );
                                                    },
                                                    icon: favController
                                                        .favoritesProduct[controller
                                                        .data.data
                                                        .products[index]
                                                        .id] == true
                                                        ? const Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )
                                                        : const Icon(
                                                      Icons
                                                          .favorite_border,
                                                    )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  controller.data.data.products[index]
                                      .discount !=
                                      0
                                      ? Positioned(
                                    top: -10,
                                    left: -10,
                                    child: Container(
                                      padding:  EdgeInsets.all(AppHeight.h05),
                                      color: Colors.red,
                                      child:  Text('Discount'.tr),
                                    ),
                                  )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount:controller.data.data.products.length,),
                  ],
                ),
              ),
            ),
          ),)
    );
  }
}
