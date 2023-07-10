import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/text_field_widget.dart';
import '../controller/add_customer_controller.dart';


class AddCustomerStepTwo extends GetView<AddCustomerController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20,right: 30,left:30),
          child:Container(
            child: Form(
              key: controller.addCustomerStepTwoFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  CustomDropDown(
                    items:["Document 1","Document 2"],
                    hint:"Document Type*",
                    selectedItem:controller.documentType.value,
                    onChanged: (String? val){

                    },
                    errorText: controller.errorDocumentType.value,
                    validator: (String? value ) {

                    },
                  ),
                  const SizedBox(height: 15),
                  CustomDropDown(
                    items:["Document 42","Document 85"],
                    hint:"Document ID Number*",
                    selectedItem:controller.documentIdNumber.value,
                    onChanged: (String? val){

                    },
                    errorText: controller.errorDocumentIdNumber.value,
                    validator: (String? value ) {

                    },
                  ),
                  const SizedBox(height: 15),
                  Obx(() {
                    return  GestureDetector(
                      onTap: () async {
                        DateTime? startPickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if(startPickedDate!= null){
                          String formattedDate = DateFormat('dd/MM/yyyy').format(startPickedDate);
                          controller.issueDateController.text = formattedDate; //set output date to TextField value.
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFieldWidget(
                          controller: controller.issueDateController,
                          hintText: "Issue Date*",
                          showCursor: false,
                          readOnly: false,
                          autofocus: false,
                          autocorrect: false,
                          onChanged:(value){
                            //controller.dateOfBirthChanged(value);
                          },
                          validator:(value){
                            //return controller.validationsDateOfBirth(value);
                          },
                          messageErro: controller.errorIssueDate.value,
                          suffixIcon: Icon(Icons.calendar_month,color: Color(0xff034A8F),size: 25,),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 15),
                  Obx(() {
                    return GestureDetector(
                      onTap: () async {
                        DateTime? startPickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if(startPickedDate!= null){
                          String formattedDate = DateFormat('dd/MM/yyyy').format(startPickedDate);
                          controller.expirationDateController.text = formattedDate; //set output date to TextField value.
                        }
                      },
                      child: AbsorbPointer(
                        child: TextFieldWidget(
                          controller: controller.expirationDateController,
                          hintText: "Expiration Date*",
                          showCursor: false,
                          readOnly: false,
                          autofocus: false,
                          autocorrect: false,
                          onChanged:(value){
                            //controller.dateOfBirthChanged(value);
                          },
                          validator:(value){
                            //return controller.validationsDateOfBirth(value);
                          },
                          messageErro: controller.errorExpirationDate.value,
                          suffixIcon: Icon(Icons.calendar_month,color: Color(0xff034A8F),size: 25,),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 15),
                  Obx(() {
                    return TextFieldWidget(
                      controller: controller.placeOfBirthController,
                      onChanged:(value){
                        //controller.firstNameChanged(value);
                      },
                      validator:(value){
                       // return controller.validationsFirstName(value);
                      },
                      hintText: "Place of issue*",
                      messageErro: controller.errorExpirationDate.value,
                    );
                  }),
                  const SizedBox(height: 15),
                  Obx(() {
                    return TextFieldWidget(
                      controller: controller.professionController,
                      onChanged:(value){
                       // controller.lastNameChanged(value);
                      },
                      validator:(value){
                        //return controller.validationsLastName(value);
                      },
                      hintText: "Profession",
                      messageErro: controller.errorProfession.value,
                    );
                  }),
                  const SizedBox(height: 15),
                  Obx(() {
                    return TextFieldWidget(
                      controller: controller.nationalityController,
                      onChanged:(value){
                        //controller.firstNameChanged(value);
                      },
                      validator:(value){
                        //return controller.validationsFirstName(value);
                      },
                      hintText: "Nationality",
                      messageErro: controller.errorNationality.value,
                    );
                  }),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}