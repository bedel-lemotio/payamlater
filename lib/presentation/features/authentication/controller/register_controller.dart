import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payamlater/core/service/api_url.dart';

import '../../../widgets/loading_overlay.dart';
import '../views/auth.dart';


class RegisterController extends GetxController {
  final GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(debugLabel: '__signupFormKey__');

  final firstnameController = TextEditingController();
  final formFirstnameFieldKey = GlobalKey<FormFieldState>();
  final lastnameController = TextEditingController();
  final formLastnameFieldKey = GlobalKey<FormFieldState>();
  final emailController = TextEditingController();
  final formEmailFieldKey = GlobalKey<FormFieldState>();
  final phoneController = TextEditingController();
  final formPhoneFieldKey = GlobalKey<FormFieldState>();
  final passwordController = TextEditingController();
  final formPasswordFieldKey = GlobalKey<FormFieldState>();
  final confirmPasswordController = TextEditingController();
  final formConfirmPasswordFieldKey = GlobalKey<FormFieldState>();

  FocusNode firstnameFocusNode = FocusNode();
  FocusNode lastnameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  RxBool loading = false.obs;

  void onInit() {
    _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  void _addListener() {
    firstnameFocusNode.addListener(() {
      log('firstnameFocusNode-----${firstnameFocusNode.hasFocus}');
      if (!firstnameFocusNode.hasFocus) {
        formFirstnameFieldKey.currentState!.validate();
        // fieldLostFocus = usernameController.hashCode.toString();
      }
    });
    lastnameFocusNode.addListener(() {
      log('lastnameFocusNode-----${lastnameFocusNode.hasFocus}');
      if (!lastnameFocusNode.hasFocus) {
        formLastnameFieldKey.currentState!.validate();
        // fieldLostFocus = usernameController.hashCode.toString();
      }
    });
    emailFocusNode.addListener(() {
      log('emailFocusNode-----${emailFocusNode.hasFocus}');
      if (!emailFocusNode.hasFocus) {
        formEmailFieldKey.currentState!.validate();
      }
    });
    phoneFocusNode.addListener(() {
      log('phoneFocusNode-----${phoneFocusNode.hasFocus}');
      if (!phoneFocusNode.hasFocus) {
        formPhoneFieldKey.currentState!.validate();
      }
    });
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        formPasswordFieldKey.currentState!.validate();
      }
    });
    confirmPasswordFocusNode.addListener(() {
      if (!confirmPasswordFocusNode.hasFocus) {
        formConfirmPasswordFieldKey.currentState!.validate();
      }
    });
  }

  @override
  void onClose() {
    firstnameController.dispose();
    firstnameFocusNode.dispose();
    lastnameController.dispose();
    lastnameFocusNode.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
    phoneController.dispose();
    phoneFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    confirmPasswordFocusNode.dispose();

    super.onClose();
  }

  String? firstnameValidator(String? value) {
    // if(fieldLostFocus == usernameController.hashCode)
    log('firstnameValidator-----');
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    // if (value.trim().length < 4) {
    //   return 'Username must be at least 4 characters in length';
    // }
    // Return null if the entered username is valid
    return null;
  }

  String? lastnameValidator(String? value) {
    // if(fieldLostFocus == usernameController.hashCode)
    log('lastnameValidator-----');
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    // if (value.trim().length < 4) {
    //   return 'Lastname must be at least 4 characters in length';
    // }
    // Return null if the entered username is valid
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }
    // Check if the entered email has the right format
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    // Return null if the entered email is valid
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 3) {
      return 'Phone must be at least 9 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 3) {
      return 'Password must be at least 8 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    log('${value}--${passwordController.value.text}');
    if (value != passwordController.value.text) {
      return 'Confimation password does not match the entered password';
    }

    return null;
  }

  String? validator(String? value) {
    log('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  Future<void> registration() async {
    if (signupFormKey.currentState!.validate()) {
      try {
        LoadingOverlay.show(message: 'Register...');
        loading.value = true;
        var headers = {'Content-Type': 'application/json; charset=UTF-8'};
        var url = Uri.parse(ApiUrl.testingURL + ApiUrl.authEndPoint.register);
        Map body = {
          "phone": phoneController.text,
          "firstname": firstnameController.text,
          "lastname": lastnameController.text,
          "email": emailController.text,
          "usertype": "salesperson", //client
          "password": passwordController.text
        };
        http.Response response =
        await http.post(url, body: jsonEncode(body), headers: headers);

        if (response.statusCode == 201) {
          final result = jsonDecode(response.body);
          print('data: $result');
          Get.defaultDialog(title: "Register", content: const Text("Register successfully."));
          loading.value = false;
          phoneController.clear();
          firstnameController.clear();
          lastnameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          //go to login
          Get.off(Auth());
        } else {
          print("Error: ${response.statusCode}");
          throw jsonDecode(response.body)["message"];
        }

      } catch (err, _) {
        print(err.toString());

        firstnameController.clear();
        lastnameController.clear();
        emailController.clear();
        phoneController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        Get.defaultDialog(
            title: "Register", content: const Text("Register failed."));
      }
    }else{
      // Get.back();
      Get.defaultDialog(
          title: "Register", content: const Text("Register failed."));

      throw Exception('An error occurred, invalid inputs value');
    }
  }
}
