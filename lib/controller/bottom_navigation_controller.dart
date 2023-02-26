import 'package:carousel_slider/carousel_controller.dart';
import 'package:ecommerce/core/api/api.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/constance/app_routs.dart';
import 'package:ecommerce/core/service/services.dart';
import 'package:ecommerce/data/model/shop_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  List<Widget> screen =const [
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

    api.get(url: 'https://student.valuxapps.com/api/profile',token: token).then((value) {
      userData = ShopLoginModel.fromJson(value);
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
  RxDouble total = 0.0.obs  ;

  getCartProduct()
  {
    api.get(url: "https://student.valuxapps.com/api/carts",token: token).then((value) {
      cartDate =CartModel.fromJson(value);
      for (var element in cartDate.data.cartItems)
      {
        cartProduct.add(element.product);
        quantity[element.product.id.toInt()]=element.quantity.toInt() ;
      }
    }).then( (value) =>  checkOutCalc(),);
  }

  removeFromCart(ProductModel model)
  {

    cartProduct.remove(model);
    checkOutCalc();
    api.post(url: "https://student.valuxapps.com/api/carts",
        body: {
          "product_id": model.id.toString(),
        },
        headers: {
          'lang':'en',
          'Authorization':token,
        }
    ).catchError((e)=>printError(info: e.toString()));
  }


  incrementQuantity(int id)
  {
    quantity[id.toInt()]++ ;
    checkOutCalc();
  }
  decrementQuantity(int id)
  {
    quantity[id.toInt()]<=1?Null :quantity[id.toInt()]-- ;
    checkOutCalc();
  }


  checkOutCalc()
  {
    total.value = 0 ;
    for(ProductModel item in cartProduct)
      {
        total.value += item.price * quantity[item.id.toInt()];
      }
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
            'Authorization':token,
          }
        ).then((value) {
          if(value['status'])
            {
              Fluttertoast.showToast(
                  msg: "Item added to cart successfully.",
                  toastLength: Toast.LENGTH_SHORT,
                  textColor: AppColor.white,
                  backgroundColor: AppColor.blueGreyVeryDark ,
                gravity: ToastGravity.BOTTOM,
              );
            }
        // ignore: invalid_return_type_for_catch_error
        }).catchError((e)=>Get.snackbar('Error', e.toString()));
        cartProduct.add(model);
      }
    checkOutCalc() ;
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


  //search controller


  late String searchValue ;
  List<ProductModel> dataFilter =[] ;


  changeSearchValue(String value){
    searchValue= value ;
    dataFilter.clear();
    dataFilter.addAll(data.data.products.where((element) => element.name.toLowerCase().contains(searchValue)).toList());
    update();
  }

  //############################//

  //setting

   // api.get(url: 'https://student.valuxapps.com/api/profile').then()


  late ShopLoginModel userData ;
  MyServices myServices=Get.find();
  logout()
  {

    myServices.sharedPreferences.remove('token');
    token='';
    Get.offAllNamed(AppRoutes.login);
  }
}
