import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home.dart';
import '../../product/views/list_product.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<String> listImage = [];
  int selectedSliderPosition = 0;

  bool isHomePageSelected = true;
  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.pop(context);
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Payment Details",
            style: TextStyle(
              color: Color(0xFF1B1D3B),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
      ),
      // bottomNavigationBar: BottomNavBar(),
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              SearchBar(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF3B63F),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total Financed Amount',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            ' 1,800,000 Fcfa',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
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
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF034A8F),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Total Repaid',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            ' 750,000 Fcfa',
                            style: TextStyle(
                              color: Color(0xFF53D226),
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
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
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF034A8F),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Delayed Payments',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            ' 750,000 Fcfa',
                            style: TextStyle(
                              color: Color(0xFF53D226),
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Card(
                  //   elevation: 5,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Container(
                  //     height: 100,
                  //     width: 100,
                  //     padding: EdgeInsets.only(left: 10, right: 10),
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Color(0xFFFFFFFFF),
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         Text(
                  //           'Total Balance',
                  //           style: TextStyle(
                  //             color: Color(0xFF000000),
                  //             fontWeight: FontWeight.w400,
                  //             fontSize: 12,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         Text(
                  //           ' 250,000 Fcfa',
                  //           style: TextStyle(
                  //             color: Color(0xFFF93A3A),
                  //             fontWeight: FontWeight.w800,
                  //             fontSize: 14,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductList();
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 16),
                      itemCount: 3,
                    ),
                    // Section 2 - Shipping Information
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 20),
                      decoration: BoxDecoration(
                        // color: AppColor.primarySoft,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Column(
                        children: [
                          // header
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shipping information',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'poppins',
                                    fontWeight: FontWeight.w600,
                                    // color: AppColor.secondary
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child:
                                  Image.asset(
                                    'assets/images/moto1.jpeg',
                                    width: 16,
                                    // fit: BoxFit.fill
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.grey,
                                    shape: CircleBorder(),
                                    backgroundColor: Colors.grey,
                                    elevation: 0,
                                    padding: EdgeInsets.all(0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Name
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Image.asset(
                                      'assets/images/moto1.jpeg',
                                      width: 18),
                                ),
                                Expanded(
                                  child: Text(
                                    'Arnold Utomo',
                                    style: TextStyle(
                                      // color: AppColor.secondary.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Address
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Image.asset(
                                      'assets/images/moto1.jpeg',
                                      width: 18),
                                ),
                                Expanded(
                                  child: Text(
                                    '1281 90 Trutomo Street, New York, United States ',
                                    style: TextStyle(
                                      // color: AppColor.secondary.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Phone Number
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Image.asset(
                                      'assets/images/moto1.jpeg',
                                      width: 18),
                                ),
                                Expanded(
                                  child: Text(
                                    '0888 - 8888 - 8888',
                                    style: TextStyle(
                                      // color: AppColor.secondary.withOpacity(0.7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Section 3 - Select Shipping method
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Column(
                        children: [
                          // Header
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            decoration: BoxDecoration(
                              // color: AppColor.primarySoft,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                            ),
                            // Content
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Select Shipping method',
                                        style: TextStyle(
                                          // color: AppColor.secondary.withOpacity(0.7),
                                            fontSize: 10)),
                                    Text('Official Shipping',
                                        style: TextStyle(
                                          // color: AppColor.secondary,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'poppins')),
                                  ],
                                ),
                                Text('free delivery',
                                    style: TextStyle(
                                      // color: AppColor.primary,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding:
                            EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          'Shipping',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            // color: AppColor.secondary
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          '3-5 Days',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            // color: AppColor.secondary.withOpacity(0.7)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          'Rp 0',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            // color: AppColor.primary
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          'Subtotal',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            // color: AppColor.secondary
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          '4 Items',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            // color: AppColor.secondary.withOpacity(0.7)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          'Rp 1,429,000',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            // color: AppColor.primary
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BottomNavBar() {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.symmetric(horizontal: 10 * 1.5),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.off(HomeScreen());
            },
            child: Icon(Icons.home_outlined),
          ),
          GestureDetector(
            onTap: () {
              Get.off(ListProduct());
            },
            child: Icon(Icons.store),
          ),
          GestureDetector(
            onTap: () {
              // Get.off(SalesPersonHome());
            },
            child: Icon(Icons.dashboard),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }

  Widget SearchBar() {
    String? selectedValue = null;
    return DropdownButtonFormField(
      hint: Text('Select Customer'),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
      ),
      validator: (value) => value == null ? "Select Customer" : null,
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      // items: dropdownItems),
      items: <String>['Dog', 'Cat', 'Tiger', 'Lion']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
    );
  }

  Widget ProductList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Row(
        children: [
          // Image
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              // color: AppColor.border,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: AssetImage(
                  'assets/images/moto1.jpeg'),
                  fit: BoxFit.cover),
            ),
          ),
          // Info
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Container(
                  margin: EdgeInsets.only(top: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Price
                      Expanded(
                        child: Text(
                          '14 Aug, 2022',
                          // '${Pecahan.rupiah(value: data.price, withRp: true)}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16
                          ),
                        ),
                      ),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 23,
                        color: Color(0xFF034A8F),
                      ),
                    ],
                  ),
                ),
                Text(
                  '14 Aug, 2022',
                  // '${data.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xFF83848B),
                  ),
                ),
                // Product Price - Increment Decrement Button

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      width: 150,
                      height: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: 0.7,
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xff00ff00)),
                          backgroundColor: Color(0xffD6D6D6),
                        ),
                      ),
                    ),
                    Text('65%',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xFF6F8C2E),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
