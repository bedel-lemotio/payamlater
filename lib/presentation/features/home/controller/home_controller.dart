import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import '../../../../core/service/api_url.dart';
import '../../authentication/views/auth.dart';


class HomeController extends GetxController{

  final storage = GetStorage();
  Rxn<Map<String, dynamic>> username = Rxn<Map<String, dynamic>>(null);

  @override
  void onInit() {
    super.onInit();
    getUserName();

  }

  Future getUserName() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    final http.Response response = await http.get(
      Uri.parse(
          "https://bnplapi.testing.laureal.io/bnpl/sale/getbyId/token=$auth&id=$saleId"),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"];
      print('user: $result');
      username.value = result[0];
      return result[0];
    } else {
      throw Exception('Failed to get user.');
    }
  }

  Future logout() async{
    var auth = storage.read('token');
    var headers = {'Content-Type': 'application/json; charset=UTF-8'};
    var url = Uri.parse(ApiUrl.testingURL + ApiUrl.authEndPoint.login);
    Map body = {
      "userid": auth,
    };
    http.Response response =
    await http.post(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 201) {
      final result = jsonDecode(response.body);
      print(result);
      Get.defaultDialog(
          title: "Logout", content: const Text("Logout successfully."));
      //go to login
      Get.offAll(()=> Auth());
    }
  }
}
