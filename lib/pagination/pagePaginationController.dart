import 'package:get/get.dart';

class PagePaginationController extends GetxController {
  // List to hold data
  RxList<int> data = <int>[].obs;
  RxBool isLoading = false.obs;

  // Pagination settings
  RxInt currentPage = 1.obs;
  int totalPages = 5;
  int itemsPerPage = 5;

  //      Load data
  void loadData() {
    isLoading.value = true;

    data.clear();
    Future.delayed(Duration(seconds: 2), () {
      // Simulate network delay
      for (int i = 1; i <= itemsPerPage; i++) {
        data.add((currentPage.value - 1) * itemsPerPage + i);
      }
      isLoading.value = false;
    });
  }

  // Go to the previous page
  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      loadData();
    }
  }

  // Go to the next page
  void nextPage() {
    if (currentPage.value < totalPages) {
      currentPage.value++;
      loadData();
    }
  }

  // Go to the specific page
  void goToPage(int page) {
    if (page > 0 && page <= totalPages) {
      currentPage.value = page;
      loadData();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}
