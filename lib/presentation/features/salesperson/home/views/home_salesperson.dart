import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payamlater/presentation/widgets/drawer.dart';

import '../../../product/views/list_product.dart';
import '../controller/sales_controller.dart';
import '../model/custom_amount.dart';
import '../model/prelementModel.dart';
import 'payment.dart';

class SalesDashBoard extends StatefulWidget {
  const SalesDashBoard({Key? key}) : super(key: key);

  @override
  State<SalesDashBoard> createState() => _SalesDashBoardState();
}

class _SalesDashBoardState extends State<SalesDashBoard>
    with SingleTickerProviderStateMixin {
  List<String> listImage = [];
  int selectedSliderPosition = 0;

  late TabController tabCtrl = TabController(length: 3, vsync: this,initialIndex: 1);

  SalesController salesController = Get.put(SalesController());

  AmountCustomerModel? idCustom;
  PrelementModel? prelement;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 3, vsync: this,initialIndex: 1);
    salesController.getAmountBySale();
  }

  final df = new DateFormat('dd-MM-yyyy');

  Future<bool> willPop(BuildContext ctx, {String? title}) {
    final completer = Completer<bool>();
    showModalBottomSheet(
        context: ctx,
        builder: (buildContext) {
          return Container(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(title ?? "Est vous sûr quitter cette action?",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                          child: const Text("NON",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              )),
                          onPressed: () {
                            completer.complete(false);
                            Navigator.of(buildContext).pop(false);
                          }),
                    ),
                    Expanded(
                      child: TextButton(
                          child: const Text("OUI",
                              style: TextStyle(
                                //color: AppColors.primary,
                                fontSize: 16,
                              )),
                          onPressed: () {
                            completer.complete(true);
                            Navigator.of(buildContext).pop();
                          }),
                    ),
                  ],
                )
              ],
            ),
          );
        });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPop(context, title: "Voulez-vous vraiment quitter?"),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xFFE8F5FF),
          brightness: Brightness.dark,
          elevation: 0,
          title: Image.asset(
            'assets/logo/home_logo.png',
            height: 35,
            fit: BoxFit.cover,
          ),
          centerTitle: false,
          automaticallyImplyLeading: true,
          actions: <Widget>[
            IconButton(
                icon: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Color(0xff4A4D52),
                      size: 25,
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          color: Color(0xff53D226),
                          border: Border.all(color: Colors.white,width: 1)
                        ),
                        height: 6,
                        width: 6,
                      ),
                    )
                  ],
                ),
                onPressed: () {}
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin:EdgeInsets.only(right: 10) ,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                      'assets/images/portrait_placeholder.png',
                      fit: BoxFit.cover,
                    width: 45,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: MyDrawer(),
        extendBody: true,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if ( salesController.prefinanceData.value != null ) {
                  return Card(
                    elevation: 5,
                    color: Color(0xFFE8F5FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(30, 30),
                        bottomRight: Radius.elliptical(30, 30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20,bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          SizedBox(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                prefixIcon: Align(
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Search product ...',
                                //8AA0BC
                                suffixIcon: Align(
                                  widthFactor: 1.0,
                                  heightFactor: 1.0,
                                  child: Icon(
                                    Icons.tune,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Financed',
                                  style: TextStyle(
                                    color: Color(0xFF034A8F),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                  // textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  NumberFormat.decimalPattern().format(salesController.prefinanceData.value?.totalFinanced ?? 0)+" FCFA",
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 26,
                                  ),
                                  // textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child:  Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF000000), width: 1),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Total of Clients',
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              '${salesController.prefinanceData.value?.nbrCustomers ?? 0}',
                                              style: TextStyle(
                                                color: Color(0xFF034A8F),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF53D226), width: 1),
                                          borderRadius: BorderRadius.circular(10),
                                          // color: Color(0xFFF034A8F),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Total Repaid',
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              NumberFormat.decimalPattern()
                                                  .format(
                                                  salesController.prefinanceData.value?.totalrepaid ??
                                                      0),
                                              style: TextStyle(
                                                color: Color(0xFF53D226),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFFFF0000), width: 1),
                                          borderRadius: BorderRadius.circular(10),
                                          // color: Color(0xFFF3B63F),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Delayed',
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              NumberFormat.decimalPattern().format(salesController.prefinanceData.value?.amountdue ?? 0),
                                              style: TextStyle(
                                                color: Color(0xFFFF0000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xFF034A8F), width: 1),
                                          borderRadius: BorderRadius.circular(10),
                                          // color: Color(0xFFF034A8F),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Not yet Due',
                                              style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              NumberFormat.decimalPattern()
                                                  .format(
                                                  salesController.prefinanceData.value?.totaladvance ??
                                                      0),
                                              style: TextStyle(
                                                color: Color(0xFF034A8F),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 18,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
              Container(
                child: TabBar(
                  controller: tabCtrl,
                  labelColor: Color(0xFF6F8C2E),
                  unselectedLabelColor: Color(0xFF1A1A27),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff074A8F),
                  enableFeedback: false,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorWeight: 3,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: 'Targets'),
                    Tab(text: 'Customers'),
                    Tab(text: 'Products'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: TabBarView(controller: tabCtrl, children: [
                  SingleChildScrollView(
                    child:
                    Obx(() => salesController.customerSalesList.value != null && salesController.customerSalesList.value!.isNotEmpty
                        ? Container(color: Color(0xFFF2F2F2),
                      child: Column(
                        children: [
                          Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 30),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              color: Color(0xFFF2F2F2),
                              child:Text(
                                'Target of the Week',
                                style: TextStyle(
                                  color: Color(0xFF848484),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              )
                          ),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 20,bottom: 20),
                            child: DataTable(
                                //dividerThickness:0.0,
                                //showBottomBorder: false,
                                columns: [
                                  // Set the name of the column
                                  DataColumn(label: Text(
                                    "Item",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  )),
                                  DataColumn(label: Text(
                                    "Target",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  )),
                                  DataColumn(label: Text(
                                    "Actual",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  )),
                                ],
                                rows:[
                                  // Set the values to the columns
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "Collection",
                                      style: TextStyle(
                                        color: Color(0xff034A8F),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    )),
                                    DataCell(Text(
                                      " 50,000 FCFA",
                                      style: TextStyle(
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),),
                                    DataCell(Text(
                                      " 50,000 FCFA",
                                      style: TextStyle(
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "Recovery",
                                      style: TextStyle(
                                        color: Color(0xff034A8F),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    )),
                                    DataCell(Text(
                                      " 50,000 FCFA",
                                      style: TextStyle(
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),),
                                    DataCell(Text(
                                      " 50,000 FCFA",
                                      style: TextStyle(
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),),
                                  ]),
                                  DataRow(cells: [
                                    DataCell(Text(
                                      "New Sales",
                                      style: TextStyle(
                                        color: Color(0xff034A8F),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    )),
                                    DataCell(Text(
                                      " 50,000 FCFA",
                                      style: TextStyle(
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),),
                                    DataCell(Text(
                                      " 50,000 FCFA",
                                      style: TextStyle(
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),),
                                  ]),
                                ]

                            ),
                          )
                        ],
                      ),
                    )
                        : Center(child: CircularProgressIndicator(),)),
                  ),

                  /*Customers*/
                  SingleChildScrollView(
                    child:
                    Obx(() => salesController.customerSalesList.value != null && salesController.customerSalesList.value!.isNotEmpty
                        ? Container(color: Color(0xFFF2F2F2),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 15),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 5, right: 5),
                                                      child: DropdownButtonFormField(
                                                        isExpanded:true,
                                                        borderRadius: BorderRadius.circular(8),
                                                        autovalidateMode:AutovalidateMode.onUserInteraction,
                                                        focusColor:Colors.black,
                                                        iconEnabledColor:Colors.black,
                                                        style: const TextStyle(
                                                            fontStyle: FontStyle.normal,
                                                            color: Colors.grey,
                                                            fontSize: 14
                                                        ),
                                                        decoration: InputDecoration(
                                                          enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                              borderSide: BorderSide(color:  Color(0xff034A8F) ),
                                                              gapPadding: 10
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                              borderSide: const BorderSide(color: Color(0xff034A8F)),
                                                              gapPadding: 10
                                                          ),
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                              borderSide: const BorderSide(color: Color(0xff034A8F)),
                                                              gapPadding: 10
                                                          ),
                                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                        ),
                                                        dropdownColor: Colors.white,
                                                        hint: Text("Select Customer"),
                                                        icon: Container(
                                                            height: 30,
                                                            margin: EdgeInsets.only(right: 2),
                                                            decoration: BoxDecoration(
                                                                color: Color(0xff034A8F).withOpacity(0.1),
                                                                borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            child: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff034A8F))
                                                        ),
                                                        isDense: true,
                                                        value: salesController.customerdisplayed.value,

                                                        onChanged: (c) {
                                                          salesController.customerdisplayed.value = c as String;
                                                          print(c);
                                                          final item = salesController.customerSalesList.value!.firstWhere((e) => e['firstname'] == c);
                                                          salesController.customer = item;
                                                          salesController.getAmountByCustumer(item["customerid"]);
                                                          salesController.getPrelemtByCust(item["customerid"].toString());
                                                        },

                                                        items: salesController.customerSalesList.value?.map((client) {
                                                          return DropdownMenuItem(
                                                            value: client['firstname'],
                                                            child: Text('${client['firstname']} ${client['lastname']}'),);
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.toNamed("add-customer");
                                                    },
                                                    child: Icon(Icons.person_add_alt, size: 25,),
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Color(0xFF074A8F),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      minimumSize:
                                                      Size(35, 45),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Get.to(
                                                          ListProduct());
                                                    },
                                                    child: Icon(Icons.shopping_cart_outlined, size: 25,),
                                                    style: ElevatedButton.styleFrom(
                                                      primary: Color(0xFF6F8C2E),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:BorderRadius.circular(8),
                                                      ),
                                                      minimumSize:
                                                      Size(20, 45),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Container(
                                              color:
                                              Color(0xFF034A8F),
                                              height: 50,
                                              width: MediaQuery.of(context).size.width,
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(left: 15),
                                              child: Text(
                                                "${salesController.customer?['firstname'] ?? "-"} ${salesController.customer?['lastname'] ?? ""}",
                                                style: TextStyle(
                                                  color: Color(
                                                      0xFFFFFFFF),
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Obx(() => salesController.amountCust.value != null ? Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
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
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(height: 20),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20,right: 20),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(color: Colors.grey,width: 1)
                                                    )
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        'Total Financed\nAmount',
                                                        style: TextStyle(
                                                          color: Color(0xFF034A8F),
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                      )
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                            NumberFormat.decimalPattern().format(salesController.amountCust.value?.totalgobal ?? 0),
                                                            style: TextStyle(
                                                              color: Color(0xFF848484),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                            ),
                                                          )
                                                      ),
                                                      IconButton(
                                                          icon: Icon(
                                                            Icons.remove_red_eye_outlined,
                                                            color: Color(0xff074A8F),
                                                            size: 25,
                                                          ),
                                                          onPressed: () {}
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20,right: 20),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(color: Colors.grey,width: 1)
                                                      )
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                            'Total Balance',
                                                            style: TextStyle(
                                                              color: Color(0xFF034A8F),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                            ),
                                                          )
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                            NumberFormat.decimalPattern().format(salesController.amountCust.value?.currentamountdue ?? 0),
                                                            style: TextStyle(
                                                              color: Color(0xFF848484),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                            ),
                                                          )
                                                      ),
                                                      IconButton(
                                                          icon: Icon(
                                                            Icons.remove_red_eye_outlined,
                                                            color: Color(0xff074A8F),
                                                            size: 25,
                                                          ),
                                                          onPressed: () {}
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(left: 20,right: 20),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom: BorderSide(color: Colors.grey,width: 1)
                                                      )
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                            'Total Repaid',
                                                            style: TextStyle(
                                                              color: Color(0xFF034A8F),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                            ),
                                                          )
                                                      ),
                                                      Expanded(
                                                          child: Text(
                                                            NumberFormat.decimalPattern().format(salesController.amountCust.value?.currenttotalrepaid ?? 0),
                                                            style: TextStyle(
                                                              color: Color(0xFF848484),
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                            ),
                                                          )
                                                      ),
                                                      IconButton(
                                                          icon: Icon(
                                                            Icons.remove_red_eye_outlined,
                                                            color: Color(0xff074A8F),
                                                            size: 25,
                                                          ),
                                                          onPressed: () {}
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                                Center(
                                                  child: Container(
                                                    height: 30,
                                                    width: MediaQuery.of(context).size.width * 0.4,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Get.to(ListProduct());
                                                      },
                                                      child:
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Text("Suscribe"),
                                                          Icon(
                                                            Icons.add_circle,
                                                            size: 25,
                                                          ),
                                                        ],
                                                      ),
                                                      style:
                                                      ElevatedButton.styleFrom(
                                                        primary: Color(0xFF6F8C2E),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15),
                                                        ),
                                                        // elevation: 5.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 20),
                                              ],
                                            ),
                                          ) :
                                          Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets
                                                  .only(
                                                  top:
                                                  30),
                                              child: Text(
                                                'No Prefinancial Found',
                                                style:
                                                TextStyle(
                                                  color: Color(
                                                      0xFF848484),
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontSize:
                                                  16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        ),

                                        //Products Details
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 50, bottom: 10),
                                          child: Text(
                                            'Products Details',
                                            style: TextStyle(
                                              color:
                                              Color(0xFF848484),
                                              fontWeight:
                                              FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),

                                        Obx(() =>
                                           salesController.custPrelement.value != null && salesController.custPrelement.value!.isNotEmpty ?
                                              Card ( elevation: 5,
                                                color: Color(0xFFDEF3FB),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                                                child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: salesController.custPrelement.value!.length,

                                                        itemBuilder: (BuildContext context, int index) {
                                                          return Card(elevation: 5,
                                                            color: Color(0xFFDEF3FB),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(12),
                                                            ),
                                                            child: Container(
                                                              height: 62,
                                                              padding: EdgeInsets.only(top: 5, left: 8, bottom: 5, right: 8),
                                                              decoration:
                                                              BoxDecoration(
                                                                color:
                                                                Color(0xFFDEF3FB),
                                                                borderRadius:
                                                                BorderRadius.circular(12),
                                                                // border: Border.all(color: Colors.grey, width: 1),
                                                              ),
                                                              child:
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        'Product Name',
                                                                        // '${data.name}',
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: 11,
                                                                          color: Color(0xFF83848B),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 10),
                                                                      Text(
                                                                        '${salesController.custPrelement.value![index].productname}',
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w700,
                                                                          fontSize: 12,
                                                                          color: Color(0xFF034A8F),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        'Financed',
                                                                        // '${data.name}',
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: 11,
                                                                          color: Color(0xFF83848B),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 10),
                                                                      Text(
                                                                        '${NumberFormat.decimalPattern().format(salesController.custPrelement.value![index].totalRe ?? 0)}',
                                                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        'Balance',
                                                                        // '${data.name}',
                                                                        style: TextStyle(
                                                                          fontWeight: FontWeight.w400,
                                                                          fontSize: 11,
                                                                          color: Color(0xFF83848B),
                                                                        ),
                                                                      ),
                                                                      SizedBox(height: 10),
                                                                      Text(
                                                                        '${NumberFormat.decimalPattern().format(salesController.custPrelement.value![index].amountDu ?? 0)}',
                                                                        // '${Pecahan.rupiah(value: data.price, withRp: true)}',
                                                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Get.to(Payment(prelementData: salesController.custPrelement.value![index],));
                                                                    },
                                                                    child: Icon(Icons.remove_red_eye_outlined, color: Color(0xFF034A8F)),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed: () {
                                                                      payModal(salesController.custPrelement.value![index]);
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                      primary: Color(0xFF034A8F),
                                                                      minimumSize: Size(30, 20),
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(7),
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Text("Pay", style: TextStyle(color: Colors.white, fontSize: 13)),
                                                                        SizedBox(width: 3),
                                                                        Icon(
                                                                          Icons.arrow_forward_ios,
                                                                          color: Colors.white,
                                                                          size: 12,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ))
                                              : Padding(padding: const EdgeInsets.only(top: 20),
                                                  child: Text(
                                                    'No Product Found',
                                                    style:
                                                    TextStyle(
                                                      color: Color(
                                                          0xFF848484),
                                                      fontWeight:
                                                      FontWeight
                                                          .w400,
                                                      fontSize:
                                                      16,
                                                    ),
                                                  ),
                                          ),
                                        ),

                                        SizedBox(height: 15),
                                      ],
                                    ),
                       )
                        : Center(child: CircularProgressIndicator(),)),
                  ),

                  /* Products*/
                  SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.only(bottom: 50),
                      child: Obx(() {
                        if ( salesController.prelemtBySaleList.value != null && salesController.prelemtBySaleList.value!.isNotEmpty ) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: salesController.prelemtBySaleList.value!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 2,
                                margin:EdgeInsets.only(bottom: 15) ,
                                color: Color(0xFFDEF3FB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /*Text(
                                        '${salesController.prelemtBySaleList.value?[index].customername}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),*/
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Product Name',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Color(0xFF83848B),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '${salesController.prelemtBySaleList.value?[index].productname}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 12,
                                                  color: Color(0xFF034A8F),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Financed',
                                                style:
                                                TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Color(0xFF83848B),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 10),
                                              Text(
                                                NumberFormat.decimalPattern().format(salesController.prelemtBySaleList.value?[index].totalRe ?? 0),
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Balance',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11,
                                                  color: Color(0xFF83848B),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 10),
                                              Text(
                                                NumberFormat.decimalPattern().format(salesController.prelemtBySaleList.value?[index].amountDu ?? 0),
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Color(0xFF6F8C2E),
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            padding: EdgeInsets.zero,
                                            enableFeedback: false,
                                            constraints: BoxConstraints.expand(width: 25,height: 25),
                                            onPressed: () {

                                              print(salesController.prelemtBySaleList.value?[index].toJson());

                                              Get.to(Payment(prelementData: salesController.prelemtBySaleList.value?[index],));

                                            },
                                            icon: Icon(
                                                Icons.remove_red_eye_outlined,
                                                color: Color(0xFF034A8F)),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              payModal(salesController.prelemtBySaleList.value![index]);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                                              primary: Color(0xFF034A8F),
                                              minimumSize: Size(20, 20),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Pay",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13
                                                    )
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Colors.white,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              // la carte en dessous represente l ancien design
                              // choisis et supprime celle qui ne te convient pas
                              return Card(
                                elevation: 5,
                                color: Color(0xFFDEF3FB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      // color: Color(0xFF034A8F),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF034A8F),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12)),
                                      ),
                                      height: 20,
                                      width: MediaQuery.of(context).size.width,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        '${salesController.prelemtBySaleList.value?[index].customername}',
                                        style: TextStyle(
                                          color:
                                          Color(0xFFFFFFFF),
                                          fontWeight:
                                          FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // width: 550,
                                      height: 55,
                                      padding: EdgeInsets.only(
                                          top: 5,
                                          left: 8,
                                          bottom: 5,
                                          right: 8),
                                      decoration: BoxDecoration(
                                        color:
                                        Color(0xFFDEF3FB),
                                        borderRadius:
                                        BorderRadius
                                            .circular(12),
                                        // border: Border.all(color: Colors.grey, width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                'Product Name',
                                                style:
                                                TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontSize: 11,
                                                  color: Color(
                                                      0xFF83848B),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 10),
                                              Text(
                                                '${salesController.prelemtBySaleList.value?[index].productname}',
                                                style:
                                                TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w700,
                                                  fontSize: 12,
                                                  color: Color(
                                                      0xFF034A8F),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                'Financed',
                                                style:
                                                TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontSize: 11,
                                                  color: Color(
                                                      0xFF83848B),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 10),
                                              Text(
                                                NumberFormat.decimalPattern().format(salesController.prelemtBySaleList.value?[index].totalRe ?? 0),
                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Balance',
                                                style:
                                                TextStyle(
                                                  fontWeight:
                                                  FontWeight
                                                      .w400,
                                                  fontSize: 11,
                                                  color: Color(
                                                      0xFF83848B),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 10),
                                              Text(
                                                NumberFormat
                                                    .decimalPattern()
                                                    .format(salesController.prelemtBySaleList.value?[index].amountDu ?? 0),
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    fontSize:
                                                    12),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {

                                              print(salesController.prelemtBySaleList.value?[index].toJson());

                                              Get.to(Payment(prelementData: salesController.prelemtBySaleList.value?[index],));

                                            },
                                            child: Icon(
                                                Icons
                                                    .remove_red_eye_outlined,
                                                color: Color(
                                                    0xFF034A8F)),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              payModal(salesController.prelemtBySaleList.value![index]);
                                            },
                                            style:
                                            ElevatedButton
                                                .styleFrom(
                                              primary: Color(
                                                  0xFF034A8F),
                                              minimumSize:
                                              Size(30, 20),
                                              shape:
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    7),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text("Pay",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                        13)),
                                                SizedBox(
                                                    width: 3),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios,
                                                  color: Colors
                                                      .white,
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }


  payModal(PrelementModel prelvalue){
    Get.bottomSheet(
      backgroundColor: Colors.black.withOpacity(0.1),
      elevation: 2,
      isDismissible: false,
      enableDrag: false,
      persistent: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
      ),
      Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
          ),
          child:SingleChildScrollView(
            child: Form(
              key: salesController.payFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 25),
                  Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 20),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      color: Color(0xFF034A8F),
                      child: Obx(() {
                        if(salesController.activeStep.value == 0){
                          return Text(
                            '${prelvalue.customername}',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          );
                        }else{
                          return Text(
                            'PAYMENT CONFIRMATION',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          );
                        }
                        })
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Expanded(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Obx(() {
                                  return IndexedStack(
                                    index: salesController.activeStep.value,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 15 ),
                                          Text(
                                            prelvalue.descr.toString(),
                                            style: TextStyle(
                                              color: Color(0xFF034A8F),
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(height: 15 ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Container(
                                                    height: 60,
                                                    padding: EdgeInsets.only(left: 15),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xFF034A8F), width: 1),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Financed Amount',
                                                          style: TextStyle(
                                                            color: Color(0xFF000000),
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 14,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          NumberFormat.decimalPattern()
                                                              .format(prelvalue.totalRe ?? 0),
                                                          style: TextStyle(
                                                            color: Color(0xFF034A8F),
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 18,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: Container(
                                                    height: 60,
                                                    padding: EdgeInsets.only(left: 15),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xFF034A8F), width: 1),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          'Current Balance',
                                                          style: TextStyle(
                                                            color: Color(0xFF000000),
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 14,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          NumberFormat.decimalPattern()
                                                              .format(prelvalue.amountDu ?? 0),
                                                          style: TextStyle(
                                                            color: Color(0xFF6F8C2E),
                                                            fontWeight: FontWeight.w700,
                                                            fontSize: 18,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 15 ),
                                          Text(
                                            'Payment Method',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 15 ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Radio(
                                                        activeColor: Color(0xFF034A8F),
                                                        groupValue: salesController.payMethodCtrl,
                                                        value: 'Cash',
                                                        onChanged: (value) {
                                                          print(value);
                                                          setState(() {
                                                            salesController.payMethodCtrl = value;
                                                          });
                                                        },
                                                      ),
                                                      Image.asset(
                                                        'assets/icon/money-illustration.png',
                                                        height: 40,
                                                        width: 40,
                                                        fit: BoxFit.cover,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Radio(
                                                        activeColor: Color(0xFF034A8F),
                                                        groupValue: salesController.payMethodCtrl,
                                                        value: 'MTN Mobile Money',
                                                        onChanged: (value) {
                                                          print(value);
                                                          setState(() {
                                                            salesController.payMethodCtrl = value;
                                                          });
                                                        },
                                                      ),
                                                      Image.asset(
                                                        'assets/icon/mtn-mobile-money.png',
                                                        height: 40,
                                                        width: 40,
                                                        fit: BoxFit.cover,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Radio(
                                                        activeColor: Color(0xFF034A8F),
                                                        groupValue: salesController.payMethodCtrl,
                                                        value: 'Orange Mobile Money',
                                                        onChanged: (value) {
                                                          print(value);
                                                          setState(() {
                                                            salesController.payMethodCtrl = value;
                                                          });
                                                        },
                                                      ),
                                                      Image.asset(
                                                        'assets/icon/orange-money.png',
                                                        height: 40,
                                                        width: 40,
                                                        fit: BoxFit.cover,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 15 ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: Get.width*0.7,
                                                child: DropdownButtonFormField(
                                                  isExpanded:true,
                                                  borderRadius: BorderRadius.circular(8),
                                                  autovalidateMode:AutovalidateMode.onUserInteraction,
                                                  focusColor:Colors.black,
                                                  iconEnabledColor:Colors.black,
                                                  style: const TextStyle(
                                                      fontStyle: FontStyle.normal,
                                                      color: Colors.grey,
                                                      fontSize: 14
                                                  ),
                                                  decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                        borderSide: BorderSide(color:  Color(0xff034A8F) ),
                                                        gapPadding: 10
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                        borderSide: const BorderSide(color: Color(0xff034A8F)),
                                                        gapPadding: 10
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(8),
                                                        borderSide: const BorderSide(color: Color(0xff034A8F)),
                                                        gapPadding: 10
                                                    ),
                                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                  ),
                                                  dropdownColor: Colors.white,
                                                  hint: Text("Type"),
                                                  icon: Container(
                                                      height: 30,
                                                      margin: EdgeInsets.only(right: 2),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xff034A8F).withOpacity(0.1),
                                                          borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      child: Icon(Icons.keyboard_arrow_down_outlined,color: Color(0xff034A8F))
                                                  ),
                                                  isDense: true,
                                                  validator: (value) => value == null ? "Please select an option" : null,
                                                  value: salesController.typePayCtrl,
                                                  onChanged: (String? newValue) {
                                                    print(newValue);
                                                    setState(() {
                                                      salesController.typePayCtrl = newValue!;
                                                    });
                                                  },
                                                  items: <String>[
                                                    'Repayment',
                                                    'Initial Deposit',
                                                    'Registration Fee'
                                                  ].map<DropdownMenuItem<String>>((String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(fontSize: 20),
                                                      ),
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                width: Get.width*0.7,
                                                child: TextFormField(
                                                  controller: salesController.pVerseCtrl,
                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter.digitsOnly
                                                  ],
                                                  validator: (value) {
                                                    if (value == null || value.isEmpty) {
                                                      return 'Please enter Amount';
                                                    }
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Amount',
                                                    contentPadding: EdgeInsets.only(left: 10, top: 11),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xFF034A8F), width: 1),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.red, width: 1),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Color(0xFF034A8F), width: 1),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  // Set the values to the columns
                                                  DataRow(cells: [
                                                    DataCell(Text(
                                                      "Product Name :",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      prelvalue.descr??"",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Text(
                                                      "Customer Name :",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      '${prelvalue.customername}',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Text(
                                                      "Payment Type :",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      salesController.typePayCtrl??"",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Text(
                                                      "Amount :",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      salesController.pVerseCtrl.text,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Text(
                                                      "Payment Method :",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      salesController.payMethodCtrl??"",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),),
                                                  ]),
                                                  DataRow(cells: [
                                                    DataCell(Text(
                                                      "Payment Date :",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                                    DataCell(Text(
                                                      df.format(new DateTime.now()),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                      ),
                                                    ),),
                                                  ]),
                                                ]

                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  );
                                }
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () async {
                                  Get.back();
                                },
                                child: Container(
                                  height: 50,
                                  color: Color(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Color(0xFFF93A3A),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(() {
                              if(salesController.activeStep.value == 0){
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () async {
                                      if (salesController.payFormKey.currentState!.validate()) {
                                        salesController.activeStep.value = 1;
                                        salesController.payFormKey.currentState!.save();
                                      }
                                    },
                                    child:  Container(
                                      height: 50,
                                      color: Color(0xFF034A8F),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }else{
                                return Expanded(
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () async {
                                      await salesController.createPayment();
                                    },
                                    child:  Container(
                                      height: 50,
                                      color: Color(0xFF034A8F),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Pay',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }

                            }),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      )
    );
  }
}
