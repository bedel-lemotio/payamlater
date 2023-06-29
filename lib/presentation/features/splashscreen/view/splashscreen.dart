import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/service/authentication_manager.dart';
import '../../authentication/views/auth.dart';
import '../../welcome/view/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Timer timer;

  int? isviewed;
  Future checkFirstSeen() async {
    // WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onBoard');
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Auth()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Welcome()));
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 8),);
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animationController.forward();
    Timer(const Duration(seconds: 8), checkFirstSeen);
    checkFirstSeen();
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  // Auth Management
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();

    //Simulate other service for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return splash();
        } else {
          // if (snapshot.hasError)
          //   return errorView(snapshot);
          // else
            return isviewed != 0 ? Welcome() : Auth();
            // return OnBoard();
        }
      },
    );
  }

  void navigationPage() async {
    isviewed != 0 ? Get.off(() => Welcome()) : Get.off(() => Auth());

  }

  Scaffold splash() {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFF009FE3),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                        margin: EdgeInsets.only(bottom: 200),
                        height: 127,
                        width: 127,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color:
                              Color.fromARGB(231, 232, 231, 231), //Color(0xFFFFFFFF)
                        ),
                        child: Center(child: Image.asset('assets/logo/logo.png')),
                      ),
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/bottom_image.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircularProgressIndicator(),
          ),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
