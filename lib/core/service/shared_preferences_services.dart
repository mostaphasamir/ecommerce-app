import 'package:ecommerce/core/service/services.dart';
import 'package:get/get.dart';

class SharedPreferencesServices {
  MyServices myServices = Get.find();
  setStringValue(String key,String value){
    myServices.sharedPreferences.setString(key,value );
  }
  setBoolValue(String key,bool value){
    myServices.sharedPreferences.setBool(key, value);
  }

  String? getStringValue(String key){
    return myServices.sharedPreferences.getString(key);
  }

  bool? getBoolValue(String key){
    return myServices.sharedPreferences.getBool(key);
  }
}