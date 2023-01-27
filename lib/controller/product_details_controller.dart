import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController
{
  changeIndex(int index);
  goBack();
}

class ProductDetailsImpController extends ProductDetailsController
{
  int currentImageIndex = 0 ;
  CarouselController carouselController = CarouselController();

  @override
  changeIndex(int index) {
    currentImageIndex = index ;
    update();
  }

  @override
  goBack() {
    Get.back();
  }

}