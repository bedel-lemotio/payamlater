import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:payamlater/presentation/features/profile/model/userModel.dart';
import '../../../../core/service/api_url.dart';
import '../../authentication/views/auth.dart';


class ProfileController extends GetxController{

  final storage = GetStorage();
  Rxn<UserModel?> userData = Rxn<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();


  }

  Future deleteAccount() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    final http.Response response = await http.get(
      Uri.parse("https://bnplapi.testing.laureal.io/bnpl/sale/getbyId/token=$auth&id=$saleId"),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"];
      print('user: $result');
      userData.value  = UserModel.fromJson(result[0] as Map<String,dynamic>);
      return userData.value?.username;
    } else {
      throw Exception('Failed to get user.');
    }
  }


}
