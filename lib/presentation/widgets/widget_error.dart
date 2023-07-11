

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successAction(){
  Get.bottomSheet(
    backgroundColor: Colors.black.withOpacity(0.1),
    elevation: 2,
    isDismissible: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
    ),
    Container(
        height: 180,
        padding: EdgeInsets.only(left: 30,right: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 75,
                width: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Color(0xff6F8C2E).withOpacity(0.2),
                ),
                child: Icon(Icons.check,size: 40,color: Color(0xff034A8F),
                )
            ),
            SizedBox(height: 25),
            Text(
              'Changes successfully\n saved',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1B1D3B)
              ),
            ),
          ],
        )
    ),
  );
}

void errorAction(){
  Get.bottomSheet(
    backgroundColor: Colors.black.withOpacity(0.1),
    elevation: 2,
    isDismissible: true,
    enableDrag: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
    ),
    Container(
        height: 180,
        padding: EdgeInsets.only(left: 30,right: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 75,
                width: 75,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color:Color(0xffF93A3A).withOpacity(0.2),
                ),
                child: Icon(Icons.close,size: 40,color: Colors.white,
                )
            ),
            SizedBox(height: 25),
            Text(
              'Changes successfully\n saved',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1B1D3B)
              ),
            ),
          ],
        )
    ),
  );
}

showErrorMessage({required String error}) {
  Get.snackbar(
   'Error',
    error.toString(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.red.withOpacity(.75),
    colorText: Colors.white,
    icon: const Icon(Icons.error, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
  );
  return const SizedBox.shrink();
}

showSuccessMessage({required String error}) {
  Get.snackbar('Success',
    error.toString(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.green.withOpacity(.75),
    colorText: Colors.white,
    icon: const Icon(Icons.check_circle, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
  );
  return const SizedBox.shrink();
}



showInformationMessage({required String error}) {
  Get.snackbar(
    'Information',
    error.toString(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.blueAccent.withOpacity(.75),
    colorText: Colors.white,
    icon: const Icon(CupertinoIcons.question_circle_fill, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
  );
  return const SizedBox.shrink();
}

showWarningMessage({required String error}) {
  Get.snackbar(
    'Warning',
    error.toString(),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.orangeAccent.withOpacity(.75),
    colorText: Colors.white,
    icon: const Icon(CupertinoIcons.arrow_clockwise_circle_fill, color: Colors.white),
    shouldIconPulse: true,
    barBlur: 20,
  );
  return const SizedBox.shrink();
}
