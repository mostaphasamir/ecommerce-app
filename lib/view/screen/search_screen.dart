import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  final SearchControllerImp controller= Get.put(SearchControllerImp());
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
          style: const TextStyle(
            color: AppColor.white
          ),
          decoration:  InputDecoration(
            hintText: 'Search for product ...'.tr,
            hintStyle: const TextStyle(color: AppColor.white)
          ),
        ),
      ),
      body: GetBuilder<SearchControllerImp>(
        builder: (controller) =>controller.isEmpty?
        Center(
          child:Image.asset("assets/images/search-empty.png"),
        )
        :Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 30),
                    shrinkWrap: true,
                    itemCount: controller.dataFilter.length,
                    separatorBuilder: (context, index) =>const Divider(),
                    itemBuilder: (  context, int index) {
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
                              ),width: 70,fit: BoxFit.contain,),
                            ) ,
                            title: Text(controller.dataFilter[index].name,style: Theme.of(context).textTheme.displayMedium),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
      ),
    );
  }

}