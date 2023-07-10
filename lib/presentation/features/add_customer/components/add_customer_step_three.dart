import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/text_field_widget.dart';
import '../controller/add_customer_controller.dart';


class AddCustomerStepThree extends GetView<AddCustomerController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20,right: 30,left:30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Form(
                  key: controller.addCustomerStepThreeFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      CustomDropDown(
                        items:["Marital 1","Marital 2"],
                        hint:"Marital status",
                        selectedItem:controller.maritalStatus.value,
                        onChanged: (String? val){
                         // controller.genderChanged(val!);
                        },
                        errorText: controller.errorMaritalStatus.value,
                        validator: (String? value ) {
                          //return controller.validationsGender(value);
                        },
                      ),
                      const SizedBox(height: 15),
                      Obx(() {
                        return TextFieldWidget(
                          controller: controller.emailController,
                          onChanged:(value){
                            controller.emailChanged(value);
                          },
                          validator:(value){
                           // return controller.validationsDateOfBirth(value);
                          },
                          hintText: "Email*",
                          messageErro: controller.errorEmail.value,
                        );
                      }),
                      const SizedBox(height: 15),
                      Obx(() {
                        return TextFieldPhoneWidget(
                          controller: controller.phoneNumberController,
                          labelText: "Phone number",
                          hintText: "Phone number",
                          messageErro: controller.errorPhoneNumber.value,
                          onInputChanged: (PhoneNumber number) {
                            controller.phoneChanged(number);
                          },
                          onInputValidated:(value){
                            controller.validationsPhone(value);
                          },
                          onSaved: (PhoneNumber number) {
                            //controller.phoneSaved(number);
                          },
                        );
                      }),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 100,
                        child:  Obx(() {
                          return TextFieldWidget(
                            maxLines: null,
                            expands: true,
                            textInputType: TextInputType.multiline,
                            controller: controller.locationController,
                            onChanged:(value){
                              //controller.lastNameChanged(value);
                            },
                            validator:(value){
                              //return controller.validationsLastName(value);
                            },
                            hintText: "Location",
                            messageErro: controller.errorLastName.value,
                          );
                        }),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

