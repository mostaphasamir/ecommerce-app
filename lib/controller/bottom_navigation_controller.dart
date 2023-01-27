import 'package:ecommerce/core/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/api/constance.dart';
import '../data/model/home_model.dart';
import '../view/screen/cart.dart';
import '../view/screen/favorite_screen.dart';
import '../view/screen/home.dart';
import '../view/screen/profile_screen.dart';

abstract class BottomNavigationController extends GetxController
{

}
class BottomNavigationControllerImp extends BottomNavigationController {

  @override
  void onInit() {
    getData();

    super.onInit();
  }
  int currentIndex = 0 ;
  List<Widget> screen = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];


  void changeIndex(int index)
  {
    currentIndex = index ;
    update();
  }
  
  //
  late HomeModel data;
  bool isLoading = true;
  Map<int,bool > favoritesProduct={} ;

  getData()
  {

    Api api = Api();
    api.get(url: "https://student.valuxapps.com/api/home",token: token).then((value) {
       data =HomeModel.fromJson(value);
       data.data.products.forEach((element) {favoritesProduct[element.id]=element.inFavorites;});
       isLoading = false  ;
       update();
    });
  }
  //product



  addOrRemoveFromFavorite(int id)
  {
    favoritesProduct.update(id, (value) => value = !value);
    update();

    Api api = Api();
    api.post(url:"https://student.valuxapps.com/api/favorites" ,
        body:{
        "product_id": id.toString() ,
         },
        headers: {
      'lang':'ar',
      'Authorization':token.toString(),
    }).then((value) => value['status']==false?Get.snackbar('Error', 'Something Wrong'):null);
  }
}
