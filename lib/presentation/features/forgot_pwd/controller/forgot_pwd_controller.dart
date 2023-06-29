import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../core/service/api_url.dart';
import '../../../widgets/loading_overlay.dart';
import '../../authentication/model/register_model.dart';
import '../../authentication/views/auth.dart';


class LoginController extends GetxController {
  final useridController = TextEditingController();
  final passwordController = TextEditingController();

  final user = RegisterModel();

  final storage = GetStorage();
  RxBool loading = false.obs;

  @override
  void onClose() {
    useridController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? useridValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username can\'t be empty';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password can\'t be empty';
    }
    // if (value.trim().length < 3) {
    //   return 'Password must be at least 8 characters in length';
    // }
    // Return null if the entered password is valid
    return null;
  }

  Future<void> forgotPwd() async {
      try {
        LoadingOverlay.show(message: 'Login...');
        loading.value = true;
        var headers = {'Content-Type': 'application/json; charset=UTF-8'};
        var url = Uri.parse(ApiUrl.testingURL + ApiUrl.authEndPoint.login);
        Map body = {
          "userid": useridController.text.trim(),
          "password": passwordController.text,
        };
        http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

        if (response.statusCode == 201) {
          LoadingOverlay.show(message: 'Login...');
          final result = jsonDecode(response.body);
          print('data: $result');
          Get.defaultDialog(
              title: "Login", content: const Text("Login successfully."));
          loading.value = false;
            useridController.clear();
            passwordController.clear();
            Get.defaultDialog(
                title: "Login", content: const Text("Login successfully."));

          //go to login
          Get.to(()=> Auth());
        } else {
          print("Error: ${response.statusCode}");
          throw jsonDecode(response.body)["message"];
        }
      } catch (e) {
        // Get.back();
        print("Error: ${e.toString()}");
        Get.defaultDialog(title: "Login", content: const Text("Login failed."));
      }
  }

  Future<void> logOut() async {

  }
}
