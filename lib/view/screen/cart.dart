import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/constance/app_color.dart';
import '../widget/cart_screen_item.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartControllerImp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: Theme.of(context).colorScheme.background,
          child: GetX<CartControllerImp>(
            builder: (controller) => controller.isLoading.value
                ?  CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 20),
                        child: Text(
                          'Cart'.tr,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetX<CartControllerImp>(
                        builder: (controller) => Expanded(
                          flex: 4,
                          child: ListView.separated(
                            itemBuilder: (context, index) => cartItem(
                              cartProduct: controller.cartProduct[index],
                              onPressedDelete: () {
                                controller.removeFromCart(
                                    controller.cartProduct[index]);
                              },
                              context: context,
                              incQuantity: () {
                                controller.incrementQuantity(
                                    controller.cartProduct[index].id);
                              },
                              decQuantity: () => controller.decrementQuantity(
                                  controller.cartProduct[index].id),
                            ),
                            separatorBuilder: (_, __) => const SizedBox(
                              height: 6,
                            ),
                            itemCount: controller.cartProduct.length,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  color: AppColor.primary.withOpacity(0.2)),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColor.black,
                                  blurRadius: 10.0,
                                )
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Total :'.tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 30,
                                          ),
                                    ),
                                    const Spacer(),
                                    GetX<CartControllerImp>(
                                        builder: (controller) => Text(
                                              '${controller.total} \$',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge!
                                                  .copyWith(
                                                    fontSize: 16,
                                                  ),
                                            ))
                                  ],
                                ),
                              ),
                              const Divider(),
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    color: AppColor.primary,
                                    alignment: Alignment.center,
                                    child: Text('Check Out'.tr,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColor.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          )),
    );
  }
}
