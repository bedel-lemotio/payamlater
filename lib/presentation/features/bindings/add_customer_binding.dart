import 'package:get/get.dart';
import 'package:payamlater/presentation/features/salesperson/home/controller/sales_controller.dart';

import '../add_customer/controller/add_customer_controller.dart';


class AddCustomerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCustomerController>(() => AddCustomerController(),
    );
  }
}