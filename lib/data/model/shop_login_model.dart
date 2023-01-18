import 'package:flutter/cupertino.dart';

class ShopLoginModel {
  final bool status;

  final String message;

  final UserData? data;

  ShopLoginModel(
      {required this.status, required this.message, required this.data,});

  factory ShopLoginModel.fromJson(jsonData)
  {
    return ShopLoginModel(
      status: jsonData['status'],
      message: jsonData['message'],
      data:jsonData['data']==null?null: UserData.fromJson(jsonData['data']),
    );
  }
}

class UserData {
   final int id;

   final String name;

   final String email;

   final String phone;

  final String image;

   final int points;

  final int credit;

  final String token;

  UserData({
     required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });


  factory UserData.fromJson(jsonData) {
    return UserData(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      image: jsonData['image'],
      points: jsonData['points'],
      credit: jsonData['credit'],
      token: jsonData['token'],
    );
  }
}