import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_controller.dart';
import '../../core/constance/app_color.dart';
import '../widget/cart_screen_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        color: AppColor.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cart',style: Theme.of(context).textTheme.displayLarge,) ,
            const SizedBox(height: 10,),

            GetX<BottomNavigationControllerImp>(
              builder: (controller) => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => cartItem(
                    cartProduct: controller.cartProduct[index],
                    quantity:controller.quantity[controller.cartProduct[index].id] ,
                    onPressedDelete: (){
                    },
                    onPressedNavigate: (){
                      // controller.goToProductDetails();
                      print(controller.cartProduct.length);
                    },
                    context: context,
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 6,),
                  itemCount: controller.cartProduct.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
