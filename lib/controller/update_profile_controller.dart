import 'package:ecommerce/controller/profile_controller.dart';
import 'package:ecommerce/core/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/api/constance.dart';
import '../data/model/update_profile_model.dart';

abstract class UpdateProfileController extends GetxController{
  updateProfileData() ;

}

class UpdateProfileControllerImp extends UpdateProfileController
{

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey= GlobalKey<FormState>();

  Api api= Api();


  final ProfileControllerImp profileController = Get.find();
  @override
  updateProfileData()
  {
    if(formKey.currentState!.validate())
      {
        UpdateProfileModel user= UpdateProfileModel(name: name.text, phone: phone.text, email: email.text, password: password.text, image: "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png");
        api.update(
            url:AppApiConstance.updateProfileURL ,
            body: user.toJson()).then((value){
              if(value['status']==true){
                profileController.onInit();
                Get.back();
                return Get.snackbar("success", "Profile Updated successfully");
              }
              else{
                return Get.snackbar("ERROR", value['message'].toString());
              }
        });
      }
  }

  @override
  void onInit() {
    name =TextEditingController();
    email =TextEditingController();
    phone =TextEditingController();
    password =TextEditingController();
    super.onInit();
  }
}