import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/stepper/linear_step_indicator.dart';
import 'components/add_customer_step_four.dart';
import 'components/add_customer_step_one.dart';
import 'components/add_customer_step_three.dart';
import 'components/add_customer_step_two.dart';
import 'controller/add_customer_controller.dart';

class AddCustomerScreen extends GetView<AddCustomerController> {

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
                controller.clear();
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
            "Add Customer",
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      if(controller.activeStep.value != 3){
                        return LinearStepIndicator(
                          steps: 3,
                          //steps: controller.activeStep.value,
                          controller: controller.pageController,
                          labels: List<String>.generate(3, (index) => "Step ${index + 1}"),
                          complete: () {
                            return Future.value(true);
                          },
                        );
                      }else{
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 20,top: 15,bottom: 15
                          ),
                          child: Text(
                            "OVERVIEW",
                            style: TextStyle(
                              color: Color(0xFF034A8F),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }
                    }),

                    Divider(color: Colors.grey.withOpacity(0.5),height: 1,),
                  ],
                ),
              ),
              Expanded(
                child:  Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        controller.activeStep.value = value;
                        printInfo(info: value.toString());
                      },
                      children: [
                        AddCustomerStepOne(),
                        AddCustomerStepTwo(),
                        AddCustomerStepThree(),
                        AddCustomerStepFour(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar: AnimatedOpacity(
          opacity: MediaQuery.of(context).viewInsets.bottom != 0 ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 1000),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(() {
                  if(controller.activeStep.value > 0){

                    return TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text(
                          "Prev",
                          style: TextStyle(
                            color: Color(0xff034A8F),
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.blue,
                      ),
                      onPressed: () {
                        controller.pageController.previousPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceOut);
                      },
                    );
                  }else{
                    return SizedBox();
                  }
                }),
                Obx(() {
                  if(controller.activeStep.value != 3){
                    return ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff034A8F),
                        elevation: 0,
                      ),
                      onPressed: () {
                        //DeviceUtils.hideKeyboard(context);
                        controller.pageController.nextPage(duration: const Duration(milliseconds: 200), curve: Curves.bounceOut);


                        /*if (controller.addCustomerStepOneFormKey.currentState!.validate()) {
                      controller.addCustomerStepOneFormKey.currentState!.save();

                    }else{
                      //showErrorMessage(error: "Incorrect field!!!");
                    }*/
                      },
                    );
                  }else{
                    return ElevatedButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff034A8F),
                        elevation: 0,
                      ),
                      onPressed: () {

                      },
                    );
                  }
                }),

              ],
            ),
          ),
        )
    );
  }

}
