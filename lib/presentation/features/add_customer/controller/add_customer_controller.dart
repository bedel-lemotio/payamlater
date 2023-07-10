import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class AddCustomerController extends GetxController {


  //////////////////////////////////////////////////////////////////////////////
  /////////////////// DECLARATION ALL USE CASE AND SERVICE
  //////////////////////////////////////////////////////////////////////////////

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: activeStep.value, keepPage: true,);
  }


  //////////////////////////////////////////////////////////////////////////////
  /////////////////// DECLARATION VARIABLE
  //////////////////////////////////////////////////////////////////////////////
  final GlobalKey<ScaffoldState> scaffoldAddCustomerKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> addCustomerStepOneFormKey = GlobalKey<FormState>(debugLabel: '__addCustomerStepOneFormKey__');
  final GlobalKey<FormState> addCustomerStepTwoFormKey = GlobalKey<FormState>(debugLabel: '__addCustomerStepTwoFormKey__');
  final GlobalKey<FormState> addCustomerStepThreeFormKey = GlobalKey<FormState>(debugLabel: '__addCustomerStepThreeFormKey__');

  late PageController pageController;


  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController issueDateController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController placeOfIssueController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController locationController = TextEditingController();



  //////////////////////////////////////////////////////////////////////////////
  /////////////////// DECLARATION RX VARIABLE (OBSERVABLE)
  //////////////////////////////////////////////////////////////////////////////

  RxInt activeStep = RxInt(0);

  RxString firstName = RxString('');
  RxString lastName = RxString('');
  RxString dateOfBirth = RxString('');
  RxString gender = RxString('Male');
  RxString placeOfBirth = RxString('');
  RxString memberType = RxString('Type 1');
  RxString chooseAssociation = RxString('Association 1');
  RxString documentType = RxString('Document 1');
  RxString documentIdNumber = RxString('Document 42');
  RxString issueDate = RxString('');
  RxString expirationDate = RxString('');
  RxString placeOfIssue = RxString('');
  RxString profession = RxString('');
  RxString nationality = RxString('');
  RxString maritalStatus = RxString('Marital 1');
  RxString email = RxString('');
  RxString phoneNumber = RxString('');
  RxString codeCountry = RxString('');
  RxString location = RxString('');



  RxnString errorFirstName = RxnString(null);
  RxnString errorLastName = RxnString(null);
  RxnString errorDateOfBirth = RxnString(null);
  RxnString errorGender = RxnString(null);
  RxnString errorPlaceOfBirth = RxnString(null);
  RxnString errorMemberType = RxnString(null);
  RxnString errorChooseAssociation = RxnString(null);
  RxnString errorDocumentType = RxnString(null);
  RxnString errorDocumentIdNumber = RxnString(null);
  RxnString errorIssueDate = RxnString(null);
  RxnString errorExpirationDate = RxnString(null);
  RxnString errorPlaceOfIssue = RxnString(null);
  RxnString errorProfession = RxnString(null);
  RxnString errorNationality = RxnString(null);
  RxnString errorMaritalStatus = RxnString(null);
  RxnString errorEmail = RxnString(null);
  RxnString errorPhoneNumber = RxnString(null);
  RxnString errorCodeCountry = RxnString(null);
  RxnString errorLocation = RxnString(null);


  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION GET VALUE FIELD
  //////////////////////////////////////////////////////////////////////////////


  void emailChanged(String val) {
    email.value = val;
  }

  void firstNameChanged(String val) {
    firstName.value = val;
  }

  void lastNameChanged(String val) {
    lastName.value = val;
  }


  void dateOfBirthChanged(String val) {
    dateOfBirth.value = val;
  }

  void genderChanged(String val) {
    gender.value = val;
  }


  void phoneChanged(PhoneNumber number) {
    phoneNumber.value = number.phoneNumber!;
    codeCountry.value = number.dialCode!;
  }

  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION VALIDATED FIELD
  //////////////////////////////////////////////////////////////////////////////
  String? validationsPhone(bool value) {
    if (value != true) {
      errorPhoneNumber.value = 'Please this field must be filled';
    } else {
      errorPhoneNumber.value = null;
    }
    return errorPhoneNumber.value;
  }

  String? validationsFirstName(String? value) {
    if (value == null) {
      errorFirstName.value = null;
    } else if (value.isEmpty) {
      errorFirstName.value = 'Please this field must be filled';
    } else if (! RegExp('[a-zA-Z]').hasMatch(value)) {
      errorFirstName.value = 'Please enter a valid first name';
    }else{
      errorFirstName.value = null;
    }
    return errorFirstName.value;
  }

  String? validationsLastName(String? value) {
    if (value == null) {
      errorLastName.value = null;
    } else if (value.isEmpty) {
      errorLastName.value = 'Please this field must be filled';
    } else if (! RegExp('[a-zA-Z]').hasMatch(value)) {
      errorLastName.value = 'Please enter a valid last name';
    }else{
      errorLastName.value = null;
    }
    return errorLastName.value;
  }

  String? validationsGender(String? value) {
    if (value == null) {
      errorGender.value = null;
    } else if (value.isEmpty) {
      errorGender.value = 'Please this select your gender';
    } else{
      errorGender.value = null;
    }
    return errorGender.value;
  }

  String? validationsDateOfBirth(String? value) {
    if (value == null) {
      errorDateOfBirth.value = null;
    } else if (value.isEmpty) {
      errorDateOfBirth.value = 'Please this field must be filled';
    } else{
      errorDateOfBirth.value = null;
    }
    return errorDateOfBirth.value;
  }



  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION CONTROLLER
  //////////////////////////////////////////////////////////////////////////////


  void clear(){
    firstNameController.clear();
    lastNameController.clear();
    dateOfBirthController.clear();
    placeOfBirthController.clear();
    issueDateController.clear();
    expirationDateController.clear();
    placeOfIssueController.clear();
    professionController.clear();
    nationalityController.clear();
    phoneNumberController.clear();
    locationController.clear();

    firstName = RxString('');
    lastName = RxString('');
    dateOfBirth = RxString('');
    gender = RxString('Male');
    placeOfBirth = RxString('');
    memberType = RxString('');
    chooseAssociation = RxString('');
    documentType = RxString('');
    documentIdNumber = RxString('');
    issueDate = RxString('');
    expirationDate = RxString('');
    placeOfIssue = RxString('');
    profession = RxString('');
    nationality = RxString('');
    maritalStatus = RxString('');
    email = RxString('');
    phoneNumber = RxString('');
    codeCountry = RxString('');
    location = RxString('');



    errorFirstName = RxnString(null);
    errorLastName = RxnString(null);
    errorDateOfBirth = RxnString(null);
    errorGender = RxnString(null);
    errorPlaceOfBirth = RxnString(null);
    errorMemberType = RxnString(null);
    errorChooseAssociation = RxnString(null);
    errorDocumentType = RxnString(null);
    errorDocumentIdNumber = RxnString(null);
    errorIssueDate = RxnString(null);
    errorExpirationDate = RxnString(null);
    errorPlaceOfIssue = RxnString(null);
    errorProfession = RxnString(null);
    errorNationality = RxnString(null);
    errorMaritalStatus = RxnString(null);
    errorEmail = RxnString(null);
    errorPhoneNumber = RxnString(null);
    errorCodeCountry = RxnString(null);
    errorLocation = RxnString(null);
  }



}
