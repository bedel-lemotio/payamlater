import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:payamlater/presentation/features/authentication/controller/login_controller.dart';
import 'package:payamlater/presentation/features/salesperson/home/model/categoryPrefinancialModel.dart';
import 'package:payamlater/presentation/features/salesperson/home/model/productPrefinancialModel.dart';

import '../model/category.dart';
import '../model/product_model.dart';


class ProductController extends GetxController with StateMixin {

  var isLoading = false.obs;

  var isworking = false.obs;
  var productlist = [].obs;
  var product = {}.obs;
  var selectProd = {};


  Rxn<List<CategoryPrefinancialModel>?> categoryPrefinancial = Rxn<List<CategoryPrefinancialModel>?>(null);
  Rxn<List<ProductPrefinancialModel>?> productPrefinancial = Rxn<List<ProductPrefinancialModel>?>(null);



  final storage = GetStorage();
  LoginController loginCtrl = Get.put(LoginController());


  @override
  void onInit() async {
    // Fetch Data
    getProduct();
    getCategory();
    super.onInit();
  }

  Future<List<ProductModel?>?> getProduct() async {
    var auth = storage.read('token');
    http.Response response = await http.get(Uri.parse(
        "https://bnplapi.testing.laureal.io/bnpl/product/$auth"));
    if (response.statusCode == 200) {
      ///data successfully
      List result = jsonDecode(response.body)["message"];
      print('product: $result');
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed fetching data');
    }
  }

  //update get product detail by id
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


  //get all category
  Future<List<CategoryPrefinancialModel?>?> getCategory() async {
    var auth = storage.read('token');
    http.Response response = await http.get(Uri.parse("https://bnplapi.testing.laureal.io/bnpl/category/$auth"));
    if (response.statusCode == 200) {
      ///data successfully
      List result = jsonDecode(response.body)["message"];
      print('category: $result');
      categoryPrefinancial.value = result.map((e) => CategoryPrefinancialModel.fromJson(e)).toList();
      return categoryPrefinancial.value;
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed fetching data');
    }
  }

  //Get product by category
  Future<List<ProductPrefinancialModel?>?> getProductByCat(String id) async {
    var auth = storage.read('token');
    http.Response response = await http.get(Uri.parse("https://bnplapi.testing.laureal.io/bnpl/product/getbyCategory/token=$auth&categoryId=$id"));
    if (response.statusCode == 200) {
      ///data successfully
      var result = jsonDecode(response.body)["message"];
      print('product: $result');
      productPrefinancial.value = result.map((e) => ProductPrefinancialModel.fromJson(e)).toList();
      return productPrefinancial.value;
    } else {
      print('error: ${response.statusCode}');
      throw Exception('Failed fetching data');
    }
  }


}
