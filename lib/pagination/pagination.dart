import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_flutter/pagination/controller.dart';



class Pagination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PaginationController paginationController = Get.put(PaginationController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagination Example"),
      ),
      body: Obx(() {
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              paginationController.loadMoreData();
            }
            return false;
          },
          child: ListView.builder(
            itemCount: paginationController.data.length + (paginationController.isLoading.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == paginationController.data.length && paginationController.isLoading.value) {
                return Center(child: CircularProgressIndicator());  // Show loading spinner
              }
              return ListTile(
                title: Text('Item ${paginationController.data[index]}'),
              );
            },
          ),
        );
      }),
    );
  }
}
