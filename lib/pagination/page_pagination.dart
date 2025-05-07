import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_flutter/pagination/pagePaginationController.dart';

class PagePagination extends StatelessWidget {
  const PagePagination({super.key});

  @override
  Widget build(BuildContext context) {
    final PagePaginationController paginationController = Get.put(PagePaginationController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Page Pagination Example"),
      ),
      body: Column(
        children: [
          // List view for paginated data
          Expanded(
            child: Obx(() {
              if (paginationController.isLoading.value) {
                return Center(child: CupertinoActivityIndicator(radius: 32, color: Colors.red));
              }

              return ListView.builder(
                itemCount: paginationController.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ${paginationController.data[index]}'),
                  );
                },
              );
            }),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous button
                IconButton(
                  onPressed: paginationController.previousPage,
                  icon: Icon(Icons.arrow_left),
                ),

                Obx(() {
                  return Row(
                    children: List.generate(paginationController.totalPages, (i) {
                      return GestureDetector(
                        onTap: () {
                          paginationController.goToPage(i + 1);  // Go to specific page
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: paginationController.currentPage.value == (i + 1)
                                  ? Colors.orange
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Text(
                              '${i + 1}',
                              style: TextStyle(
                                color: paginationController.currentPage.value == (i + 1)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }),

                // Next button
                IconButton(
                  onPressed: paginationController.nextPage,
                  icon: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
