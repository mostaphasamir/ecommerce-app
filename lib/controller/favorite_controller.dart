import 'package:get/get.dart';

import '../core/api/api.dart';
import '../core/api/constance.dart';
import '../core/constance/app_routs.dart';
import '../data/model/favorite_model.dart';
import '../data/model/home_model.dart';
import 'home_controller.dart';

abstract class FavoriteController extends GetxController {
  getFavoriteProduct();

  goToProductDetails(ProductModel product);
}

class FavoriteControllerImp extends FavoriteController {
  final HomeControllerImp homeController = Get.put(HomeControllerImp());

  List<ProductModel> favoriteScreenProduct = <ProductModel>[].obs;

  RxBool isLoading = false.obs;
  final Map<int, bool> favoritesProduct = {};
  late FavoriteModel favoriteData;
  ApiHelper api = ApiHelper();

  @override
  getFavoriteProduct() async {
    isLoading(true);
    favoriteScreenProduct.clear();
    api.get(
            url: AppApiConstance.favoritesURl,
            headers: AppApiConstance.baseHeaders()
    ).then((value) {
      favoriteData = FavoriteModel.fromJson(value);
      if (favoriteData.data?.data != null) {
        for (var element in favoriteData.data!.data) {
          favoritesProduct[element.product.id] = true;
          favoriteScreenProduct.add(element.product);
        }
      }
      isLoading(false);
      update();
    }).catchError((e) {
      Get.snackbar("something Wrong", e.toString());
    });
  }

  addOrRemoveFromFavorite(int id) {
    if (favoritesProduct[id] == true) {
      favoriteScreenProduct.removeWhere((element) => element.id == id);
      favoritesProduct.update(id, (value) => false);
      update();
    } else {
      for (var element in homeController.data.data.products) {
        if (element.id == id) {
          favoriteScreenProduct.add(element);
          favoritesProduct[id] = true;
          update();
        }
      }
    }
    api.post(url: AppApiConstance.favoritesURl, body: {
      "product_id": id.toString(),
    }, headers: {
      'lang': 'ar',
      'Authorization': token.toString(),
    }).then((value) => value['status'] == false
        ? Get.snackbar('Error', value.toString())
        : null);
  }

  @override
  goToProductDetails(ProductModel product) {
    ProductModel? productModel;
    for (var element in homeController.data.data.products) {
      if (product.id == element.id) {
        productModel = element;
      }
    }

    Get.toNamed(AppRoutes.productDetailsScreen,
        arguments: {'productModel': productModel});
  }

  @override
  void onInit() {
    getFavoriteProduct();
    super.onInit();
  }
}
