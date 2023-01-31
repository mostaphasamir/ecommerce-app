import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../data/model/home_model.dart';

abstract class ProductDetailsController extends GetxController
{
  changeIndex(int index);
  goBack();
}

class ProductDetailsImpController extends ProductDetailsController
{
  int currentImageIndex = 0 ;
  CarouselController carouselController = CarouselController();
  late ProductModel product ;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  changeIndex(int index) {
    currentImageIndex = index ;
    update();
  }

  @override
  goBack() {
    Get.back();
  }

  getData()
  {
    product = Get.arguments['productData'];
  }

}