import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/function/valid_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/update_profile_controller.dart';
import '../widget/default_ttf.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);
  final controller = Get.put(UpdateProfileControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          "Update Your Information",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                defaultTTF(
                  controller: controller.name,
                  hintText: 'Enter your full name',
                  labelText: 'Full Name',
                  context: context,
                  validator: (value) {
                    return validInput(val: value!, min: 5, max: 50);
                  },
                ),
                defaultTTF(
                  controller: controller.phone,
                  hintText: 'Enter your phone Number',
                  labelText: 'Phone',
                  context: context,

                  validator: (value) {
                    return validInput(val: value!, min: 5, max: 20,type:'phone');
                  },
                ),
                defaultTTF(
                  controller: controller.email,
                  hintText: 'Enter your Email',
                  labelText: 'Email',
                  context: context,

                  validator: (value) {
                    return validInput(val: value!, min: 5, max: 50,type: 'email');
                  },
                ),
                defaultTTF(
                  controller: controller.password,
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                  context: context,

                  validator: (value) {
                   return validInput(val: value!, min: 5, max: 20,type: 'password');
                  },
                ),
                SizedBox(
                  width: Get.width,
                  height: 50,
                  child: ElevatedButton(
                    style:  ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(AppColor.primary),
                    ),
                    onPressed: () {
                      controller.updateProfileData();
                    },
                    child: const Text("Update"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
