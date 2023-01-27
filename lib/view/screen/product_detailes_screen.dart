import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../controller/product_details_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel product = Get.arguments;
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
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: AppColor.blueGrey,
            ),
          ),
          Spacer(),
          Container(
            width: Get.width,
            height: 100,
            color: Colors.red,
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
                  CarouselSlider(
                    carouselController: controller.carouselController,
                    items: product.images
                        .map((e) => Image(
                              image: NetworkImage(e),
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.ease,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        controller.changeIndex(index);
                      },
                    ),
                  ),
                  GetBuilder<ProductDetailsImpController>(
                    builder: (controller) => AnimatedSmoothIndicator(
                      activeIndex: controller.currentImageIndex,
                      count: product.images.length,
                      effect: WormEffect(),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(top: 10),
                width: Get.width,
                height: 500,
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
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: AppColor.white),
                    ),
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
