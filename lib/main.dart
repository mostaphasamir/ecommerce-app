import 'package:ecommerce/core/constance/app_theme.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/services.dart';
import 'core/constance/app_routs.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation/languages.dart';
import 'core/service/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices() ;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(LocalController());
    return Sizer(
      builder: (context, orientation, deviceType) {
        return  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          translations: Languages(),
          locale: controller.local,
          theme: AppTheme.customLightTheme,
          darkTheme: AppTheme.customDarkTheme,
          initialRoute: AppRoutes.login,
          getPages: routes ,
        );
      }
    );
  }
}

