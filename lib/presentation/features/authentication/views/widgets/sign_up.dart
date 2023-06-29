
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:payamlater/core/service/api_url.dart';

import '../../controller/register_controller.dart';
import '../auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  RegisterController registerController = Get.put(RegisterController());
  bool _obscureTextPassword = true;
  bool _obscureTextPasswC = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: registerController.signupFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 25.0, right: 25.0),
                              child: TextFormField(
                                key: registerController.formFirstnameFieldKey,
                                focusNode: registerController.firstnameFocusNode,
                                controller: registerController.firstnameController,
                                validator: registerController.firstnameValidator,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 18.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF034A8F)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF034A8F)),
                                  ),
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 25.0, right: 25.0),
                              child: TextFormField(
                                key: registerController.formLastnameFieldKey,
                                focusNode: registerController.lastnameFocusNode,
                                controller: registerController.lastnameController,
                                validator: registerController.lastnameValidator,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 18.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF034A8F)),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF034A8F)),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: 'Last Name',
                                  hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 25.0, right: 25.0),
                              child: TextFormField(
                                key: registerController.formEmailFieldKey,
                                focusNode: registerController.emailFocusNode,
                                controller: registerController.emailController,
                                validator: registerController.emailValidator,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontFamily: 'WorkSansSemiBold',
                                    fontSize: 18.0,
                                    color: Colors.black),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF034A8F)),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(width: 2, color: Color(0xFF034A8F)),
                                    // borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                      fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 25.0, right: 25.0),
                              child: IntlPhoneField(
                                controller: registerController.phoneController,
                                decoration: const InputDecoration(
                                  hintText: 'Phone Number',
                                  // suffixStyle: ,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Color(0xFF034A8F)),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(width: 2, color: Color(0xFF034A8F)),
                                  ),
                                ),
                                initialCountryCode: 'CM',
                                onChanged: (phone) {
                                  print(phone.completeNumber);
                                },
                              )
                            ),
                            if (ApiUrl.signupWithPassword)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 25.0, right: 25.0),
                              child: TextFormField(
                                controller: registerController.passwordController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: registerController.passwordValidator,
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
                                    onTap: _togglePassw,
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
                            if (ApiUrl.signupWithPassword)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 25.0, right: 25.0),
                              child: TextFormField(
                                controller: registerController.confirmPasswordController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: registerController.confirmPasswordValidator,
                                obscureText: _obscureTextPasswC,
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
                                  hintText: 'Confirm password',
                                  hintStyle: const TextStyle(
                                      fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                                  suffixIcon: GestureDetector(
                                    onTap: _togglePasswC,
                                    child: Icon(
                                      _obscureTextPasswC
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
                          ],
                        ),
                  Container(
                    width: 228,
                    margin: const EdgeInsets.only(top: 425.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      color: Color(0xFF6F8C2E)
                    ),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Color(0xFF6F8C2E),
                      child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'WorkSansBold'),
                        ),
                      ),
                      // onPressed: () => registerController.registration(),
                      onPressed: () async {
                        if (registerController.signupFormKey.currentState!.validate()) {
                          // LoadingOverlay.show(message: 'Registering...');
                            await registerController.registration();
                            registerController.signupFormKey.currentState!.save();

                            //go to login
                            Get.off(Auth());
                        }
                      },

                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 5.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const Text(
              //         'Already have an account?',
              //         style: TextStyle(
              //             color: Color(0xFF034A8F),
              //             fontSize: 14.0,
              //             fontFamily: 'WorkSansMedium'),
              //       ),
              //       TextButton(
              //           onPressed: () {
              //             Get.off(Auth());
              //           },
              //           child: const Text(
              //             'Login',
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
        ),
      ),
    );
  }

  void _togglePassw() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
  void _togglePasswC() {
    setState(() {
      _obscureTextPasswC = !_obscureTextPasswC;
    });
  }

}
