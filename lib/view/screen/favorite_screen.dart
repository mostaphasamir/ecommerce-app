import 'package:ecommerce/core/api/constance.dart';
import 'package:ecommerce/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../../core/service/services.dart';


class FavoriteScreen extends StatelessWidget {
   const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    BottomNavigationControllerImp controllerImp =Get.find();

    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('favorite'),
          TextButton(
            onPressed: () {
          }, child: const Text(
            'print token'
          ),),
        ],
        
      ),
    );
  }
}
