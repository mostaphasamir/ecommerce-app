import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/api.dart';
import '../../core/api/constance.dart';
import '../../core/constance/app_routs.dart';
import '../../core/service/services.dart';
import '../../data/model/shop_login_model.dart';

abstract class RegisterScreenController extends GetxController
{
  isObscure();
  void isLoading();
  register();
  goToLogin();
}


class RegisterScreenControllerImp extends RegisterScreenController
{

  late GlobalKey<FormState> globalKey ;
  late TextEditingController name ;
  late TextEditingController phone ;
  late TextEditingController email ;
  late TextEditingController password ;

  bool obscure =true ;
  bool loading =false ;
  final Api _api =Api() ;

  MyServices myServices=Get.find();
  @override
  void onInit() {
  globalKey =GlobalKey<FormState>();
  name = TextEditingController();
  phone = TextEditingController();
  email = TextEditingController();
  password = TextEditingController();
    super.onInit();
  }

  @override
  isObscure() {
    obscure = !obscure;
    update();
  }

  @override
  goToLogin() {
  Get.offAllNamed(AppRoutes.login);
  }

  @override
  register() {
    if(globalKey.currentState!.validate())
      {
        _api.post(url: 'https://student.valuxapps.com/api/register', body: {
          'name':name.text,
          'phone':phone.text,
          'email':email.text,
          'password':password.text,
        }).then((value){
          ShopLoginModel shop = ShopLoginModel.fromJson(value);
          if(shop.status==true)
          {
            myServices.sharedPreferences.setString('token', shop.data!.token);
            token = shop.data!.token ;
            Get.offAllNamed(AppRoutes.home);
          }
        });
      }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  void isLoading() {
    loading =! loading ;
    update();
  }
}