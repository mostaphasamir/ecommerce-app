import 'package:ecommerce/view/screen/auth/login.dart';
import 'package:ecommerce/view/screen/auth/register.dart';
import 'package:ecommerce/view/screen/bottom_navigation.dart';
import 'package:ecommerce/view/screen/product_detailes_screen.dart';
import 'package:ecommerce/view/screen/search_screen.dart';
import 'package:ecommerce/view/screen/update_profile.dart';
import 'package:get/get.dart';

import 'binding/home_binding.dart';
import 'core/constance/app_routs.dart';
import 'core/middleware/my_middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name:AppRoutes.login , page: ()=> LoginScreen(),middlewares:[ MyMiddleWare()]),
  GetPage(name:AppRoutes.register , page: ()=>  RegisterScreen()),
  GetPage(name:AppRoutes.home , page: ()=>  const BottomNavigation(),binding: HomeBinding()),
  GetPage(name:AppRoutes.searchScreen , page: ()=> SearchScreen()),
  GetPage(name:AppRoutes.updateProfile , page: ()=> UpdateProfileScreen()),
  GetPage(name:AppRoutes.productDetailsScreen , page: ()=> ProductDetailsScreen(),transition:Transition.leftToRight,transitionDuration: const Duration(milliseconds:300) ),
];