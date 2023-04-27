import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/favorite_controller.dart';
import 'package:ecommerce/controller/profile_controller.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeControllerImp(),fenix: true);
    Get.lazyPut(() => FavoriteControllerImp(),fenix: true);
    Get.lazyPut(() => CartControllerImp(),fenix: true);
    Get.lazyPut(() => ProfileControllerImp(),fenix: true);
  }


}