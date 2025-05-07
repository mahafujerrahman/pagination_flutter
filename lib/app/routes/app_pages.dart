import 'package:get/get.dart';
import 'package:pagination_flutter/pagination/page_pagination.dart';
import 'package:pagination_flutter/pagination/pagination.dart';
import '../modules/name/bindings/name_binding.dart';
import '../modules/name/views/name_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static var INITIAL = Routes.NAME;


  static final routes = [
    GetPage(name: _Paths.NAME, page: () => const NameView(), binding: NameBinding(),),
    GetPage(name: _Paths.Pagination, page: () => Pagination()),
    GetPage(name: _Paths.PagePagination, page: () => PagePagination()),
  ];
}
