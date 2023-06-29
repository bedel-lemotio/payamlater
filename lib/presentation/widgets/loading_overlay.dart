// import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingOverlay {
  static void hide() {
    Get.back();
  }

  static void show({String? message}) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Row(children: [
          // Icon(Icons.signal_wifi_off_outlined),
          Container(
              child: Text(message ?? 'loading...')),
        ]),
        content: const Center(child: CircularProgressIndicator()),
        insetAnimationDuration: const Duration(seconds: 5),
      ),
      barrierDismissible: true,
      // transitionDuration: const Duration(seconds: 3),
    );
    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pop(context as BuildContext); //pop dialog
      // _login();
    });
  }
}
