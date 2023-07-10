import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../add_customer/controller/add_customer_controller.dart';

class ProfileScreen extends GetView<AddCustomerController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldAddCustomerKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: (){
                Get.back();
              },
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF1B1D3B),width: 1)
                ),
                child: Icon(Icons.arrow_back_ios_new,color: Color(0xFF1B1D3B),),
              ),
            ),
          ),
          title:Text(
            "Profile",
            style: TextStyle(
              color: Color(0xFF1B1D3B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
      ),
        body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,

        ),
      ),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

            ],
          ),
        )
    );
  }

}
