import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shaky_animated_listview/widgets/animated_gridview.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../../core/constance/app_routs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<BottomNavigationControllerImp>(
        init: BottomNavigationControllerImp(),
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sella',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          IconButton(
                            icon: const Icon(Icons.search,size: 30,),
                            onPressed: () {
                              Get.toNamed(AppRoutes.searchScreen);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CarouselSlider(
                      items: controller.data.data.banners
                          .map((e) => Image(
                                image: NetworkImage(e.image),
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ))
                          .toList(),
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text('Product',
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    AnimatedGridView(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      duration: 100,
                      crossAxisCount: 2,
                      mainAxisExtent: 265,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      children: List.generate(
                        controller.data.data.products.length,
                        (index) => GestureDetector(
                          onTap: () => Get.toNamed(
                            AppRoutes.productDetailsScreen,
                            arguments: controller.data.data.products[index],
                          ),
                          child: Card(
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: Colors.blueGrey,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 10,
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Column(
                                      children: [
                                        Image(
                                          image: NetworkImage(controller
                                              .data.data.products[index].image),
                                          width: 200,
                                          height: 150,
                                          fit: BoxFit.contain,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller
                                              .data.data.products[index].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(color: AppColor.white),
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            Text(
                                                '${controller.data.data.products[index].price}\$'),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            controller.data.data.products[index]
                                                        .discount !=
                                                    0
                                                ? Text(
                                                    '${controller.data.data.products[index].oldPrice.floor()} \$',
                                                    style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.red,
                                                      fontSize: 9,
                                                    ),
                                                  )
                                                : const Text(''),
                                            const Spacer(),
                                            GetBuilder<BottomNavigationControllerImp>(
                                              builder: (controller) =>
                                                  IconButton(
                                                      onPressed: () {
                                                        //TODO add item to favorite
                                                        controller.addOrRemoveFromFavorite(
                                                                controller
                                                                    .data
                                                                    .data
                                                                    .products[
                                                                        index]
                                                                    .id);
                                                      },
                                                      icon: controller.favoritesProduct[
                                                                  controller
                                                                      .data
                                                                      .data
                                                                      .products[
                                                                          index]
                                                                      .id] ==
                                                              true
                                                          ? const Icon(
                                                              Icons.favorite,
                                                              color: Colors.red,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                            )
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
                                              padding: const EdgeInsets.all(5),
                                              color: Colors.red,
                                              child: const Text('Discount'),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
