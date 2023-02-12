import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/core/api/api.dart';
import 'package:ecommerce/core/constance/app_routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/api/constance.dart';
import '../data/model/cart_model.dart';
import '../data/model/home_model.dart';
import '../view/screen/cart.dart';
import '../view/screen/favorite_screen.dart';
import '../view/screen/home.dart';
import '../view/screen/profile_screen.dart';

abstract class BottomNavigationController extends GetxController
{

}
class BottomNavigationControllerImp extends BottomNavigationController {

  Api api = Api();

  @override
  void onInit() {
    print(token);
    getData();
    getCartProduct() ;
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
    api.get(url: "https://student.valuxapps.com/api/home",token: token).then((value) {
       data =HomeModel.fromJson(value);
       for (var element in data.data.products) {favoritesProduct[element.id]=element.inFavorites;}
       isLoading = false  ;
       update();

       favoriteScreenProduct.value = data.data.products.where((element) => element.inFavorites==true).toList() ;
    });
  }


  goToSearchScreen()
  {
    Get.toNamed(AppRoutes.searchScreen,arguments: {
      'data':data,
    });
  }


  goToProductDetails(ProductModel productModel)
  {
    product =productModel ;
    Get.toNamed(AppRoutes.productDetailsScreen);
  }
  //product



  addOrRemoveFromFavorite(int id)
  {

    if(favoritesProduct[id]==true)
      {
        favoriteScreenProduct.removeWhere((element) => element.id==id);

      }
    else{
      for (var element in data.data.products) {
        if(element.id==id)
        {
          favoriteScreenProduct.add(element);
        }
      }
    }


    favoritesProduct.update(id, (value) => value = !value);

    update();
    api.post(url:"https://student.valuxapps.com/api/favorites" ,
        body:{
        "product_id": id.toString() ,
         },
        headers: {
      'lang':'ar',
      'Authorization':token.toString(),
    }).then((value) => value['status']==false?Get.snackbar('Error', value.toString()):null);
  }


  //favorite

 var favoriteScreenProduct = [].obs;


  removeFromFavorite(index)
  {
    addOrRemoveFromFavorite(favoriteScreenProduct[index].id) ;
  }

  //cart Data
  late CartModel cartDate ;
  var cartProduct = [].obs ;
  var quantity  = {}.obs;

  getCartProduct()
  {
    api.get(url: "https://student.valuxapps.com/api/carts",token: token).then((value) {
      cartDate =CartModel.fromJson(value);
      for (var element in cartDate.data.cartItems) {
        cartProduct.add(element.product);
        quantity[element.product.id.toInt()]=element.quantity.toInt() ;
        print(cartProduct);
      }
    });
  }




  //product details controller

  int currentImageIndex = 0 ;
  CarouselController carouselController = CarouselController();
  late ProductModel product ;



  changeImageIndex(int index) {
    currentImageIndex = index ;
    update();
  }

  goBack() {
    Get.back();
    currentImageIndex= 0 ;
  }

  addToCart(ProductModel model)
  {
    if(checkProduct(model))
      {
        quantity[model.id.toInt()]++ ;
      }
    else
      {
        quantity[model.id]=1;
        api.post(url: "https://student.valuxapps.com/api/carts",
            body: {
          "product_id": model.id.toString(),
        },
          headers: {
            'lang':'en',
            'Authorization':token??'',
          }
        ).then((value) {
          if(value['status']==true)
            {
              Get.snackbar('done',"Item added to cart successfully.");
            }
        }).catchError((e)=>Get.snackbar('Error', e.toString()));
        cartProduct.add(model);
      }
  }


  checkProduct(ProductModel model)
  {
    for(ProductModel element in cartProduct){
      if (element.id==model.id)
        {
          return true ;
        }
    }
    return false ;
  }
}
