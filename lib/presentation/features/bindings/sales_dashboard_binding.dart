import 'package:get/get.dart';
import 'package:payamlater/presentation/features/salesperson/home/controller/sales_controller.dart';


class SalesDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SalesController>(
          () => SalesController(),
    );
  }
}