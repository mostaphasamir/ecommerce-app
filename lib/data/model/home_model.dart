import 'package:get/get.dart';

class HomeModel{
  final bool status ;
  final HomeDataModel data ;

  HomeModel({required this.status, required this.data});
  factory HomeModel.fromJson(Map<String, dynamic> jsonData){
    return HomeModel(
      status: jsonData['status'],
      data:HomeDataModel.fromJson(jsonData['data']),
    );
  }
}


class HomeDataModel {
  List<BannerModel> banners=<BannerModel> [].obs;
  List<ProductModel> products=<ProductModel>[].obs;

  HomeDataModel({required this.banners, required this.products});
   HomeDataModel.fromJson(Map<String, dynamic> jsonData) {
    jsonData['banners'].forEach((element){banners.add(BannerModel.fromJson(element));});
    jsonData['products'].forEach((element){products.add(ProductModel.fromJson(element));});
  }
}


class BannerModel {
  final int id  ;
  final String image ;

  BannerModel({required this.id, required this.image});


  factory BannerModel.fromJson(Map<String, dynamic> jsonData) {
    return BannerModel(
      id: jsonData['id'],
      image: jsonData['image'],
    );
  }
}


class ProductModel {
  final int id ;
  final dynamic price ;
  final dynamic oldPrice ;
  final dynamic discount ;
  final String image;
  final String name ;
  final String description ;
  final List<dynamic>? images ;
  final bool? inFavorites ;
  final bool? inCart ;

  ProductModel({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });


  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      price: jsonData['price'] ,
      oldPrice: jsonData['old_price'] ,
      discount: jsonData['discount'] ,
      image: jsonData['image'],
      name: jsonData['name'],
      description: jsonData['description'],
      images: jsonData['images'],
      inFavorites: jsonData['in_favorites'],
      inCart: jsonData['in_cart'],
    );
  }
}