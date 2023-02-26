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
        color: AppColor.gray,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cart',style: Theme.of(context).textTheme.displayLarge,) ,
            const SizedBox(height: 10,),
            GetX<BottomNavigationControllerImp>(
              builder: (controller) => Expanded(
                flex: 7,
                child: ListView.separated(
                  itemBuilder: (context, index) => cartItem(
                    cartProduct: controller.cartProduct[index],
                    onPressedDelete: (){
                      controller.removeFromCart(controller.cartProduct[index]);
                    },
                    context: context,

                    incQuantity:() {
                      print('in increment');
                      controller.incrementQuantity(controller.cartProduct[index].id);

                    },
                    decQuantity:() => controller.decrementQuantity(controller.cartProduct[index].id),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 6,),
                  itemCount: controller.cartProduct.length,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.white10,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: AppColor.primary.withOpacity(0.2))
                ),
                child: Row(
                  children:  [
                    Text('Total :' , style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 30,),),
                    const SizedBox(width: 5,),
                    GetX<BottomNavigationControllerImp>(builder:(controller) => Text('${controller.total} \$' , style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16,),)),
                    const Spacer(),
                    InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          color:AppColor.primary,
                          width: 120,
                          alignment: Alignment.center,
                          child: const Text('Check Out'),
                        ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
