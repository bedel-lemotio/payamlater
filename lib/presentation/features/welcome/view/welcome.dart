
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../authentication/views/auth.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // int currentId = 0;
  final screenCtrl = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    screenCtrl.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: screenCtrl,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/slide1.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(height: 64),
                  Text(
                    'Choose the Products',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/slide2.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(height: 64),
                  Text(
                    'Choose the payment method',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/slide3.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  SizedBox(height: 64),
                  Text(
                    'Track your order and have it delivered with ease',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: TextButton(
                onPressed: () async {
                  await _storeOnboardInfo();
                  Get.off(Auth());
                },
                child: Text(
                  "Get started!".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  primary: Color(0xFF6F8C2E),
                  backgroundColor: Color(0xFF6F8C2E),
                  minimumSize: Size.fromHeight(50),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        await _storeOnboardInfo();
                        screenCtrl.jumpToPage(2);
                      },
                      child: Text('SKIP')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: screenCtrl,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: Color(0xFF6F8C2E),
                      ),
                      onDotClicked: (index) => screenCtrl.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () => screenCtrl.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut),
                      child: Text('NEXT')),
                ],
              ),
            ),

    );
  }
}
