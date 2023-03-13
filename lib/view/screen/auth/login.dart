import 'package:ecommerce/controller/auth/login_screen_controller.dart';
import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/function/valid_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginScreenControllerImp controller = Get.put(LoginScreenControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/light-2.png'))),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/clock.png'))),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child:  Center(
                          child: Text(
                            "Login".tr,
                            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Form(
                        key: controller.globalKey,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextFormField(
                                validator: (value) => validInput(
                                  val: value! ,
                                  max: 50,min: 5,type: 'email'
                                ),
                                controller: controller.email,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email Or Phone Number'.tr,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                                style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.black),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: GetBuilder<LoginScreenControllerImp>(
                                builder: (controller) => TextFormField(
                                  validator: (value) => validInput(
                                    val: value!,
                                    min: 5,
                                    max: 20,
                                    type: 'password'
                                  ),
                                  controller: controller.password,
                                  obscureText: controller.obscure,
                                  decoration: InputDecoration(
                                    errorText: controller.errorPass?'Password Wrong'.tr:null,
                                      suffixIcon: IconButton(
                                        icon: Icon(controller.obscure
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.visibility_off_outlined),
                                        onPressed: () {
                                          controller.isObscure();
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password".tr,
                                      hintStyle:TextStyle(color: Colors.grey[400])),
                                  style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            'Forgot Password?'.tr,
                            style: const TextStyle(
                              color: AppColor.primary,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                   GetBuilder<LoginScreenControllerImp>(builder: (controller) =>InkWell(
                     onTap: () => controller.login(),
                     child: Container(
                       height: 50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color:controller.loading ?AppColor.primary.withOpacity(.6):AppColor.primary.withOpacity(.9),
                       ),
                       child:  Center(
                         child: Text(
                           "Login".tr,
                           style: const TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ),
                   ) ,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?".tr,style: Theme.of(context).textTheme.displayMedium),
                        TextButton(
                          onPressed: () {
                            controller.goToRegisterScreen();
                          },
                          child:  Text(
                            'SignUp here'.tr,
                            style:const TextStyle(
                              color: AppColor.primary,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
