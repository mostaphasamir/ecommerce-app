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
  bool isLoading = false;
  Api api =Api();


  @override
  getData()
  {
    api.get(url: AppApiConstance.homeURl,token: token).then((value) {
      data =HomeModel.fromJson(value);
      isLoading=false;
      update();
    });


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
    isLoading=true;
    update();
    getData();
    super.onInit();
  }
}

