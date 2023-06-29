import 'package:get/get.dart';

import '../authentication/controller/auth_service.dart';
import '../authentication/controller/login_controller.dart';
import '../authentication/controller/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(),);
    Get.lazyPut<RegisterController>(() => RegisterController());

  }
}