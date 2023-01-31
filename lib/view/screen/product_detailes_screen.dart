import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/product_details_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsImpController controller =
        Get.put(ProductDetailsImpController());
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
          SizedBox(
            width: Get.width,
            height: 100,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      //TODO add item to cart
                    },
                    child: Container(
                      color: AppColor.blueGreyDark,
                      margin: const EdgeInsets.only(
                          bottom: 50, left: 20, right: 10),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Add TO Cart"),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: const Color(0xff274b69),
                  margin: const EdgeInsets.only(bottom: 50, left: 2, right: 20),
                  child: IconButton(
                    onPressed: () {
                      //TODO add item to favorite
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
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
                    tag: controller.product.id,
                    child: CarouselSlider(
                      carouselController: controller.carouselController,
                      items: controller.product.images.map((e) => Image(
                                image: NetworkImage(e),
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),)
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
                          controller.changeIndex(index);
                        },
                      ),
                    ),
                  ),
                  GetBuilder<ProductDetailsImpController>(
                    builder: (controller) => AnimatedSmoothIndicator(
                      activeIndex: controller.currentImageIndex,
                      count: controller.product.images.length,
                      effect: const WormEffect(),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 80),
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: Get.width,
                constraints: BoxConstraints(
                    minHeight:
                        Get.height - 310 - MediaQuery.of(context).padding.top),
                decoration: const BoxDecoration(
                    color: AppColor.blueGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.product.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColor.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${controller.product.price}\$',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        controller.product.discount != 0
                            ? Text(
                                '${controller.product.oldPrice}\$',
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
                      "Description :",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: AppColor.white, fontSize: 20),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(controller.product.description))
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
