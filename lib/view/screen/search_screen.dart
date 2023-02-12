import 'package:ecommerce/core/constance/app_color.dart';
import 'package:ecommerce/core/constance/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchScreenControllerImp controller = Get.put(SearchScreenControllerImp());
    return Scaffold(
      backgroundColor: AppColor.blueGrey,
      appBar: AppBar(
        backgroundColor: AppColor.blueGreyDark,
        title: TextField(
          onChanged: (value) {
            controller.changeSearchValue(value);
          },
          decoration: const InputDecoration(
            hintText: 'Search for product ...',
          ),
        ),
      ),
      body: GetBuilder<SearchScreenControllerImp>(
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
                        onTap: () =>controller.goProductDetails(controller.dataFilter[index]),
                        child: ListTile(
                          leading:Hero(
                            tag: controller.dataFilter[index].id,
                            child: Image(image: NetworkImage(
                                controller.dataFilter[index].image,
                            ),width: 70,fit: BoxFit.fill,),
                          ) ,
                          title: Text(controller.dataFilter[index].name,style: Theme.of(context).textTheme.displayMedium),
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