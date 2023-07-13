import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../widgets/text_field_widget.dart';
import '../../add_customer/controller/add_customer_controller.dart';
import '../../home/controller/home_controller.dart';
import 'delete_account/policy_to_off_account_screen.dart';

class ProfileScreen extends GetView<AddCustomerController> {
  HomeController homeCtrl = Get.put(HomeController());

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
          child: Column(
            children: [
              SizedBox(height:30),
              Container(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      height: 90,
                      width: 90,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset('assets/images/portrait_placeholder.png',
                            fit: BoxFit.cover, alignment: Alignment.center),
                      ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 7,
                      child: InkWell(
                        onTap:(){
                          changeProfile();
                        },
                        child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:Color(0xffEBEBEB),
                              border: Border.all(color:Colors.white,width: 2.5),
                            ),
                            child: Icon(Icons.camera_alt,size: 20,color: Color(0xff034A8F),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                // 'Hello! A',
                '${homeCtrl.userData.value?.firstname} ${homeCtrl.userData.value?.lastname} ',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF1B1D3B),
                ),
              ),
              SizedBox(height:30),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "First Name",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFieldSimpleWidget(
                                  key: key,
                                  controller: TextEditingController(text: homeCtrl.userData.value?.firstname),
                                  hintText: '',
                                  messageErro: '',
                                ),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 45.0,
                                height: 50.0,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    side: BorderSide(width: 1, color: Color(0xffE5E7EB)),
                                  ),
                                  onPressed: () { updateFirstName(); },
                                  child: Image.asset('assets/icon/icon-edit.png', fit: BoxFit.contain,width: 20,height: 20,),
                                 // child: Im(Icons.edit_note,size: 25,color: Color(0xff034A8F)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Last Name",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFieldSimpleWidget(
                                  key: key,
                                  controller: TextEditingController(text: homeCtrl.userData.value?.lastname),
                                  hintText: '',
                                  messageErro: '',
                                ),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 45.0,
                                height: 50.0,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    side: BorderSide(width: 1, color: Color(0xffE5E7EB)),
                                  ),
                                  onPressed: () { updateLastName(); },
                                  child: Image.asset('assets/icon/icon-edit.png', fit: BoxFit.contain,width: 20,height: 20,),
                                  // child: Im(Icons.edit_note,size: 25,color: Color(0xff034A8F)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFieldSimpleWidget(
                                  key: key,
                                  controller: TextEditingController(text: homeCtrl.userData.value?.email),
                                  hintText: '',
                                  messageErro: '',
                                ),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                  width: 45.0,
                                  height: 50.0,
                                  child: Container()
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Phone Number",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: InternationalPhoneNumberInput(
                                  selectorConfig: const SelectorConfig(
                                      selectorType: PhoneInputSelectorType.DROPDOWN,
                                      showFlags: true,
                                      useEmoji: true,
                                      setSelectorButtonAsPrefixIcon: true,
                                      trailingSpace: false
                                  ),
                                  ignoreBlank: false,
                                  textAlignVertical: TextAlignVertical.center,
                                  autoValidateMode: AutovalidateMode.onUserInteraction,
                                  selectorTextStyle: const TextStyle(color: Colors.black),
                                  initialValue: PhoneNumber(dialCode: "+237",isoCode:"CMR",phoneNumber: homeCtrl.userData.value?.phone),
                                  textFieldController: TextEditingController(text: homeCtrl.userData.value?.phone),
                                  countries: const ["CM", "NE", "FR"],
                                  formatInput: true,
                                  keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                                  spaceBetweenSelectorAndTextField: 0,
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                  inputDecoration: InputDecoration(
                                    hintStyle: const TextStyle(
                                        color: Color(0xff8D9091),
                                        fontSize: 14),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Color(0xff034A8F) ),
                                        gapPadding: 10
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color:Color(0xffEFEFEF) ),
                                        gapPadding: 10),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Colors.red),
                                        gapPadding: 10
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(color: Color(0xff034A8F)),
                                        gapPadding: 10
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                      filled: true,
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                      fillColor: Color(0xffF9FAFB)

                                  ),
                                  onInputChanged: (PhoneNumber value) {  },
                                ),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                  width: 45.0,
                                  height: 50.0,
                                  child: Container()
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  key: key,
                                  textAlign: TextAlign.start,
                                  //obscureText: true,
                                  textAlignVertical: TextAlignVertical.top,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                      hintText: "******************",
                                      suffixIcon:Icon(CupertinoIcons.eye_slash,color: Color(0xff034A8F),),
                                      hintStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffABAFB7),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(color: Color(0xffE5E7EB) ),
                                          gapPadding: 10
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(color:  Color(0xff034A8F) ),
                                          gapPadding: 10),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(color: Colors.red),
                                          gapPadding: 10
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(color: Color(0xff034A8F)),
                                          gapPadding: 10
                                      ),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      filled: true,
                                      contentPadding: const EdgeInsets.only(top: 20,left: 10),
                                      fillColor: Color(0xffF9FAFB)
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              SizedBox(
                                width: 45.0,
                                height: 50.0,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    side: BorderSide(width: 1, color: Color(0xffE5E7EB)),
                                  ),
                                  onPressed: () { changePassword(); },
                                  child: Image.asset('assets/icon/icon-edit.png', fit: BoxFit.contain,width: 20,height: 20,),
                                  // child: Im(Icons.edit_note,size: 25,color: Color(0xff034A8F)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color:Color(0xffF4FBFE),
              boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: Offset(
                  1.0,
                  1.0,
                ),
              )
            ],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                constraints: BoxConstraints.expand(width: Get.width*0.5,height: 70),
                padding: const EdgeInsets.only(left: 30),
                onPressed: () {
                  Get.to(PolicyToOffAccountScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.delete,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Delete Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFFF0000),
                      ),
                    ),
                  ],
                ),
              ),
              RawMaterialButton(
                constraints: BoxConstraints.expand(width: Get.width*0.5,height: 70),
                padding: EdgeInsets.only(left: Get.width*0.2),
                onPressed: () {

                },
                child:Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Log out",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF040402),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }


  void changeProfile(){
    Get.bottomSheet(
      backgroundColor: Colors.black.withOpacity(0.1),
      elevation: 2,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
      ),
      Container(
          height: 270,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
          ),
          child:Column(
            children: [
              SizedBox(height: 30),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title:const Text(
                  'Take a Photo',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034A8F)
                  ),
                ),
                onTap: (){

                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title:const Text(
                  'Select from Gallery',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034A8F)
                  ),
                ),
                onTap: (){

                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title:const Text(
                  'View Photo',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff034A8F)
                  ),
                ),
                onTap: (){

                },
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 30),
                title:const Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffF93A3A)
                  ),
                ),
                onTap: (){
                  Get.back();
                },
              ),
            ],
          )
      ),
    );
  }

  void updateFirstName(){
    Get.bottomSheet(
      backgroundColor: Colors.black.withOpacity(0.1),
      elevation: 2,
      isDismissible: false,
      enableDrag: false,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'Enter your First Name',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034A8F)
                ),
              ),
              SizedBox(height: 10),
              Obx(() {
                return TextFieldSimpleWidget(
                  controller: controller.firstNameController,
                  onChanged:(value){
                    controller.firstNameChanged(value);
                  },
                  validator:(value){
                    return controller.validationsFirstName(value);
                  },
                  hintText: "First Name",
                  messageErro: controller.errorFirstName.value,
                );
              }),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ))
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffF93A3A),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Color(0xff6F8C2E)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ))
                      ),
                        onPressed: () {

                        },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                      ),
                    ),
                    )
                  ],
                ) ,
              )
            ],
          )
      ),
    );
  }

  void updateLastName(){
    Get.bottomSheet(
      backgroundColor: Colors.black.withOpacity(0.1),
      elevation: 2,
      isDismissible: false,
      enableDrag: false,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'Enter your Last Name',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034A8F)
                ),
              ),
              SizedBox(height: 10),
              Obx(() {
                return TextFieldSimpleWidget(
                  controller: controller.lastNameController,
                  onChanged:(value){
                    controller.lastNameChanged(value);
                  },
                  validator:(value){
                    return controller.validationsLastName(value);
                  },
                  hintText: "Last Name",
                  messageErro: controller.errorLastName.value,
                );
              }),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ))
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffF93A3A),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Color(0xff6F8C2E)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ))
                      ),
                        onPressed: () {
                          Get.back();
                        },
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                      ),
                    ),
                    )
                  ],
                ) ,
              )
            ],
          )
      ),
    );
  }

  void changePassword(){
    Get.bottomSheet(
      backgroundColor: Colors.black.withOpacity(0.1),
      elevation: 2,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
      ),
      Container(
          height: 400,
          padding: EdgeInsets.only(left: 30,right: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
          ),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff034A8F)
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Your new password must be unique from those previously used.',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey
                ),
              ),
              SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current Password",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Obx(() {
                    return TextFieldSimpleWidget(
                      //controller: controller.lastNameController,
                      onChanged:(value){
                        //controller.lastNameChanged(value);
                      },
                      validator:(value){
                        //return controller.validationsLastName(value);
                      },
                      hintText: "",
                      messageErro: controller.errorLastName.value,
                    );
                  })
                ],
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Password",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Obx(() {
                    return TextFieldSimpleWidget(
                      //controller: controller.lastNameController,
                      onChanged:(value){
                        //controller.lastNameChanged(value);
                      },
                      validator:(value){
                        //return controller.validationsLastName(value);
                      },
                      hintText: "",
                      messageErro: controller.errorLastName.value,
                    );
                  })
                ],
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Obx(() {
                    return TextFieldSimpleWidget(
                      //controller: controller.lastNameController,
                      onChanged:(value){
                        //controller.lastNameChanged(value);
                      },
                      validator:(value){
                        //return controller.validationsLastName(value);
                      },
                      hintText: "",
                      messageErro: controller.errorLastName.value,
                    );
                  }),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(Colors.transparent),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ))
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffF93A3A),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    TextButton(
                      style: ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(Color(0xff6F8C2E)),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                          ))
                      ),
                      onPressed: () {

                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ) ,
              )
            ],
          )
      ),
    );
  }



}
