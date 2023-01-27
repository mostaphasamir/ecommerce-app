import 'package:ecommerce/data/model/home_model.dart';
import 'package:get/get.dart';

import '../core/api/api.dart';
import '../core/api/constance.dart';
import 'bottom_navigation_controller.dart';

abstract class SearchScreenController extends GetxController
{
    changeSearchValue(String value);
}

class SearchScreenControllerImp extends SearchScreenController
{


  late String searchValue ;
  late HomeModel data;
  List<ProductModel> dataFilter =[] ;


  @override
  void onInit() {
    getData();
    super.onInit();
  }


  getData()
  {
    Api api = Api();
    api.get(url: "https://student.valuxapps.com/api/home",token: token).then((value) {
      data =HomeModel.fromJson(value);
    });
  }
  @override
  changeSearchValue(String value) {
    searchValue= value ;
    dataFilter.clear();
    dataFilter.addAll(data.data.products.where((element) => element.name.toLowerCase().contains(searchValue)).toList());
    print(dataFilter.length);
    update();
  }

}