import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:payamlater/core/service/api_url.dart';

import '../../../authentication/model/login_model.dart';
import '../../../dashboard/views/dashboard.dart';
import '../model/calendar.dart';
import '../model/client.dart';
import '../model/custom_amount.dart';
import '../model/payment.dart';
import '../model/prelementModel.dart';
import '../model/productAccessoireModel.dart';
import '../model/sales_amount.dart';

class SalesController extends GetxController {
  AmountSalesModel? amountSalesModel;
  Rxn<AmountCustomerModel> amountCust = Rxn<AmountCustomerModel>(null);

  Rxn<List<Map<String, dynamic>>> customerSalesList = Rxn<List<Map<String, dynamic>>>([]);
  Rxn<List<PrelementModel>?> prelemtBySaleList = Rxn<List<PrelementModel>>([]);
  Rxn<AmountSalesModel?> prefinanceData = Rxn<AmountSalesModel?>(null);

  Map<String, dynamic>? customer;
  Rxn<List<PrelementModel>?> custPrelement = Rxn<List<PrelementModel>?>(null);
  Rxn<PrelementModel?> currentPrelementDetails = Rxn<PrelementModel?>(null);
  Rxn<String> customerdisplayed = Rxn<String>(null);

  final GlobalKey<FormState> payFormKey = GlobalKey<FormState>(debugLabel: '__payFormKey__');

  final pVerseCtrl = TextEditingController();
  final pStatusCtrl = TextEditingController();
  String? payMethodCtrl = 'Cash';
  String? typePayCtrl;

  final storage = GetStorage();
  List data = [];

  /*Create customer*/
  TextEditingController idcustomer = TextEditingController();
  TextEditingController membertype = TextEditingController();
  TextEditingController groupid = TextEditingController();
  TextEditingController identificationType = TextEditingController();
  TextEditingController idcard = TextEditingController();
  TextEditingController datetype = TextEditingController();
  TextEditingController lieu = TextEditingController();
  TextEditingController repere = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController nationalite = TextEditingController();
  TextEditingController maritalstatus = TextEditingController();

  @override
  void onInit() async {
    // Fetch Data
    getAmountBySale();
    getAllClientBySales();
    getPaymentByPref();
    getPrelemtBySale();
    getCalendarByPref();
    super.onInit();
  }

