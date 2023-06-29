class ApiUrl {
  static const String prodURL = "https://";
  static const String testingURL = "https://bnplapi.testing.laureal.io/bnpl";
  static _AuthEndPoints authEndPoint = _AuthEndPoints();

  // Will refresh the access token 5 minutes before it expires
  static const int sessionTimeoutThreshold = 0;
  // if false hide the form login
  static const bool loginWithPassword = true;
  //if false hide the fields password and confirm password from signup form
  //for security reason and the password generated after verification mail
  static const bool signupWithPassword = true;

}

class _AuthEndPoints {
  final String login = "/user/login";
  final String logOut = "/user/logout";
  final String register = "/user/register";
  final String forgotPassword = "/user/forgot-password";
  //token
  final String client = "/user/getclient/token={token}";
  final String salesP = "/user/getsalesagents/token={token}";

  //Products
  final String category = "/category/{token}";
  final String product = "/product/{token}";

}