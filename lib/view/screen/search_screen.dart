import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/bottom_navigation_controller.dart';

class SearchScreen extends GetView<BottomNavigationControllerImp> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray,
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: TextField(
          onChanged: (value) {
            controller.changeSearchValue(value);
          },
          decoration: const InputDecoration(
            hintText: 'Search for product ...',
            hintStyle: TextStyle(color: AppColor.white)
          ),
        ),
      ),
      body: GetBuilder<BottomNavigationControllerImp>(
        builder: (controller) =>
            Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.dataFilter.length,
                    separatorBuilder: (context, index) =>const Divider(),
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () =>controller.goToProductDetails(controller.dataFilter[index]),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          decoration: BoxDecoration(
                          color: AppColor.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColor.primary.withOpacity(.2))
                          ),
                          child: ListTile(
                            leading:Hero(
                              tag: controller.dataFilter[index].id,
                              child: Image(image: NetworkImage(
                                  controller.dataFilter[index].image,
                              ),width: 70,fit: BoxFit.fill,),
                            ) ,
                            title: Text(controller.dataFilter[index].name,style: Theme.of(context).textTheme.displayMedium),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
      ),
    );
  }

}