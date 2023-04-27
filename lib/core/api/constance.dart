import 'package:get/get.dart';

String token = '' ;

class AppApiConstance{
  static const String baseURL='https://student.valuxapps.com/api';
  static const String loginURL='$baseURL/login';
  static const String registerURL='$baseURL/register';
  static const String homeURl='$baseURL/home';
  static const String cartURl='$baseURL/carts';
  static const String profileURl='$baseURL/profile';
  static const String favoritesURl='$baseURL/favorites';
  static const String updateProfileURL='$baseURL/update-profile';
  static const String imageError='https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png';

  static Map<String,String> baseHeaders = {
  'lang':Get.locale.toString(),
  'Content-Type':'application/json',
  'Authorization':token
  };
}