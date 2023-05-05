import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/api/api.dart';
import '../core/api/constance.dart';
import '../core/constance/app_routs.dart';
import '../data/model/home_model.dart';

abstract class HomeController extends GetxController
{
  getData();
  goToSearchScreen();
  goToProductDetails(ProductModel productModel);
}

class HomeControllerImp extends HomeController
{
  late HomeModel data;
  RxBool isLoading = false.obs;
  Api api =Api();

  GlobalKey<RefreshIndicatorState> refreshKeu = GlobalKey<RefreshIndicatorState>();

  @override
  Future<void> getData() async {
    isLoading(true);
    try {
      var response = await api.get(
          url: AppApiConstance.homeURl, headers: AppApiConstance.baseHeaders);
      data = HomeModel.fromJson(response);
      isLoading(false);
    }catch(e)
    {
      Get.snackbar("something Wrong", e.toString());
    }
  }

  @override
  goToSearchScreen()
  {
    Get.toNamed(AppRoutes.searchScreen,arguments: {
      'data':data,
    });
  }

  @override
  goToProductDetails(ProductModel productModel)
  {
    Get.toNamed(AppRoutes.productDetailsScreen,arguments:{'productModel':productModel} );
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }


}

