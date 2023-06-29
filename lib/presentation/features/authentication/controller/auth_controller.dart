
import 'package:get/get.dart';

import 'auth_service.dart';

//This controller doesn't have view page but used
// for some widget button like signout and other
class AuthController extends GetxController {
  final AuthApiService _authenticationService;
  // final OAuthClientService _oAuthClientService;

  AuthController(this._authenticationService,);

  Future<Response?> signUp(Map<String, dynamic> data) async {
    String error_m = 'An error occurred while registering, please contact the administrator.';
    try {
      return await _authenticationService.signUp(data);
    } catch (e) {
      printError(info: e.toString());
      throw Exception(error_m);
    }
    // return tokenData;
  }

}
