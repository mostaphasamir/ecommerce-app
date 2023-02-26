import 'home_model.dart';

class CartModel {
  CartModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String ? message;
  late final Data data;

  CartModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message =  json['message']==null?null:json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });
  late final List<CartItems> cartItems;
  late final dynamic subTotal;
  late final dynamic total;

  Data.fromJson(Map<String, dynamic> json){
    cartItems = List.from(json['cart_items']).map((e)=>CartItems.fromJson(e)).toList();
    subTotal = json['sub_total'];
    total = json['total'];
  }
}

class CartItems {
  CartItems({
    required this.id,
    required this.quantity,
    required this.product,
  });
  late final int id;
  late final int quantity;
  late final ProductModel product;

  CartItems.fromJson(Map<String, dynamic> json){
    id = json['id'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }
}
