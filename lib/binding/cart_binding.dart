import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class CartBinding implements Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() =>CartControllerImp(),fenix: true);
  }

}