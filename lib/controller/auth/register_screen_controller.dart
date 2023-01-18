import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/api.dart';
import '../../core/constance/app_routs.dart';

abstract class RegisterScreenController extends GetxController
{
  isObscure();
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
  final Api _api =Api() ;


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
        }).then((value) => print(value));
      }
  }

  @override
  void dispose() {
    globalKey.currentState!.dispose();
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }
}