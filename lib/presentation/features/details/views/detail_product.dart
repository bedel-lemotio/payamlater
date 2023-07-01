import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:payamlater/presentation/features/salesperson/home/model/productPrefinancialModel.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../product/controller/listP_controller.dart';
import '../../product/model/product_model.dart';
import '../../salesperson/home/controller/sales_controller.dart';
import '../controller/details_controller.dart';
import '../model/customers.dart';
import '../model/frequency.dart';
import '../model/payment.dart';

class ProductDetails extends StatefulWidget {
  ProductPrefinancialModel? productPrefinancialModel;
  ProductDetails( {this.productPrefinancialModel,Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentIndexColor = 0;
  int index = 0;

  final selectId = [];
  int itemCount = 0;

  ProductController productController = Get.put(ProductController());
  DetailController detailController = Get.put(DetailController());
  SalesController salesController = Get.put(SalesController());


  late List select;
  int selectPayId = 1;
  final currencyE = NumberFormat("#,###", "en_US");
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          padding: EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          "Details",
          style: TextStyle(
            color: Color(0xFF1B1D3B),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //       icon: Align(
        //         widthFactor: 1.0,
        //         heightFactor: 1.0,
        //         child: CircleAvatar(
        //           radius: 15,
        //           backgroundColor: Color(0xFF009FE3),
        //           child: Icon(
        //             Icons.favorite,
        //             color: Color(0xFF034A8F),
        //             // size: 20,
        //           ),
        //         ),
        //       ),
        //       onPressed: () {}),
        // ],
      ),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        // height: 60,
                        // width: 150,
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: _currentIndexColor == 0
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/images/moto.png',
                                    height: 85, width: 100, fit: BoxFit.fill),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/images/moto.png',
                                    height: 85, width: 100, fit: BoxFit.fill),
                              ),
                      );
                    })),
            Expanded(
              flex: 5,
              child: FutureBuilder<ProductModel?>(
                  future: detailController.getProductById(),
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(36),
                                  topRight: Radius.circular(36)),
                            ),
                            padding:
                                EdgeInsets.only(left: 20, top: 10, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                _currentIndexColor = index;
                                              });
                                            },
                                            child: Container(
                                              height: 60,
                                              margin: EdgeInsets.only(right: 8),
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: index ==
                                                          _currentIndexColor
                                                      ? Colors.deepOrange
                                                      : Color.fromARGB(
                                                          255, 173, 173, 173),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Image.asset(
                                                  "assets/images/moto.png",
                                                  height: 52,
                                                  width: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 80,
                                      width: 180,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          '${data?.nameProd}',
                                          style: TextStyle(
                                            color: Color(0xFF808080),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 30, right: 20),
                                      child: Text(
                                        "${NumberFormat.decimalPattern().format(data?.price ?? 0)} ",
                                        style: TextStyle(
                                          color: Color(0xFF034A8F),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Icon(
                                //       Icons.star,
                                //       color: Colors.yellow[800],
                                //       size: 20,
                                //     ),
                                //     Icon(
                                //       Icons.star,
                                //       color: Colors.yellow[800],
                                //       size: 20,
                                //     ),
                                //     Icon(
                                //       Icons.star,
                                //       color: Colors.yellow[800],
                                //       size: 20,
                                //     ),
                                //     Icon(
                                //       Icons.star_border,
                                //       color: Colors.yellow[800],
                                //       size: 20,
                                //     ),
                                //     Icon(
                                //       Icons.star_border,
                                //       color: Colors.yellow[800],
                                //       size: 20,
                                //     ),
                                //   ],
                                // ),
                                // Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     children: [
                                //       // Container(
                                //       //   height: 40,
                                //       //   width: 134,
                                //       //   decoration: BoxDecoration(
                                //       //       color: Color.fromARGB(
                                //       //           231, 232, 231, 231),
                                //       //       borderRadius:
                                //       //           BorderRadius.circular(24)),
                                //       //   child: Row(
                                //       //     mainAxisAlignment:
                                //       //         MainAxisAlignment.spaceEvenly,
                                //       //     children: [
                                //       //       InkWell(
                                //       //         onTap: (() {
                                //       //           setState(() {
                                //       //             itemCount++;
                                //       //           });
                                //       //         }),
                                //       //         child: Icon(
                                //       //           Icons.add_circle_outline,
                                //       //           color: Colors.yellow[800],
                                //       //           size: 30,
                                //       //         ),
                                //       //       ),
                                //       //       SizedBox(
                                //       //         width: 12,
                                //       //       ),
                                //       //       Text(
                                //       //         "1",
                                //       //         // "$itemCount",
                                //       //         style: TextStyle(
                                //       //             fontSize: 18,
                                //       //             fontWeight: FontWeight.bold,
                                //       //             color: Colors.black),
                                //       //       ),
                                //       //       SizedBox(
                                //       //         width: 12,
                                //       //       ),
                                //       //       InkWell(
                                //       //         onTap: () {
                                //       //           setState(() {
                                //       //             if (itemCount > 0)
                                //       //               itemCount--;
                                //       //           });
                                //       //         },
                                //       //         child: Icon(
                                //       //           Icons.remove_circle_outline,
                                //       //           color: Colors.yellow[800],
                                //       //           size: 30,
                                //       //         ),
                                //       //       ),
                                //       //     ],
                                //       //   ),
                                //       // ),
                                //       Row(
                                //         children: [
                                //           Icon(
                                //             Icons.star,
                                //             color: Colors.yellow[800],
                                //             size: 20,
                                //           ),
                                //           Icon(
                                //             Icons.star,
                                //             color: Colors.yellow[800],
                                //             size: 20,
                                //           ),
                                //           Icon(
                                //             Icons.star,
                                //             color: Colors.yellow[800],
                                //             size: 20,
                                //           ),
                                //           Icon(
                                //             Icons.star_border,
                                //             color: Colors.yellow[800],
                                //             size: 20,
                                //           ),
                                //           Icon(
                                //             Icons.star_border,
                                //             color: Colors.yellow[800],
                                //             size: 20,
                                //           ),
                                //         ],
                                //       ),
                                //       Padding(
                                //         padding: EdgeInsets.only(right: 20),
                                //         child: Column(
                                //           mainAxisAlignment:
                                //               MainAxisAlignment.center,
                                //           crossAxisAlignment:
                                //               CrossAxisAlignment.start,
                                //           children: [
                                //             Text(
                                //               "Total price",
                                //               style: TextStyle(
                                //                   color: Color(0xFF3C3C3C),
                                //                   fontSize: 12,
                                //                   fontWeight: FontWeight.w400),
                                //             ),
                                //             SizedBox(
                                //               height: 5,
                                //             ),
                                //             Text(
                                //               currencyE.format(data?.price ?? 0),
                                //               style: TextStyle(
                                //                   color: Color(0xFF3C3C3C),
                                //                   fontSize: 19,
                                //                   fontWeight: FontWeight.w600),
                                //             )
                                //           ],
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                //Expandable List
                                SingleChildScrollView(
                                  child: Form(
                                    key: detailController.prefinanceFormKey,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    child: Column(
                                      children: [
                                        ExpansionTile(
                                            childrenPadding:
                                                EdgeInsets.all(5.0),
                                            title: Text(
                                              'Product Description',
                                              style: TextStyle(
                                                  color: Color(0xFF3C3C3C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            children: <Widget>[
                                              Container(
                                                  child: Text(
                                                data?.description ??
                                                    'no description',
                                                textAlign: TextAlign.justify,
                                              )),
                                            ]),
                                        /*Additional offer ok*/
                                        FutureBuilder<List<ProductModel?>?>(
                                            future: detailController
                                                .getProductByAccess(),
                                            builder: (context, snapshot) {
                                              List<ProductModel?> access =
                                                  snapshot.data ?? [];
                                              return ExpansionTile(
                                                  childrenPadding:
                                                      const EdgeInsets.all(5.0),
                                                  title: Text(
                                                    'Additional offer',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF3C3C3C),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 80,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              access.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int ind) {
                                                            return Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Radio(
                                                                      activeColor:
                                                                          Color(
                                                                              0xFF6F8C2E),
                                                                      value: access[ind],
                                                                      toggleable: true,
                                                                      groupValue: detailController.prodAcess,
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(() {
                                                                          detailController.prodAcess = value;
                                                                          print(detailController.prodAcess?.nameProd);
                                                                            });
                                                                      },
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            '${access.isNotEmpty ? access[ind]?.nameProd : 'no name'}'
                                                                            // "GPS",
                                                                            ),
                                                                        Text(
                                                                            access.isNotEmpty
                                                                                ? currencyE.format(access[ind]?.price)
                                                                                : 'no price'
                                                                          // "50 000 Fcfa",
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                    )
                                                  ]);
                                            }),
                                        /*Pay Plan ok*/
                                        FutureBuilder<List<PayPlanModel?>?>(
                                            future: detailController
                                                .getProductPayPlan(),
                                            builder: (context, snapshot) {
                                              List<PayPlanModel?> payment =
                                                  snapshot.data ?? [];
                                              if (snapshot.hasData) {
                                                return ExpansionTile(
                                                    childrenPadding:
                                                        EdgeInsets.all(4.0),
                                                    title: Text(
                                                      'Choose your Stay Plan',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF3C3C3C),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 200,
                                                        width: 200,
                                                        child: ListView.builder(
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                payment.length,
                                                            itemBuilder: (BuildContext
                                                                        context,
                                                                    int id) =>
                                                                id <
                                                                        payment
                                                                            .length
                                                                    ? Padding(
                                                                        padding:
                                                                            EdgeInsets.all(3.0),
                                                                        child: Container(
                                                                            height: 38,
                                                                            width: 263,
                                                                            padding: EdgeInsets.only(left: 10),
                                                                            decoration: BoxDecoration(
                                                                              color: Color(0xFFFFFFFF),
                                                                              borderRadius: BorderRadius.circular(16),
                                                                              border: Border.all(color: Colors.black, width: 1),
                                                                            ),
                                                                            child: Row(
                                                                              children: [
                                                                                Radio(
                                                                                  groupValue: detailController.prodPay,
                                                                                  activeColor: Color(0xFF6F8C2E),
                                                                                  value: payment[id],
                                                                                  onChanged: (value) {
                                                                                    setState(() {
                                                                                      detailController.prodPay = value;
                                                                                      print(detailController.prodPay?.number);
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'From ${payment[id]?.details ?? ''} Fcfa/mo.',
                                                                                      // 'From 92 500 Fcfa / mo.',
                                                                                      style: TextStyle(color: Color(0xFF3C3C3C), fontSize: 10, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                    Text(
                                                                                      '${payment[id]?.number} ${payment[id]?.type}',
                                                                                      // '6 months',
                                                                                      style: TextStyle(color: Color(0xFF3C3C3C), fontSize: 13, fontWeight: FontWeight.w600),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            )),
                                                                      )
                                                                    : Text(
                                                                        'data')
                                                            // },
                                                            ),
                                                      ),
                                                    ]);
                                              } else if (snapshot.hasError) {
                                                return Text("${snapshot.error}",
                                                    style: TextStyle(
                                                        fontSize: 15));
                                              }
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }),
                                        /*Frequency payment ok*/
                                        FutureBuilder<List<FreqPlanModel?>?>(
                                            future: detailController
                                                .getProductFreqPlan(),
                                            builder: (context, snapshot) {
                                              List<FreqPlanModel?> frequency =
                                                  snapshot.data ?? [];
                                              return ExpansionTile(
                                                  childrenPadding:
                                                      const EdgeInsets.all(4.0),
                                                  title: Text(
                                                    'Choose your Repayment Frequency',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF3C3C3C),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  children: <Widget>[
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3.0),
                                                      child: StaggeredGridView
                                                          .countBuilder(
                                                        padding:
                                                            EdgeInsets.all(0),
                                                        crossAxisCount: 3,
                                                        itemCount:
                                                            frequency.length,
                                                        crossAxisSpacing: 10,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        mainAxisSpacing: 0.0,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Container(
                                                              height: 38,
                                                              width: 105,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                                border: Border.all(
                                                                    color: Color(
                                                                        0xFFCDCDCD),
                                                                    width: 1),
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Radio(
                                                                    groupValue: detailController.prodFreq,
                                                                    activeColor:
                                                                        Color(
                                                                            0xFF6F8C2E),
                                                                    value: frequency[index],
                                                                    onChanged:
                                                                        (value) {
                                                                      setState(
                                                                          () {
                                                                            detailController.prodFreq = value;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    frequency[index]
                                                                            ?.name ??
                                                                        'no name',
                                                                    // 'Daily',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xFF3C3C3C),
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ],
                                                              ));
                                                        },
                                                        staggeredTileBuilder:
                                                            (index) =>
                                                                StaggeredTile
                                                                    .fit(1),
                                                      ),
                                                    ),
                                                  ]);
                                            }),
                                        /*Select Customer*/
                                        FutureBuilder<CustomersModel?>(
                                          future: detailController.getAllClient(),
                                          builder: (context, snapshot) {
                                            return Container(
                                              child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      if (detailController.allClient.isEmpty)
                                                        const Center(
                                                            child:
                                                            CircularProgressIndicator())
                                                      else
                                                        Card(
                                                          color:
                                                          Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.circular(8)),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                                                            child: DropdownButton(
                                                                underline: Container(),
                                                                hint: Text("Select Customer"),
                                                                icon: const Icon(Icons
                                                                    .keyboard_arrow_down),
                                                                isDense: true,
                                                                isExpanded: true,
                                                                items: detailController.allClient
                                                                    .map((custom) {
                                                                  return DropdownMenuItem(
                                                                      value:
                                                                      custom["firstname"],
                                                                      child: Text(
                                                                          '${custom["firstname"].toString()} ${custom["lastname"].toString()}'));
                                                                }).toList(),
                                                                value: detailController.customers,
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    detailController.customers = value! as String?;
                                                                    detailController.isCustomerSelected = true;

                                                                  });
                                                                }),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                            );
                                          },
                                        ),
                                        /*Minimum amount*/
                                        ExpansionTile(
                                            childrenPadding:
                                                const EdgeInsets.all(4.0),
                                            title: Text(
                                              'Minimum amount you wish to pay',
                                              style: TextStyle(
                                                  color: Color(0xFF3C3C3C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            children: <Widget>[
                                              SizedBox(
                                                height: 40,
                                                child: TextFormField(
                                                  // initialValue: NumberFormat.decimalPattern().format((data?.price ?? 0)/ 2),
                                                  controller: detailController.avanceCtrl,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.blue,
                                                              width: 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    fillColor: Colors.grey,
                                                    hintText: NumberFormat.decimalPattern().format((data?.price ?? 0)/ 2),
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "verdana_regular",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),),
                                              ),
                                            ]),
                                        /*Weekly amount*/
                                        ExpansionTile(
                                            childrenPadding:
                                                const EdgeInsets.all(4.0),
                                            title: Text(
                                              'Weekly or monthly amount of payment',
                                              style: TextStyle(
                                                  color: Color(0xFF3C3C3C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            children: <Widget>[
                                              SizedBox(
                                                height: 40,
                                                child: TextFormField(
                                                  // initialValue: NumberFormat.decimalPattern().format((data?.price ?? 0)/ 2),
                                                  controller: detailController.weeklyCtrl,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  decoration: InputDecoration(
                                                    focusColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 10, top: 5),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.blue,
                                                              width: 1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    fillColor: Colors.grey,
                                                    hintText: NumberFormat.decimalPattern().format((data?.price ?? 0)/ 2),
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 16,
                                                      fontFamily:
                                                          "verdana_regular",
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),),
                                              ),
                                            ]),
                                        /*Subscription date*/
                                        ExpansionTile(
                                            childrenPadding:
                                                const EdgeInsets.all(4.0),
                                            title: Text(
                                              'Enter subscription start date',
                                              style: TextStyle(
                                                  color: Color(0xFF3C3C3C),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            children: <Widget>[
                                              SizedBox(
                                                height: 40,
                                                child: TextFormField(
                                                  controller: detailController
                                                      .startDateCtrl,
                                                  readOnly: true,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please enter date';
                                                    }
                                                    return null;
                                                  },
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(2023),
                                                            lastDate:
                                                                DateTime(2101));

                                                    if (pickedDate != null) {
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(
                                                                  pickedDate);

                                                      setState(() {
                                                        detailController
                                                                .startDateCtrl
                                                                .text =
                                                            formattedDate;
                                                        print(
                                                            'date: ${detailController.startDateCtrl.text}');
                                                      });
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        '${today.year}-${today.month}-${today.day}',
                                                    suffixIcon: Icon(
                                                        Icons.calendar_month),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 10, top: 11),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF034A8F),
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF034A8F),
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: double.infinity,
                            padding: EdgeInsets.only(bottom: 30),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    recapPay();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF034A8F),
                                    minimumSize: Size(228, 46),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Proceed to Payment",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            // Container(
            //   height: 80,
            //   width: double.infinity,
            //   child: Row(
            //     // crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () {},
            //         style: ElevatedButton.styleFrom(
            //           primary: Color(0xFF034A8F),
            //           minimumSize: Size(228, 46),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //         ),
            //         child: Row(
            //           children: [
            //             Text("Proceed to Payment",
            //                 style:
            //                 TextStyle(color: Colors.white, fontSize: 16)),
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  buildProductList() {
    return Container(
      height: 50.0,
      color: Colors.orange,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          // Map furniture = furnitures.reversed.toList()[index];

          return productItem(
              // furniture: furniture,
              );
        },
      ),
    );
  }

  productItem() {

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          onTap: () {

          },
          child: Container(
            height: 33,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/moto1.jpeg",
                height: 52,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }
  }

  Future recapPay() {
    var prodName = <ProductModel?>[];
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFF034A8F),
                    padding: EdgeInsets.only(left: 50, top: 10),
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'prefinancial confirmation'.toUpperCase(),
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    )),
                ListTile(
                  title: Text(
                    'Product Name',
                    style: TextStyle(
                      color: Color(0xFF034A8F),
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text(
                      '${prodName.isNotEmpty ? prodName[0]?.nameProd : ''}'),
                ),
                ListTile(
                  title: Text('Accessoires',
                    style: TextStyle(
                      // color: Color(0xFF034A8F),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text(
                      '${detailController.prodAcess?.nameProd}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Stay Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text('${detailController.prodPay?.number} ${detailController.prodPay?.type}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Repayment Frequency',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text('${detailController.prodFreq?.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Customer Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text('${detailController.customers}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('First Deposit Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text(detailController.avanceCtrl.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Weekly or monthly amount of payment',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text(detailController.weeklyCtrl.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Subscription Start Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  dense: true,
                  visualDensity: VisualDensity(vertical: -3),
                  subtitle: Text(detailController.startDateCtrl.text,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        color: Color(0xFF034A8F),
                        width: 196,
                        child: TextButton(
                          onPressed: () {
                            detailController.addPrefinancial();
                          },
                          child: Text(
                            'Proceed',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        )),
                    Container(
                      color: Color(0xFFFFFFFF),
                      width: 196,
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
                  ],
                ),
              ],
            ),
          );
        });
  }
}
