import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../core/service/api_url.dart';

class AuthApiService extends GetConnect {

  Future<Response?> signUp(Map<String, dynamic> data) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiUrl.testingURL + ApiUrl.authEndPoint.register);
      var body = {
        "phone": data['phone'],
        "firstname": data['firstname'],
        "lastname": data['lastname'],
        "email": data['email'],
        "usertype": "salesperson", //client/Salesperson
        "password": data['password'],
      };
      if (ApiUrl.signupWithPassword) {
        body['pass'] = {
          'pass1': data['password'],
          'pass2': data['confirmPassword']
        };
      }
      final response = await http.post(
          url, body: jsonEncode(body), headers: headers);
      return jsonDecode(response.body);
      // return post(url, body, headers: headers);
    } catch (e) {
      // printLog(e);
      printError(info: e.toString());
      rethrow;
    }
  }
}
