import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/register.dart';
import 'package:ecommerce/view/screen/bottom_navigation.dart';
import 'package:ecommerce/view/screen/product_detailes_screen.dart';
import 'package:get/get.dart';

import 'core/constance/app_routs.dart';
import 'core/middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name:AppRoutes.login , page: ()=>const LoginScreen(),middlewares:[ MyMiddleWare()]),
  GetPage(name:AppRoutes.register , page: ()=> const RegisterScreen()),
  GetPage(name:AppRoutes.home , page: ()=>  BottomNavigation()),
  GetPage(name:AppRoutes.productDetailsScreen , page: ()=> ProductDetailsScreen(),transition:Transition.leftToRight,transitionDuration: const Duration(milliseconds:300) ),
];