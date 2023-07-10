import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/text_field_widget.dart';
import '../controller/add_customer_controller.dart';


class AddCustomerStepOne extends GetView<AddCustomerController> {

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
                  key: controller.addCustomerStepOneFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Obx(() {
                        return TextFieldWidget(
                          controller: controller.firstNameController,
                          onChanged:(value){
                            controller.firstNameChanged(value);
                          },
                          validator:(value){
                            return controller.validationsFirstName(value);
                          },
                          hintText: "First Name*",
                          messageErro: controller.errorFirstName.value,
                        );
                      }),
                      const SizedBox(height: 15),
                      Obx(() {
                        return TextFieldWidget(
                          controller: controller.lastNameController,
                          onChanged:(value){
                            controller.lastNameChanged(value);
                          },
                          validator:(value){
                            return controller.validationsLastName(value);
                          },
                          hintText: "Last Name*",
                          messageErro: controller.errorLastName.value,
                        );
                      }),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(() {
                            return Expanded(
                              flex: 5,
                              child: GestureDetector(
                                onTap: () async {
                                  DateTime? startPickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2000),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  if(startPickedDate!= null){
                                    String formattedDate = DateFormat('dd/MM/yyyy').format(startPickedDate);
                                    controller.dateOfBirthController.text = formattedDate; //set output date to TextField value.
                                  }
                                },
                                child: AbsorbPointer(
                                  child: TextFieldWidget(
                                    controller: controller.dateOfBirthController,
                                    hintText: "Date Of Birth",
                                    showCursor: false,
                                    readOnly: false,
                                    autofocus: false,
                                    autocorrect: false,
                                    onChanged:(value){
                                      controller.dateOfBirthChanged(value);
                                    },
                                    validator:(value){
                                      return controller.validationsDateOfBirth(value);
                                    },
                                    messageErro: controller.errorDateOfBirth.value,
                                    suffixIcon: Icon(Icons.calendar_month,color: Color(0xff034A8F),size: 25,),
                                  ),
                                ),
                              ),
                            );
                          }),
                          SizedBox(width: 10),
                          Container(
                            width: 100,
                            child: CustomDropDown(
                              items:["Male","Female"],
                              hint:"Gender",
                              selectedItem:controller.gender.value,
                              onChanged: (String? val){
                                controller.genderChanged(val!);
                              },
                              errorText: controller.errorGender.value,
                              validator: (String? value ) {
                                return controller.validationsGender(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Obx(() {
                        return TextFieldWidget(
                          controller: controller.placeOfBirthController,
                          onChanged:(value){
                            controller.firstNameChanged(value);
                          },
                          validator:(value){
                            //return controller.validationsFirstName(value);
                          },
                          hintText: "Place Of Birth",
                          messageErro: controller.errorPlaceOfBirth.value,
                        );
                      }),
                      const SizedBox(height: 15),
                      CustomDropDown(
                        items:["Type 1","Type 2"],
                        hint:"Member Type",
                        selectedItem:controller.memberType.value,
                        onChanged: (String? val){

                        },
                        errorText: controller.errorGender.value,
                        validator: (String? value ) {

                        },
                      ),
                      const SizedBox(height: 15),
                      CustomDropDown(
                        items:["Association 1","Association 2"],
                        hint:"Choose Association",
                        selectedItem:controller.chooseAssociation.value,
                        onChanged: (String? val){

                        },
                        errorText: controller.errorChooseAssociation.value,
                        validator: (String? value ) {

                        },
                      ),
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