import 'package:ecommerce/core/error_handler/error_handler.dart';
import 'package:ecommerce/data/model/auth/register_request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/api.dart';
import '../../core/api/constance.dart';
import '../../core/constance/app_routs.dart';
import '../../core/service/services.dart';
import '../../data/model/shop_register_model.dart';
import '../../service/auth_services.dart';

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
  final ApiHelper _api =ApiHelper() ;

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

      final result =await AuthService().register(RegisterRequestModel(name: name.text, email: email.text, password: password.text, phone: phone.text));
      result.fold((l) => ErrorHandle().showSnakeBar(l.message) , (r) {
        myServices.sharedPreferences.setString('token', r.data.token);
        token = r.data.token;
        goToHome();
      });
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