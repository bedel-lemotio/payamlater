import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/service/api_url.dart';
import '../../../widgets/loading_overlay.dart';
import '../../salesperson/home/views/home_salesperson.dart';
import '../model/register_model.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(debugLabel: '__loginFormKey__');
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final user = RegisterModel();

  final storage = GetStorage();
  RxBool loading = false.obs;

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? usernameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password can\'t be empty';
    }
    return null;
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        LoadingOverlay.show(message: 'Login...');
        loading.value = true;
        var headers = {'Content-Type': 'application/json; charset=UTF-8'};
        var url = Uri.parse(ApiUrl.testingURL + ApiUrl.authEndPoint.login);
        Map body = {
          "username": usernameController.text.trim(),
          "password": passwordController.text,
          "machineId": "e0fa69e8-ff41-4827-bd45-2cb916c01828.local",
          "remotehost": "e0fa69e8-ff41-4827-bd45-2cb916c01828.local"
        };
        http.Response response =
            await http.post(url, body: jsonEncode(body), headers: headers);

        if (response.statusCode == 201) {
          LoadingOverlay.hide();
          final result = jsonDecode(response.body);
          print('data: $result');
          Get.defaultDialog(
              title: "Login", content: const Text("Login successfully."));
          var token = result["message"][0]["token"];
          storage.write('token', token);
          print('auth: $token');
          var saleId = result["message"][0]["id"];
          storage.write('saleId', saleId);
          print('Id: $saleId');
          loading.value = false;
          if (result["message"][0]["userType"] == "client") {
            usernameController.clear();
            passwordController.clear();
            Get.defaultDialog(
                title: "Login", content: const Text("Login successfully."));

            //go to home
            Get.offAll(SalesDashBoard());
          } else if (result["message"][0]["userType"] == "salesperson") {
            usernameController.clear();
            passwordController.clear();
            LoadingOverlay.hide();
            Get.defaultDialog(
                title: "Login", content: const Text("Login successfully."));
            //go to home
            Get.offAll(SalesDashBoard());
          }
        } else {
          LoadingOverlay.hide();
          print("Error: ${response.statusCode}");
          Get.defaultDialog(
              title: "Login Error", content: Text("Username or password incorrect"));
        }
      } catch (e) {
        // Get.back();
        print("Error: ${e.toString()}");
        Get.defaultDialog(title: "Login", content: const Text("Login failed."));
      }
    } else {
      throw Exception('An error occurred, invalid inputs value');
    }
  }

  Future<void> logOut() async {}


}
