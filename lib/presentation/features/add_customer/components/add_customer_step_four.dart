import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/text_field_widget.dart';
import '../controller/add_customer_controller.dart';


class AddCustomerStepFour extends GetView<AddCustomerController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20,right: 40,left:50),
          child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                    child: DataTable(
                        dividerThickness:0.0,
                        showBottomBorder: false,
                        columns: [
                          // Set the name of the column
                          DataColumn(label: Text(''),),
                          DataColumn(label: Text(''),),
                        ],
                        rows:[
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                "First Name :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                                ),
                              DataCell(
                                Text(
                                  controller.firstName.value,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                          ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Last Name :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.lastName.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Date Of Birth :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.dateOfBirth.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Gender :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.gender.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Place Of Birth :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.placeOfBirth.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Association :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.chooseAssociation.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Document Type :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.documentType.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Document ID N° :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.documentIdNumber.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Issue Date :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.issueDate.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Expiration Date :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                    Text(
                                      controller.expirationDate.value,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                    Text(
                                      "Place Of Issue :",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                ),
                                DataCell(
                                  Text(
                                    controller.placeOfIssue.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                    Text(
                                      "Profession :",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                    ),
                                ),
                                DataCell(
                                  Text(
                                    controller.profession.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Nationality :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.nationality.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Marital status :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.maritalStatus.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Email :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.email.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Phone Number :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.phoneNumber.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),
                          DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Location :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.location.value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ]),

                        ]

                    ),
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}

