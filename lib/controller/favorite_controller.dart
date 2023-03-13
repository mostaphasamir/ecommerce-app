import 'package:get/get.dart';

import '../core/api/api.dart';
import '../core/api/constance.dart';
import '../core/constance/app_routs.dart';
import '../data/model/favorite_model.dart';
import '../data/model/home_model.dart';
import 'home_controller.dart';

abstract class FavoriteController extends GetxController
{getFavoriteProduct();
goToProductDetails(ProductModel product);
}
class FavoriteControllerImp extends FavoriteController
{

  final homeController = Get.put(HomeControllerImp());
  List<ProductModel> favoriteScreenProduct =<ProductModel> [].obs ;
  bool isLoading = false;
  final Map<int,bool > favoritesProduct={};
  late FavoriteModel favoriteData;
  Api api =Api();


  @override
  getFavoriteProduct()
  {
    api.get(url: AppApiConstance.favoritesURl,token: token)
        .then((value) {
      favoriteData = FavoriteModel.fromJson(value);
      if(favoriteData.data.data.isNotEmpty)
        {
          for (var element in favoriteData.data.data) {
            favoritesProduct[element.product.id]=true;
            favoriteScreenProduct.add(element.product);
          }
        }
      isLoading= false;
      update();
    });
  }


  addOrRemoveFromFavorite(int id)
  {
    if(favoritesProduct[id]==true)
    {
      favoriteScreenProduct.removeWhere((element) => element.id==id);
      favoritesProduct.update(id, (value) => false);
      update();
    }
    else{
      for (var element in homeController.data.data.products) {
        if(element.id==id)
        {
          favoriteScreenProduct.add(element);
          favoritesProduct[id]=true;
          update();
        }
      }
    }
    api.post(url:AppApiConstance.favoritesURl ,
        body:{
          "product_id": id.toString() ,
        },
        headers: {
          'lang':'ar',
          'Authorization':token.toString(),
        }).then((value) => value['status']==false?Get.snackbar('Error', value.toString()):null);
  }
  @override
  goToProductDetails(ProductModel product)
  {
    ProductModel? productModel ;
    for(var element in homeController.data.data.products)
      {
        if(product.id==element.id)
          {
            productModel= element ;
          }
   }

    Get.toNamed(AppRoutes.productDetailsScreen,arguments:{'productModel':productModel});
  }

  @override
  void onInit() {
    isLoading = true;
    getFavoriteProduct();
    super.onInit();
  }
}