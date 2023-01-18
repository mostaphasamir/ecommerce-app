import 'package:ecommerce/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/api/constance.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProductModel _product = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: IconButton(
          onPressed: (){

          },
          icon: Icon(Icons.add),
        )
      ),
    );
  }
}
