import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:payamlater/presentation/widgets/loading_overlay.dart';

import '../../authentication/controller/login_controller.dart';
import '../../product/model/product_model.dart';
import '../../salesperson/home/views/home_salesperson.dart';
import '../model/customers.dart';
import '../model/frequency.dart';
import '../model/payment.dart';
import '../model/prefinancial.dart';
import '../views/detail_product.dart';

class DetailController extends GetxController{

  final GlobalKey<FormState> prefinanceFormKey =
  GlobalKey<FormState>(debugLabel: '__prefinanceFormKey__');
  final startDateCtrl = TextEditingController();
  final payPlanCtrl = TextEditingController();
  final frequencyCtrl = TextEditingController();
  final avanceCtrl = TextEditingController();
  final weeklyCtrl = TextEditingController();

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  LoginController userId = LoginController();
  final storage = GetStorage();
  ProductModel? prodAcess;
  PayPlanModel? prodPay;
  FreqPlanModel? prodFreq;

  var allClient = [];

  var isworking = false.obs;
  var productlist = [].obs;
  var product = {}.obs;
  var selectProd = {};

  String? customers;
  bool isCustomerSelected = false;

  @override
  void onInit() async {
    // Fetch Data
    getProductById();
    getProductByAccess();
    getProductPayPlan();
    getAllClient();
    super.onInit();
  }

  Future<PrefinancModel> addPrefinancial() async {
    var auth = storage.read('token');
    var saleId = storage.read('saleId');
    DateTime today = DateTime.now();
    var date_invoice = "${today.year}-${today.month}-${today.day}";

    LoadingOverlay.show(message: 'Create...');
     Map body = {
        "token": "$auth",
        "customerid": 5,
        "groupid": 6,
        "sale_personid": saleId,
        "payment_type_id": prodFreq?.id,//frequency
        "durationId": prodPay?.id, //stay
        "currency_id": 1,
        "number": 1,
        "date_invoice": date_invoice.toString(),
        "sdate": startDateCtrl.text,
        "status": 'draft',
        "product": 1,
        "accessoires": [prodAcess?.id],
        "avance": int.parse(avanceCtrl.text),
      };
    var body1 = jsonEncode(body);
    print('data: $body1');

    final response = await http.post(
          Uri.parse("https://bnplapi.testing.laureal.io/bnpl/prefinancial/"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body1);
      if (response.statusCode == 201) {
        print('datas: ${response.body}');
        Get.defaultDialog(
            title: "",
            content: Container(
              height: 100,
              child: Column(
                children: [
                  Icon(
                    Icons.verified,
                    color: Colors.green[100],
                    size: 30,
                  ),
                  Text("Payment successful."),
                  Center(
                    child: Container(
                      height: 30,
                      width: 100,
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.off(SalesDashBoard());
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
        return PrefinancModel.fromJson(jsonDecode(response.body));
      } else {
        print("Error: ${response.statusCode}");
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
                          Get.off(ProductDetails());
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
        throw Exception('Failed to create prefinancial.');
      }
  }

  Future<ProductModel?> getProductById() async {
    var auth = storage.read('token');
    final http.Response response = await http.get(
      Uri.parse(
          "https://bnplapi.testing.laureal.io/bnpl/product/getbyId/token=$auth&id=1"),
    );

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)["message"];
      print('data1: $result');
      return ProductModel.fromJson(result[0]);
    } else {
      throw Exception('Failed to get product.');
    }
  }
   getProductDetailById(id) async {
    isworking.value = true;

    var auth = storage.read('token');
    try {
      final http.Response response = await http.get(
        Uri.parse(
            "https://bnplapi.testing.laureal.io/bnpl/product/getbyId/token=$auth&id=$id"),
      );
      final result = jsonDecode(response.body)["message"];
      product.value = result;
      print('data1: $result');
    } catch(e){
      product.value = {};
      throw Exception('Failed to get product.');
    } finally{
      isworking.value = false;
    }
    return product;

  }
//ok
  Future<List<ProductModel?>?> getProductByAccess() async {
    var auth = storage.read('token');
    http.Response response = await http.get(Uri.parse(
        "https://bnplapi.testing.laureal.io/bnpl/product/accessoires/token=$auth"));
    if (response.statusCode == 200) {
      ///data successfully
      List result = jsonDecode(response.body)["message"];
      print('access: $result');
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed fetching accessoiry');
    }
  }
//ok
  Future<List<PayPlanModel?>?> getProductPayPlan() async {
    var auth = storage.read('token');
    http.Response response = await http.get(Uri.parse(
        "https://bnplapi.testing.laureal.io/bnpl/paymentsplan/token=$auth"));
    if (response.statusCode == 200) {
      ///data successfully
      List payment = jsonDecode(response.body)["message"];
      print('payment: $payment');
      return payment.map((e) => PayPlanModel.fromJson(e)).toList();
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed fetching payment plan');
    }
  }
//ok
  Future<List<FreqPlanModel?>?> getProductFreqPlan() async {
    var auth = storage.read('token');
    http.Response response = await http.get(Uri.parse(
        "https://bnplapi.testing.laureal.io/bnpl/frequency/token=$auth"));
    if (response.statusCode == 201) {
      ///data successfully
      List frequency = jsonDecode(response.body)["message"];
      print('freq: $frequency');
      return frequency.map((e) => FreqPlanModel.fromJson(e)).toList();
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed fetching frequency');
    }
  }

  Future<CustomersModel?> getAllClient() async {
    var auth = storage.read('token');
    final http.Response response = await http.get(
      Uri.parse(
          "https://bnplapi.testing.laureal.io/bnpl/customer/$auth"),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body)["message"];
      print('AllCustom: $result');
      allClient = result;
      return CustomersModel.fromJson(result[0]);
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed to get customers.');
    }
  }

//post resquest
  // Future<Fruit> sendFruit(
  //     String title, int id, String imageUrl, int quantity) async {
  //   final http.Response response = await http.post(
  //     'url',
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //       'id': id.toString(),
  //       'imageUrl': imageUrl,
  //       'quantity': quantity.toString()
  //     }),
  //   );
  //   if (response.statusCode == 201) {
  //     return Fruit.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load album');
  //   }
  // }
}