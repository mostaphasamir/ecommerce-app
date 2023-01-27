import 'package:ecommerce/core/constance/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchScreenControllerImp controller = Get.put(SearchScreenControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blueGrey,
        title: TextField(
          onChanged: (value) {
            controller.changeSearchValue(value);
          },
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
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, int index) {
                      return ListTile(
                        title: Text(controller.dataFilter[index].name,style: TextStyle(color: Colors.green),),
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