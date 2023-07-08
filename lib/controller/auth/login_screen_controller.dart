import 'package:ecommerce/core/constance/app_routs.dart';
import 'package:ecommerce/data/model/auth/login_request_model.dart';
import 'package:ecommerce/data/model/shop_login_model.dart';
import 'package:ecommerce/service/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/api/constance.dart';
import '../../core/error_handler/error_handler.dart';
import '../../core/service/shared_preferences_services.dart';

abstract class LoginScreenController extends GetxController {
  void isLoading(bool value);

  void isObscure();

  login();

  goToRegisterScreen();
}

class LoginScreenControllerImp extends LoginScreenController {
  bool loading = false;
  bool obscure = true;

  late TextEditingController email;

  late TextEditingController password;

  late GlobalKey<FormState> globalKey;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    globalKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void isLoading(bool value) {
    loading = value;
    update();
  }

  @override
  void isObscure() {
    obscure = !obscure;
    update();
  }

  @override
  login() async {
    if (globalKey.currentState!.validate()) {
      isLoading(true);
      final result = await AuthService()
          .login(LoginRequestModel(email: email.text, password: password.text));
      result.fold((l) => ErrorHandle().showSnakeBar(l.message), (r) {
        SharedPreferencesServices().setStringValue('token', r.data!.token);
        token = r.data!.token;
        Get.offAllNamed(AppRoutes.home);
      });

      isLoading(false);
    }
  }

  @override
  goToRegisterScreen() {
    Get.offAllNamed(
      AppRoutes.register,
    );
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
