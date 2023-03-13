
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService
{
  late SharedPreferences sharedPreferences ;
  bool en = true;
  Future<MyServices> init ()async
  {
    sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.setBool('en', true);
    return this ;
  }

}

initServices()async
{
 await Get.putAsync(() =>MyServices().init() );
}