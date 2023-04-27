import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/api.dart';
import '../../core/api/constance.dart';
import '../../core/constance/app_routs.dart';
import '../../core/service/services.dart';
import '../../data/model/shop_register_model.dart';

abstract class RegisterScreenController extends GetxController
{
  isObscure();
  register();
  goToLogin();
  goToHome();
}


class RegisterScreenControllerImp extends RegisterScreenController
{

  late GlobalKey<FormState> globalKey ;
  late TextEditingController name ;
  late TextEditingController phone ;
  late TextEditingController email ;
  late TextEditingController password ;

  bool obscure =true ;
  RxBool isLoading =false.obs ;
  final Api _api =Api() ;

  MyServices myServices=Get.find();

  //error
  bool emailUsed =false ;
  bool numberUsed =false ;

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
  register()async {
    if(globalKey.currentState!.validate())
      {
      isLoading(true);
        try{
        Map<String,dynamic> data=await _api.post(url: AppApiConstance.registerURL, body: {
            'name':name.text,
            'phone':phone.text,
            'email':email.text,
            'password':password.text,
          } , headers: {'lang':'ar'});

        RegisterModel shop = RegisterModel.fromJson(data);

         if(shop.status==true)
         {
         myServices.sharedPreferences.setString('token', shop.data!.token);
         token = shop.data!.token;
         AppApiConstance.baseHeaders.update("Authorization", (value) => token);
           goToHome();
         }
         else
           {
             if(shop.message=='This phone has been used before'||shop.message=='رقم الهاتف الذي قمت بإدخاله مستخدم من قبل')
               {
                 numberUsed = true ;
                 update();
               }
             if(shop.message=='This email has been used before'||shop.message=='البريد الإلكتروني مستخدم من قبل')
               {
                 emailUsed = true ;
                 update();
               }
           }
        }catch(e){
          Get.snackbar('something wrong happened', e.toString());
        }
        isLoading(false);
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
  goToHome() {
    Get.offAllNamed(AppRoutes.home);
  }
}