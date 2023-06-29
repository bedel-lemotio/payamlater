import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payamlater/core/config/app_routes.dart';

import 'features/splashscreen/view/splashscreen.dart';


class Payamlater extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payamlater',
      initialRoute: "/",
      home: SplashScreen(),
      getPages: routes,
    );
  }
}
