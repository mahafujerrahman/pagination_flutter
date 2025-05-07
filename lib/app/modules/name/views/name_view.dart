import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_flutter/app/routes/app_pages.dart';


import '../controllers/name_controller.dart';

class NameView extends GetView<NameController> {
  const NameView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NameView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Get.toNamed(Routes.Pagination);
              },
              child: Text("Show List"),
            ),
            ElevatedButton(
              onPressed: (){
                Get.toNamed(Routes.PagePagination);
              },
              child: Text(" Page Pagination Show List"),
            ),
          ],
        ),
      ),
    );
  }
}
