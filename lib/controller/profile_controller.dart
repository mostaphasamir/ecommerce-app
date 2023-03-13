import 'package:ecommerce/core/api/api.dart';
import 'package:get/get.dart';

import '../core/api/constance.dart';
import '../core/constance/app_routs.dart';
import '../core/localization/change_local.dart';
import '../core/service/services.dart';
import '../data/model/shop_login_model.dart';

abstract class ProfileController extends GetxController
{
  getProfileData();
  logout();
  changeTheme(bool value);
}
class ProfileControllerImp extends ProfileController
{
  late ShopLoginModel userData ;

  MyServices myServices=Get.find();
  final LocalController localController=Get.find();

  Api api =Api();
  bool isLoading=false ;
  bool darkTheme=false ;

  @override
  getProfileData()
  {
    api.get(url: AppApiConstance.profileURl,token: token).then((value) {
      userData = ShopLoginModel.fromJson(value);
      isLoading=false;
    });
  }


  @override
  changeTheme(bool value)
  {
    darkTheme =value ;
    update();
  }


  @override
  logout()
  {
    myServices.sharedPreferences.remove('token');
    token='';
    Get.offAllNamed(AppRoutes.login);
  }


  @override
  void onInit() {
    isLoading=true;
    getProfileData();
    super.onInit();
  }
}