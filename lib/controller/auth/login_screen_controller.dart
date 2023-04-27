import 'package:ecommerce/core/constance/app_routs.dart';
import 'package:ecommerce/data/model/shop_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/api.dart';
import '../../core/api/constance.dart';
import '../../core/service/services.dart';

abstract class LoginScreenController extends GetxController
{
  void isLoading(bool value);
  void isObscure();
  login();
  goToRegisterScreen();
}

class LoginScreenControllerImp extends LoginScreenController
{
  bool loading =false;
  bool obscure =true ;
  bool errorPass =false ;
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
  void isLoading(bool value) {
    loading= value ;
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
       isLoading(true);
       _api.post(url: AppApiConstance.loginURL, body:
        {
         'email':email.text,
          'password':password.text
        },
         headers:{
         'lang':'en',
         },
       ).then((value) {
         ShopLoginModel shop = ShopLoginModel.fromJson(value);
         if(shop.status)
           {
             myServices.sharedPreferences.setString('token', shop.data!.token);
             token = shop.data!.token;
             AppApiConstance.baseHeaders.update("Authorization", (value) => token);
             Get.offAllNamed(AppRoutes.home);
           }
         else
           {
             errorPass=true;
           }
         isLoading(false);
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
