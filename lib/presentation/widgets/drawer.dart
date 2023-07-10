import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../features/home/controller/home_controller.dart';
import '../features/profile/profile_screen..dart';
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
      backgroundColor: Colors.transparent,
      width:Get.width*0.75 ,
      child: Container(
        height: Get.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Color(0xFFFFFFFF)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height:40),
                    Align(
                      alignment: Alignment.topRight,
                      child:  Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          color:Color(0xff1B1D3B) ,
                          onPressed: () { Get.back(); },
                          icon: Icon(CupertinoIcons.clear_circled_solid,size: 30,),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 90,
                      width: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('assets/images/moto1.jpeg',
                            fit: BoxFit.cover, alignment: Alignment.center),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      // 'Hello! A',
                      'Hello! ${homeCtrl.username.value?['firstname'] ?? "-"} ',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF1B1D3B),
                      ),
                    ),
                    SizedBox(height: 4),
                    InkWell(
                      onTap: () {
                        Get.back();
                        Get.toNamed('/profile');
                        },
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Color(0xFF034A8F),
                          decoration: TextDecoration.underline,
                          decorationThickness: 1
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFF2F2F2),
                        child: Icon(
                          CupertinoIcons.home,
                          color: Color(0xff1B1D3B),
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
                          fontSize: 17,
                          color: Color(0xff1B1D3B)
                        ),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFF2F2F2),
                        child: Icon(
                          Icons.label,
                          color: Color(0xff1B1D3B),
                          size: 25,
                        ),
                      ),
                      onTap: () => Get.off(SalesDashBoard()),
                      title: Text(
                        "Customers",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: Color(0xff1B1D3B)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width:Get.width*0.75 ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Divider(color: Colors.grey.withOpacity(0.5),height: 2,indent: 1,endIndent: 1,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextButton(
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

                  Container(
                    padding: const EdgeInsets.only(left: 20, top: 60),
                    margin: const EdgeInsets.only(bottom: 8),
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
            )
          ],
        ),
      ),
    );
  }
}
