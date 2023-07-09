import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:payamlater/presentation/features/salesperson/home/model/productPrefinancialModel.dart';

import '../controller/sales_controller.dart';
import '../model/calendar.dart';
import '../model/payment.dart';
import '../model/prelementModel.dart';
import '../model/productAccessoireModel.dart';
import 'home_salesperson.dart';

class Payment extends StatefulWidget {
  final PrelementModel? prelementData;
  const Payment({Key? key, this.prelementData}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> with SingleTickerProviderStateMixin {
  List<String> listImage = [];
  int selectedSliderPosition = 0;
  late TabController tabCtrl = TabController(length: 2, vsync: this);

  SalesController salesController = Get.put(SalesController());

  late List<PaymentModel> pay = [];
  bool _expanded = false;

  @override
  void initState() {
    salesController.getPrelemtByElemt(widget.prelementData!.idprelement.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if ( salesController.currentPrelementDetails.value != null ) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            brightness: Brightness.dark,
            elevation: 0,
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
                  Get.off(SalesDashBoard());
                  // Navigator.pop(context);
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '${salesController.currentPrelementDetails.value?.productname}',
                style: TextStyle(
                  color: Color(0xFF1B1D3B),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            centerTitle: true,
          ),
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 85,
                              width: 180,
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset('assets/images/moto.png',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.fill),
                              ));
                        })),
                SizedBox(height: 10),
                Container(
                  child: TabBar(
                    controller: tabCtrl,
                    labelColor: Color(0xFF6F8C2E),
                    unselectedLabelColor: Color(0xFF1A1A27),
                    tabs: [
                      Tab(
                        text: 'Scheduled Payments',
                      ),
                      Tab(
                        text: 'Actual Payments',
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 6,
                  child: TabBarView(controller: tabCtrl, children: [
                    /* Shedules*/
                    SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      child: SafeArea(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: _expanded
                                  ? 230
                                  : 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF3B63F),
                                  border: Border.all(
                                      color: Color(0xFF21367E), width: 1)),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 5, top: 10),

                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ID Number',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.productid}',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Status',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.status}',
                                            style: TextStyle(
                                              color: Color(0xFF24B600),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Unit Price',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            NumberFormat()
                                                .format(salesController.currentPrelementDetails.value?.uPrice ?? 0),
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Merchant Shop',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.namesupplier}',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Subscription Date',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            Jiffy.parseFromDateTime(salesController.currentPrelementDetails.value?.dateInvoice ?? DateTime.now()).MMMEd,
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // ExpansionPanelList(
                                  //   dividerColor: Colors.transparent,
                                  //   elevation: 0,
                                  //   expansionCallback: (int index, bool isExpanded) {
                                  //     setState(() {
                                  //       _expanded = !_expanded;
                                  //     });
                                  //   },
                                  //   children: salesController.currentPrelementDetails.value!.accessoires!.map<ExpansionPanel>((ProductAccessoireModel value) {
                                  //     return ExpansionPanel(
                                  //       backgroundColor: Colors.transparent,
                                  //       headerBuilder: (BuildContext context, bool isExpanded) {
                                  //         return Text(value.productname ?? "-",style: TextStyle(color: Colors.black));
                                  //       },
                                  //       body: ListTile(
                                  //         title: Text(value.productname ?? "-",style: TextStyle(color: Colors.black)),
                                  //       ),
                                  //       isExpanded: false
                                  //
                                  //     );
                                  //   }).toList(),
                                  // ),

                                  Obx(() => salesController.currentPrelementDetails.value != null && salesController.currentPrelementDetails.value!.accessoires != null
                                      ? Theme(
                                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      backgroundColor: Colors.transparent,
                                      title: Text(
                                        'Additional Offer',
                                        style: TextStyle(
                                          color: Color(0xFFA1A1A1),
                                          fontSize: 14,
                                        ),
                                      ),
                                      childrenPadding: EdgeInsets.only(bottom: 5),
                                      onExpansionChanged: (value){
                                        setState(() {
                                          _expanded = value;
                                        });
                                      },
                                      children: salesController.currentPrelementDetails.value!.accessoires!.map((entry) {
                                        var w = ListTile(
                                          dense:true,
                                          contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                          title: Text(
                                            entry.productname ?? "-",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w200),
                                          ),
                                        );
                                        return w;
                                      }).toList(),
                                    ),
                                  )
                                      : SizedBox(child: Text("-"),)),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),
                            FutureBuilder<List<CalendarModel>>(
                                future: salesController.getCalendarByPref(),
                                builder: (BuildContext context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.error.toString()),
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 3, bottom: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(14),
                                            border: Border.all(
                                                color: Color(0xFFC4C4C4),
                                                width: 1)),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: DataTable(
                                            columnSpacing: 5,
                                            horizontalMargin: 8,
                                            columns: [
                                              DataColumn(
                                                label: Text(
                                                    'Type'.toUpperCase()),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                    'Dates'.toUpperCase()),
                                              ),
                                              DataColumn(
                                                label: Text(
                                                    'Amount'.toUpperCase()),
                                              ),
                                              DataColumn(
                                                label: Text('Amount due'
                                                    .toUpperCase()),
                                              ),
                                              // Lets add one more column to show a delete button
                                              DataColumn(
                                                label: Text(
                                                    'Settled'.toUpperCase()),
                                              )
                                            ],
                                            rows: List.generate(
                                                snapshot.data!.length,
                                                    (index) {
                                                  var payment =
                                                  snapshot.data![index];
                                                  return DataRow(
                                                      color: MaterialStateProperty
                                                          .resolveWith<Color?>(
                                                              (Set<MaterialState>
                                                          states) {
                                                            // All rows will have the same selected color.
                                                            if (states.contains(
                                                                MaterialState
                                                                    .selected)) {
                                                              return Theme.of(context)
                                                                  .colorScheme
                                                                  .primary
                                                                  .withOpacity(0.08);
                                                            }
                                                            // Even rows will have a grey color.
                                                            if (index.isEven) {
                                                              return Color(
                                                                  0xFFE8F4FE);
                                                            }
                                                            return null; // Use default value for other states and odd rows.
                                                          }),
                                                      cells: [
                                                        DataCell(
                                                          Text(
                                                            '${payment.name}',
                                                            style: TextStyle(
                                                              color: (() {
                                                                if (payment
                                                                    .isDu ==
                                                                    0) {
                                                                  return const Color(
                                                                      0xFF27AE60);
                                                                } else if (payment
                                                                    .isDu ==
                                                                    1) {
                                                                  return const Color(
                                                                      0xFFFF0000);
                                                                } else if (payment
                                                                    .isDu ==
                                                                    1 ||
                                                                    payment.notPay ==
                                                                        1) {
                                                                  return const Color(
                                                                      0xFF4B4B4B);
                                                                }
                                                              })(),
                                                            ),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            DateFormat.yMMMd()
                                                                .format(
                                                                payment.date),
                                                            style: TextStyle(
                                                              color: (() {
                                                                if (payment
                                                                    .isDu ==
                                                                    0) {
                                                                  return const Color(
                                                                      0xFF27AE60);
                                                                } else if (payment
                                                                    .isDu ==
                                                                    1) {
                                                                  return const Color(
                                                                      0xFFFF0000);
                                                                } else if (payment
                                                                    .isDu ==
                                                                    1 ||
                                                                    payment.notPay ==
                                                                        1) {
                                                                  return const Color(
                                                                      0xFF4B4B4B);
                                                                }
                                                              })(),
                                                            ),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            NumberFormat().format(
                                                                payment.toPaid),
                                                            style: TextStyle(
                                                              color: (() {
                                                                if (payment
                                                                    .isDu ==
                                                                    0) {
                                                                  return const Color(
                                                                      0xFF27AE60);
                                                                } else if (payment
                                                                    .isDu ==
                                                                    1) {
                                                                  return const Color(
                                                                      0xFFFF0000);
                                                                } else if (payment
                                                                    .notPay ==
                                                                    1) {
                                                                  return const Color(
                                                                      0xFF4B4B4B);
                                                                }
                                                              })(),
                                                            ),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Text(
                                                            NumberFormat().format(
                                                                payment.amountDu),
                                                            style: TextStyle(
                                                              color: (() {
                                                                if (payment
                                                                    .isDu ==
                                                                    0) {
                                                                  return const Color(
                                                                      0xFF27AE60);
                                                                } else if (payment
                                                                    .isDu ==
                                                                    1) {
                                                                  return const Color(
                                                                      0xFFFF0000);
                                                                } else if (payment
                                                                    .notPay ==
                                                                    1) {
                                                                  return const Color(
                                                                      0xFF4B4B4B);
                                                                }
                                                              })(),
                                                            ),
                                                          ),
                                                        ),
                                                        DataCell(
                                                          Icon(
                                                            // payment.isDu == 0 ? Icons.access_time_filled : Icons.check_box,
                                                            payment.isDu == 0
                                                                ? Icons.check_box
                                                                : Icons.dangerous,
                                                            color: (() {
                                                              if (payment.isDu ==
                                                                  0) {
                                                                return const Color(
                                                                    0xFF27AE60);
                                                              } else if (payment
                                                                  .isDu ==
                                                                  1) {
                                                                return const Color(
                                                                    0xFFFF0000);
                                                              } else if (payment
                                                                  .notPay ==
                                                                  1) {
                                                                return const Color(
                                                                    0xFF4B4B4B);
                                                              }
                                                            })(),
                                                          ),
                                                        )
                                                      ]);
                                                }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                    /* Actual payment*/
                    SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFF3B63F),
                                  border: Border.all(
                                      color: Color(0xFF21367E), width: 1)),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ID Number  ',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.productid ?? ''}',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Status',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.status ?? 'draft'}',
                                            style: TextStyle(
                                              color: Color(0xFF24B600),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Unit Price',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.uPrice ?? 0} Fcfa',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Merchant Shop',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '${salesController.currentPrelementDetails.value?.namesupplier}',
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Subscription Date',
                                            style: TextStyle(
                                              color: Color(0xFFA1A1A1),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            Jiffy.parseFromDateTime(salesController.currentPrelementDetails.value?.dateInvoice ?? DateTime.now()).MMMEd,
                                            style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            FutureBuilder<List<PaymentModel>>(
                                future: salesController.getPaymentByPref(),
                                builder: (BuildContext context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(snapshot.error.toString()),
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Color(0xFFC4C4C4),
                                                width: 1)),
                                        child: DataTable(
                                          columnSpacing: 20,
                                          columns: [
                                            DataColumn(
                                              label:
                                              Text('Type'.toUpperCase()),
                                            ),
                                            DataColumn(
                                              label:
                                              Text('Dates'.toUpperCase()),
                                            ),
                                            DataColumn(
                                                label: Text(
                                                    'Amount'.toUpperCase()),
                                                numeric: true),
                                            // Lets add one more column to show a delete button
                                            DataColumn(
                                              label: Text(
                                                  'Settled'.toUpperCase()),
                                            )
                                          ],
                                          rows: List.generate(
                                              snapshot.data!.length, (index) {
                                            var payment =
                                            snapshot.data![index];
                                            return DataRow(
                                                color: MaterialStateProperty
                                                    .resolveWith<Color?>(
                                                        (Set<MaterialState>
                                                    states) {
                                                      // All rows will have the same selected color.
                                                      if (states.contains(
                                                          MaterialState
                                                              .selected)) {
                                                        return Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                            .withOpacity(0.08);
                                                      }
                                                      // Even rows will have a grey color.
                                                      if (index.isEven) {
                                                        return Color(0xFFE8F4FE);
                                                        // return Colors.grey.withOpacity(0.3);
                                                      }
                                                      return null; // Use default value for other states and odd rows.
                                                    }),
                                                cells: [
                                                  DataCell(
                                                    Text(
                                                        '${payment.typePay}'),
                                                  ),
                                                  DataCell(
                                                    Text(DateFormat.yMMMd()
                                                        .format(
                                                        payment.date)),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      NumberFormat().format(
                                                          payment.verse),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Icon(Icons.schedule),
                                                  )
                                                ]);
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });

  }
}
