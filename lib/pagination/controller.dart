import 'package:get/get.dart';


class PaginationController extends GetxController {
  // List to hold data
  RxList<int> data = <int>[].obs;
  RxBool isLoading = false.obs;

  // Pagination settings
  int currentPage = 1;
  int totalPages = 5;
  int itemsPerPage = 3;

  // Load more data
  void loadMoreData() async {
    if (isLoading.value || currentPage >= totalPages) return;

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));

    // Simulate adding 3 more items
    data.addAll(List.generate(3, (index) => (currentPage - 1) * itemsPerPage + index + 1));

    currentPage++;
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    // Initially load 3 items
    loadMoreData();
  }
}
