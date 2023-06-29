import 'package:get/get.dart';

import '../home/controller/home_controller.dart';



class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
  }
}