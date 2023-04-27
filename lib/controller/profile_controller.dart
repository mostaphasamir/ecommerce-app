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
  changeTheme();
  goToUpdateProfile(ShopLoginModel userData);
}
class ProfileControllerImp extends ProfileController
{
  late ShopLoginModel userData ;

  MyServices myServices=Get.find();
  final LocalController localController=Get.find();
  bool isDarkTheme = false ;
  Api api =Api();
  bool isLoading=false ;
  bool darkTheme=false ;

  @override
  getProfileData() async
  {
    try {
      Map<String, dynamic> data = await api.get(
          url: AppApiConstance.profileURl,
          headers: AppApiConstance.baseHeaders
      );
      userData = ShopLoginModel.fromJson(data);
      isLoading = false;
      update();
    } catch(e)
    {
      Get.snackbar("something Wrong", e.toString());
    }
  }


  @override
  changeTheme()
  {
    localController.changeTheme();
  }


  @override
  logout()
  {
    myServices.sharedPreferences.remove('token');
    token='';
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  goToUpdateProfile(ShopLoginModel userData){
    Get.toNamed(AppRoutes.updateProfile);
  }



  @override
  void onInit() {
    isLoading=true;
    getProfileData();
    isDarkTheme = Get.isDarkMode;
    super.onInit();
  }
}