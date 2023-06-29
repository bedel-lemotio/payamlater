
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../forgot_pwd/views/forgot_pwd.dart';
import '../../controller/login_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();

  void onSubmit(String text) {}
}

class _SignInState extends State<SignIn> {
  LoginController loginController = Get.put(LoginController());

  bool _obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Form(
            key: loginController.loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // if (ApiUrl.loginWithPassword)
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
                        child: TextFormField(
                          controller: loginController.usernameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: loginController.usernameValidator,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: 'WorkSansSemiBold',
                              fontSize: 18.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            // errorText: loginController.UserErrorText,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Color(0xFF034A8F)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2, color: Color(0xFF034A8F)),
                            ),
                            hintText:
                                'Username / Email / Phone',
                            hintStyle: TextStyle(
                                fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 20.0, left: 25.0, right: 25.0),
                      child: TextFormField(
                        controller: loginController.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: loginController.passwordValidator,
                        obscureText: _obscureTextPassword,
                        style: const TextStyle(
                            fontFamily: 'WorkSansSemiBold',
                            fontSize: 18.0,
                            color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFF034A8F)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xFF034A8F)),
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                          suffixIcon: GestureDetector(
                            onTap: _toggleLogin,
                            child: Icon(
                              _obscureTextPassword
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye_outlined,
                              size: 25.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        textInputAction: TextInputAction.go,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 20.0, left: 200.0, right: 22.0),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPwd()),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                // decoration: TextDecoration.underline,
                                color: Color(0xFF1B1D3B),
                                fontSize: 14.0,
                                fontFamily: 'WorkSansMedium'),
                          )),
                    )
                  ],
                ),
                Container(
                  width: 228,
                  margin: const EdgeInsets.only(top: 320.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Color(0xFF6F8C2E),
                  ),
                  child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Color(0xFF6F8C2E),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            fontFamily: 'WorkSansBold'),
                      ),
                    ),
                    onPressed: () async {
                      if(loginController.loginFormKey.currentState!.validate()){
                        await loginController.login();
                        loginController.loginFormKey.currentState!.save();
                      }
                    },

                  ),
                )
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 50.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Text(
          //         'Don’t have an account?',
          //         style: TextStyle(
          //             color: Color(0xFF034A8F),
          //             fontSize: 14.0,
          //             fontFamily: 'WorkSansMedium'),
          //       ),
          //       TextButton(
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => Auth()),
          //             );
          //           },
          //           child: const Text(
          //             'Register',
          //             style: TextStyle(
          //                 decoration: TextDecoration.underline,
          //                 color: Color(0xFFB3B3B3),
          //                 fontSize: 14.0,
          //                 fontFamily: 'WorkSansMedium'),
          //           )),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