  /*Create customer*/
  Future<ClientModel> createCustomer() async {
    var auth = storage.read('token');

    Map body = {
      "tokenid": "$auth",
      "firstname": "string",
      "lastname": "string",
      "email": "string",
      "phone": "string",
      "datebirth": "2023-06-14",
      "placebirth": "string",
      "gender": "string",
      "membertype": "string",
      "groupid": 0,
      "cni_other": "string",
      "datecni": "2023-06-14",
      "lieu": "string",
      "repere": "string",
      "profession": "string",
      "nationalite": "string",
      "maritalstatus": "string",
      "numerocni": "string"
    };
    var body1 = jsonEncode(body);
    print('data: ${body1}');

    final response = await http.post(
        Uri.parse('${ApiUrl.testingURL}/customer/createbysales/token=$auth'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
        body: body1);
    if (response.statusCode == 201) {
      print('clientCreate: ${response.body}');
      Get.defaultDialog(
          title: "",
          content: Column(
            children: [
              Icon(
                Icons.verified,
                color: Colors.green[400],
                size: 50,
              ),
              Text("Customer created."),
            ],
          ));

      return ClientModel.fromJson(jsonDecode(response.body));
    } else {
      print('error: ${response.statusCode}');
      Get.defaultDialog(
          title: "",
          content: Container(
            height: 100,
            child: Column(
              children: [
                Icon(
                  Icons.dangerous,
                  color: Colors.red[500],
                  size: 30,
                ),
                Text("Customer not created."),
              ],
            ),
          ));
      throw Exception('Failed to create customer.');
    }
  }

  Future<AmountSalesModel?> getAmountBySale() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    final http.Response response = await http.get(
      Uri.parse("https://bnplapi.testing.laureal.io/bnpl/prefinancial/SumamoutbysaleID/token=$auth&saleId=$saleId"),);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"];
      print('amount sales: $result');
      prefinanceData.value = AmountSalesModel.fromJson(result[0]);
      return prefinanceData.value;
    } else {
      throw Exception('Failed to get prefinancial by sale.');
    }
  }

  getAllClientBySales() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    final http.Response response = await http.get(Uri.parse("https://bnplapi.testing.laureal.io/bnpl/customer/getbysaleId/token=$auth&saleid=$saleId"),);
    var result = (jsonDecode(response.body)["message"] as List)
        .map((dynamic e) => e as Map<String, dynamic>)
        .toList();
    print('clientBy: $result');
    customerSalesList.value = result;
  }

  /* Lier au dropdown*/
  Future<AmountCustomerModel?> getAmountByCustumer(int? id) async {
    var headers = {'Content-Type': 'application/json'};
    var auth = storage.read('token');
    final http.Response response = await http.get(
        Uri.parse("https://bnplapi.testing.laureal.io/bnpl/prefinancial/SumamoutbycustomerID/token=$auth&customerID=$id"), headers: headers);
    print('idCust $id');
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"];
      print('amount custumer: $result');
      amountCust.value = AmountCustomerModel.fromJson(result);
      return AmountCustomerModel.fromJson(result);
    } else {
      throw Exception('Failed to get prefinancial by customer.');
    }
  }

  Future<List<PrelementModel>?> getPrelemtByCust(String id) async {
    var auth = storage.read('token');

    final http.Response response = await http.get(Uri.parse("https://bnplapi.testing.laureal.io/bnpl/pre-element/pre-element/token=$auth&customerId=$id"),);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"] as List<dynamic>;
      print('prelemet: $result');
      custPrelement.value = result.map((e) => PrelementModel.fromJson(e)).toList();
      // var elemtId = result[0]["idprelement"];
      // storage.write('elemtId', elemtId);
      // print('Id: $elemtId');
      return custPrelement.value;
    } else {
      throw Exception('Failed to get pre-element by customer.');
    }
  }

  /* Fin */
  Future<PrelementModel?> getPrelemtByElemt(String elemtId) async {
    var auth = storage.read('token');
    final http.Response response = await http.get(Uri.parse("https://bnplapi.testing.laureal.io/bnpl/pre-element/pre-elementbyID/token=$auth&elementId=$elemtId"),);
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)["message"];
      print('element: $result');
      currentPrelementDetails.value = PrelementModel.fromJson(result[0] as Map<String,dynamic>);
      final dataResult = result[1] as Map<String,dynamic>;
      final dataResultList = dataResult["accessoire"] as List<dynamic>;
      currentPrelementDetails.value?.accessoires = dataResultList.map((e) => ProductAccessoireModel.fromJson(e)).toList();
      return currentPrelementDetails.value;
    } else {
      printError(info:'Error',logFunction:throw Exception('Failed to get prefinancial by element.') );

    }
  }

  Future<List<PrelementModel>?> getPrelemtBySale() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    final http.Response response = await http.get(Uri.parse("https://bnplapi.testing.laureal.io/bnpl/pre-element/pre-element/token=$auth&saleId=$saleId"),);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"] as List<dynamic>;
      print('prelemetbySale: $result');
      prelemtBySaleList.value = result.map((e) => PrelementModel.fromJson(e)).toList();
      return prelemtBySaleList.value;
    } else {
      throw Exception('Failed to get pre-element by sale.');
    }
  }

  Future<PaymentModel> createPayment() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    DateTime today = DateTime.now();
    var pDateCtrl = "${today.year}-${today.month}-${today.day}";

    Map body = {
      'tokenid': "$auth",
      'p_prefinancial_id': 7,
      'p_saleid': saleId,
      'p_customerid': 5,
      'p_type_pay': typePayCtrl,
      'p_date': pDateCtrl,
      'p_verse': int.parse(pVerseCtrl.text),
      'p_amount_du': 0,
      'p_status': "draft",
      'paiement_method': payMethodCtrl,
      'p_currency_id': 1,
    };
    //add input for p_status onhand,
    var body1 = jsonEncode(body);
    print('data: ${body1}');

    final response =
        await http.post(Uri.parse('${ApiUrl.testingURL}/paiement/add'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body1);
    if (response.statusCode == 201) {
      print('datas: ${response.body}');
      Get.defaultDialog(
          title: "",
          content: Column(
            children: [
              Icon(
                Icons.verified,
                color: Colors.green[400],
                size: 50,
              ),
              Text("Payment successfull."),
            ],
          ));

      return PaymentModel.fromJson(jsonDecode(response.body));
    } else {
      print('error: ${response.statusCode}');
      Get.defaultDialog(
          title: "",
          content: Container(
            height: 100,
            child: Column(
              children: [
                Icon(
                  Icons.dangerous,
                  color: Colors.red[500],
                  size: 30,
                ),
                Text("Payment failed."),
                Center(
                  child: Container(
                    height: 30,
                    width: 100,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off(DashBoard());
                      },
                      child: Text("go back".toUpperCase()),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF6F8C2E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
      throw Exception('Failed to create payment.');
    }
  }

  Future<List<CalendarModel>> getCalendarByPref() async {
    var auth = storage.read('token');
    final http.Response response = await http.get(
      Uri.parse(
          "https://bnplapi.testing.laureal.io/bnpl/calendar/getbyId/token=$auth&prefinanceid=7"),
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)["message"];
      print('calendarBy: $result');
      return result.map((data) => CalendarModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to get payment by payment.');
    }
  }

  Future<List<PaymentModel>> getPaymentByPref() async {
    var auth = storage.read('token');
    final http.Response response = await http.get(
      Uri.parse(
          "https://bnplapi.testing.laureal.io/bnpl/paiement/getbyprefinancialId/token=$auth&id=7"),
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)["message"];
      print('paymentBy: $result');
      return result.map((data) => PaymentModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to get payment by payment.');
    }
  }
}
