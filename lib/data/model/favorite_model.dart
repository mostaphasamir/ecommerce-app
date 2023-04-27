import 'package:ecommerce/data/model/home_model.dart';

class FavoriteModel {
  FavoriteModel({
    required this.status,
    this.message,
    required this.data,
  });

  final bool status;
  final dynamic message;
  final Data ? data;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    status: json["status"],
    message: json["message"],
    data:json["data"] !=null? Data.fromJson(json["data"]):null,
  );

}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int? from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

}

class Datum {
  Datum({
    required this.id,
    required this.product,
  });

  final int id;
  final ProductModel product;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    product: ProductModel.fromJson(json["product"]),
  );
}
