import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:get/get.dart';

import '../data/model/home_model.dart';
import 'cart_controller.dart';

abstract class ProductDetailsController extends GetxController
{

}
class ProductDetailsControllerImp extends ProductDetailsController
{
  late ProductModel productModel ;


  int currentImageIndex = 0 ;
  CarouselController carouselController = CarouselController();

  changeImageIndex(int index) {
    currentImageIndex = index ;
    update();
  }

  goBack() {
    Get.back();
    currentImageIndex= 0 ;
  }
  @override
  void onInit() {
    productModel =Get.arguments['productModel'] ;
    super.onInit();
  }
}