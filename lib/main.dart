import 'package:ecommerce/core/constance/app_theme.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/constance/app_routs.dart';
import 'core/service/services.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.customLightTheme,
      initialRoute: AppRoutes.login,
      getPages: routes ,
    );
  }
}

