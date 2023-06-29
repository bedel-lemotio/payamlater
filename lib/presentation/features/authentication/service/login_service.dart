import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../../../core/service/api_url.dart';
import '../model/login_model.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {

  Future<Login?> fetchLogin(Login model) async {
    final response = await post(ApiUrl.testingURL + ApiUrl.authEndPoint.login, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return Login.fromJson(response.body);
    } else {
      return null;
    }
  }

  // Future<RegisterResponseModel?> fetchRegister(
  //     RegisterRequestModel model) async {
  //   final response = await post(registerUrl, model.toJson());
  //
  //   if (response.statusCode == HttpStatus.ok) {
  //     return RegisterResponseModel.fromJson(response.body);
  //   } else {
  //     return null;
  //   }
  // }
}
