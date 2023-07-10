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

  late TabController tabCtrl = TabController(length: 2, vsync: this);

  SalesController salesController = Get.put(SalesController());

  AmountCustomerModel? idCustom;
  PrelementModel? prelement;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this);
    salesController.getAmountBySale();
  }



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
          title: Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Image.asset(
              'assets/logo/home_logo.png',
              height: 35,
              fit: BoxFit.cover,
            ),
          ),
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        extendBody: true,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if ( salesController.prefinanceData.value != null ) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(30, 30),
                        bottomRight: Radius.elliptical(30, 30),
                      ),
                      color: Color(0xFFE8F5FF),
                    ),
                    child: Column(
                      children: [
                        // SizedBox(height: 15),
                        // SearchBar(),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              Text(
                                NumberFormat.decimalPattern().format(salesController.prefinanceData.value?.totalFinanced ?? 0),
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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    height: 60,
                                    width: 155,
                                    padding:
                                    EdgeInsets.only(left: 10, right: 10),
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
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    height: 60,
                                    width: 156,
                                    padding:
                                    EdgeInsets.only(left: 10, right: 10),
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
                              ],
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    height: 60,
                                    width: 155,
                                    padding:
                                    EdgeInsets.only(left: 10, right: 10),
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
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    height: 60,
                                    width: 155,
                                    padding:
                                    EdgeInsets.only(left: 10, right: 10),
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
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),

              SizedBox(height: 10),
              Container(
                child: TabBar(
                  controller: tabCtrl,
                  labelColor: Color(0xFF6F8C2E),
                  unselectedLabelColor: Color(0xFF1A1A27),
                  tabs: const [
                    Tab(
                      text: 'Customers',
                    ),
                    Tab(
                      text: 'Products',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(controller: tabCtrl, children: [

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
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .only(
                                                      left: 5,
                                                      right: 5),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width /
                                                        1.7,
                                                    child: Card(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(borderRadius:
                                                          BorderRadius.circular(8)),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            left: 15,
                                                            top: 10,
                                                            bottom:
                                                            10),
                                                        child: DropdownButton(underline: Container(),
                                                                hint: Text("Select Customer"),
                                                                icon: const Icon(Icons.keyboard_arrow_down),
                                                                isDense: true,
                                                                isExpanded: true,
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
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Get.toNamed("add-customer");
                                                  },
                                                  child: Icon(Icons.person_add_alt, size: 25,),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Color(
                                                        0xFF074A8F),
                                                    shape:
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          8),
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
                                                  child: Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
                                                    size: 25,
                                                  ),
                                                  style:
                                                  ElevatedButton
                                                      .styleFrom(
                                                    primary: Color(
                                                        0xFF6F8C2E),
                                                    shape:
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(
                                                          8),
                                                    ),
                                                    minimumSize:
                                                    Size(20, 45),
                                                  ),
                                                ),
                                              ],
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
                                            height: 220,
                                            margin: EdgeInsets.only(
                                                left:
                                                10,
                                                right:
                                                10),
                                            decoration: BoxDecoration(
                                                color: Color(
                                                    0xFFFFFFFF),
                                                borderRadius:
                                                BorderRadius.circular(
                                                    14),
                                                border: Border.all(
                                                    color: Color(
                                                        0xFFC4C4C4),
                                                    width:
                                                    1)),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                // table
                                                SingleChildScrollView(
                                                  scrollDirection:
                                                  Axis.horizontal,
                                                  child: DataTable(
                                                    // columnSpacing: 50,
                                                      headingRowHeight: 0,
                                                      columns: [
                                                        DataColumn(label: Text('',),),
                                                        DataColumn(label: Text('')),
                                                        DataColumn(label: Text(''),)
                                                      ],
                                                      rows: [
                                                        DataRow(cells: [
                                                          DataCell(
                                                            Text(
                                                              'Total Financed Amount',
                                                              style: TextStyle(
                                                                color: Color(0xFF034A8F),
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(
                                                              NumberFormat.decimalPattern().format(salesController.amountCust.value?.totalgobal ?? 0),
                                                              style: TextStyle(
                                                                color: Color(0xFF848484),
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(''),
                                                            //     color: Color(0xFF034A8F)),
                                                          )
                                                        ]),
                                                        DataRow(cells: [
                                                          DataCell(
                                                            Text(
                                                              'Total Balance',
                                                              style: TextStyle(
                                                                color: Color(0xFF034A8F),
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(
                                                              NumberFormat.decimalPattern().format(salesController.amountCust.value?.currentamountdue ?? 0),
                                                              style: TextStyle(
                                                                color: Color(0xFF848484),
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(''),
                                                          )
                                                        ]),
                                                        DataRow(cells: [
                                                          DataCell(
                                                            Text(
                                                              'Total Repaid',
                                                              style: TextStyle(
                                                                color: Color(0xFF000000),
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(
                                                              NumberFormat.decimalPattern().format(salesController.amountCust.value?.currenttotalrepaid ?? 0),
                                                              style: TextStyle(
                                                                color: Color(0xFF848484),
                                                                fontWeight: FontWeight.w700,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                          DataCell(
                                                            Text(''),
                                                          )
                                                        ]),
                                                      ]
                                                    // )
                                                    //     .toList(),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                  10,
                                                ),
                                                Center(
                                                  child:
                                                  Container(
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
                                                        primary:
                                                        Color(0xFF6F8C2E),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(15),
                                                        ),
                                                        // elevation: 5.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                              : Column(
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
                                          const EdgeInsets.only(
                                              top: 50,
                                              bottom: 10),
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
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(12),
                                                            ),
                                                            child: Container(
                                                              // width: 550,
                                                              height:
                                                              62,
                                                              padding: EdgeInsets.only(
                                                                  top:
                                                                  5,
                                                                  left:
                                                                  8,
                                                                  bottom:
                                                                  5,
                                                                  right:
                                                                  8),
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
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Obx(() {
                              if ( salesController.prelemtBySaleList.value != null && salesController.prelemtBySaleList.value!.isNotEmpty ) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: salesController.prelemtBySaleList.value!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Card(
                                      elevation: 5,
                                      color: Color(0xFFDEF3FB),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            // color: Color(0xFF034A8F),
                                            decoration: BoxDecoration(
                                              color:
                                              Color(0xFF034A8F),
                                              borderRadius:
                                              BorderRadius.only(
                                                  topLeft: Radius
                                                      .circular(
                                                      12),
                                                  topRight: Radius
                                                      .circular(
                                                      12)),
                                            ),
                                            height: 20,
                                            width:
                                            MediaQuery.of(context)
                                                .size
                                                .width,
                                            alignment:
                                            Alignment.centerLeft,
                                            padding: EdgeInsets.only(
                                                left: 15),
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
                            }),
                          ),
                        ),
                      ],
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

  Widget SearchBar() {
    return const Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
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
              ),
            ),
            hintText: 'Search product ...',
            //8AA0BC
            suffixIcon: Align(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Icon(
                Icons.tune,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future payModal(PrelementModel prelvalue) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) {
          return Form(
            key: salesController.payFormKey,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF034A8F),
                      padding: EdgeInsets.only(left: 20, top: 10),
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        prelvalue.descr.toString(),
                        // 'Florence',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      )),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          '${prelvalue.customername}',
                          // 'BAJAJ M150 Motorbike',
                          style: TextStyle(
                            color: Color(0xFF034A8F),
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 65,
                              width: 155,
                              padding: EdgeInsets.only(left: 10, right: 10),
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
                                    'Financed Amount',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
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
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: 60,
                              width: 155,
                              padding: EdgeInsets.only(left: 10, right: 10),
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
                                    'Current Balance',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
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
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text('Channel'),
                  ),
                  Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: RadioListTile(
                              title: Text('Cash'),
                              activeColor: Color(0xFF034A8F),
                              dense: true,
                              groupValue: salesController.payMethodCtrl,
                              value: 'Cash',
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  salesController.payMethodCtrl = value;
                                });
                              },
                            )),
                        Flexible(
                            flex: 1,
                            child: RadioListTile(
                              title: Text('MoMo',maxLines: 1,overflow: TextOverflow.ellipsis,),
                              activeColor: Color(0xFF034A8F),
                              dense: true,
                              groupValue: salesController.payMethodCtrl,
                              value: 'MoMo',
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  salesController.payMethodCtrl = value;
                                });
                              },
                            )),
                        Flexible(
                            flex: 1,
                            child: RadioListTile(
                              title: Text('OM'),
                              activeColor: Color(0xFF034A8F),
                              dense: true,
                              groupValue: salesController.payMethodCtrl,
                              value: 'OM',
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  salesController.payMethodCtrl = value;
                                });
                              },
                            ))
                      ]),
                  Column(
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        alignment: Alignment.centerLeft,
                        child: DropdownButtonFormField(
                          itemHeight: kMinInteractiveDimension,
                          isDense: false,
                          decoration: InputDecoration(
                            hintText: 'Repayment',
                            hintStyle: TextStyle(),
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsets.only(left: 10, top: 6, bottom: 5),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF034A8F), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF034A8F), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                          ),
                          validator: (value) =>
                              value == null ? "Please select an option" : null,
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
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 300,
                        alignment: Alignment.centerLeft,
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
                              borderSide: BorderSide(
                                  color: Color(0xFF034A8F), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF034A8F), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                            color: Color(0xFF034A8F),
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () async {
                                if (salesController.payFormKey.currentState!
                                    .validate()) {
                                  await salesController.createPayment();
                                  salesController.payFormKey.currentState!.save();
                                }
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            )),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Color(0xFFFFFFFF),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
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
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
