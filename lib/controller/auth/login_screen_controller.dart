import 'package:ecommerce/core/constance/app_routs.dart';
import 'package:ecommerce/data/model/shop_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/api.dart';
import '../../core/api/constance.dart';
import '../../core/service/services.dart';

abstract class LoginScreenController extends GetxController
{
  void isLogin();
  void isObscure();
  login();
  goToRegisterScreen();
}

class LoginScreenControllerImp extends LoginScreenController
{
  bool loading =false ;
  bool obscure =true ;
  late TextEditingController email ;
  late TextEditingController password ;
  late GlobalKey<FormState> globalKey ;
  final Api _api =Api() ;


  MyServices myServices=Get.find();


 @override
  void onInit() {
    email =TextEditingController();
    password =TextEditingController();
    globalKey=GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void isLogin() {
    loading =!loading ;
    update();
  }

  @override
  void isObscure() {
    obscure =!obscure ;
   update();
  }

  @override
  login() {

   if(globalKey.currentState!.validate())
     {
       _api.post(url: "https://student.valuxapps.com/api/login", body:
        {
         'email':email.text,
          'password':password.text
        },
         headers:{
         'lang':'ar',
         },
       ).then((value) {
         ShopLoginModel shop = ShopLoginModel.fromJson(value);
         if(shop.status)
           {
             myServices.sharedPreferences.setString('token', shop.data!.token);
             token = shop.data!.token ;
             Get.offAllNamed(AppRoutes.home);
           }
       }
       );
     }
  }

  @override
  goToRegisterScreen(){
   Get.offAllNamed(AppRoutes.register);
  }

  @override
  void dispose() {
   email.dispose();
   password.dispose();
    super.dispose();
  }
}
