import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/register_screen_controller.dart';
import '../../../core/function/valid_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterScreenControllerImp controller = Get.put(RegisterScreenControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              Container(
                height: Get.height*.45,
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
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,),
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
                                    max: 20,min: 5,type: 'text'
                                ),
                                controller: controller.name,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Your Full Name",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextFormField(
                                validator: (value) => validInput(
                                    val: value! ,
                                    max: 20,min: 5,type: 'phone'
                                ),
                                controller: controller.phone,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Phone number",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                              ),
                            ),
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
                                    hintText: "Email",
                                    hintStyle:
                                    TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: GetBuilder<RegisterScreenControllerImp>(
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
                                      suffixIcon: IconButton(
                                        icon: Icon(controller.obscure
                                            ? Icons.remove_red_eye_outlined
                                            : Icons.visibility_off_outlined),
                                        onPressed: () {
                                          controller.isObscure();
                                        },
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle:
                                      TextStyle(color: Colors.grey[400])),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () => controller.register(),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(143, 148, 251, 1),
                        ),
                        child: const Center(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style: Theme.of(context).textTheme.displayMedium,),
                        TextButton(
                          onPressed: () {
                            controller.goToLogin();
                          },
                          child: const Text(
                            'Login here',
                            style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1),
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
