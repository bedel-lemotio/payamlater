import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../features/home/controller/home_controller.dart';
import '../features/salesperson/home/views/home_salesperson.dart';

class MyDrawer extends StatelessWidget {
  HomeController homeCtrl = Get.put(HomeController());

  onwillPop(BuildContext context) {
    final completer = Completer<bool>();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (buildContext) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Are you sure ?'),
                ),
                MaterialButton(
                    child: Text('YES'),
                    onPressed: () {
                      completer.complete(true);
                      getOutOfApp();
                    }),
                MaterialButton(
                    child: Text('NO'),
                    onPressed: () {
                      completer.complete(false);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });

    return completer.future;
  }

  getOutOfApp() {
    if (Platform.isIOS) {
      try {
        exit(0);
      } catch (e) {
        SystemNavigator.pop(); // for IOS, not true this, you can make comment this :)
      }
    } else {
      try {
        SystemNavigator.pop(); // sometimes it cant exit app
      } catch (e) {
        exit(0); // so i am giving crash to app ... sad :(
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(30, 30),
              bottomRight: Radius.elliptical(30, 30),
            ),
            color: Color(0xFFFFFFFF)),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Obx(() => Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(30, 30),
                        bottomRight: Radius.elliptical(30, 30),
                      ),
                    ),
                    //current logged in userName
                    accountName: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        // 'Hello! A',
                        'Hello! ${homeCtrl.username.value?['firstname'] ?? "-"} ',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Color(0xFF1B1D3B),
                        ),
                      ),
                    ),
                    accountEmail: Text(''),
                    currentAccountPictureSize: Size.square(150),
                    currentAccountPicture: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      padding: EdgeInsets.only(left: 20, top: 30, bottom: 10),
                      height: 100,
                      width: 30,
                      child: CircleAvatar(
                        child: Image.asset('assets/images/user.png',
                            fit: BoxFit.fitHeight, alignment: Alignment.center),
                      ),
                    ),
                  ),
                )),

            // for (int i = 0; i < 5; i++)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFF2F2F2),
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              onTap: () {
                Get.off(SalesDashBoard());
              },
              title: Text(
                "Dashboard",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xFF222222),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFFF2F2F2),
                child: Icon(
                  Icons.label,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              onTap: () => Get.off(SalesDashBoard()),
              title: Text(
                "Customers",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xFF222222),
                ),
              ),
            ),

            SizedBox(
              height: 280,
            ),
            SizedBox(
              width: 30,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFFFFFF),
                  minimumSize: Size(40, 70),
                ),
                onPressed: () {
                  homeCtrl.logout();
                  onwillPop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "LogOut",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color(0xFFF93A3A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 100),
              child: Text(
                'App Version - V 1.0',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                  color: Color(0xFF222222),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
