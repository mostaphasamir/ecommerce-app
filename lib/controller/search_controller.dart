import 'package:get/get.dart';

import '../core/constance/app_routs.dart';
import '../data/model/home_model.dart';

abstract class SearchController extends GetxController
{
  changeSearchValue(String value);
  goToProductDetails(ProductModel productModel);
}
class SearchControllerImp extends SearchController
{
  late HomeModel data;
  late String searchValue ;
  List<ProductModel> dataFilter =[] ;
  bool isEmpty = false ;

  @override
  changeSearchValue(String value){
    searchValue= value ;
    dataFilter.clear();
    dataFilter.addAll(data.data.products.where((element) => element.name.toLowerCase().contains(searchValue)).toList());
    dataFilter.isEmpty?isEmpty=true:isEmpty=false ;
    update();
  }

  @override
  goToProductDetails(ProductModel productModel)
  {
    Get.toNamed(AppRoutes.productDetailsScreen,arguments:{'productModel':productModel} );
  }

  @override
  void onInit() {
    data = Get.arguments['data'];
    super.onInit();
  }
}