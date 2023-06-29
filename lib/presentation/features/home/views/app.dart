import 'package:flutter/material.dart';
import 'package:flutter/material.dart' show Icon, Color;
import 'package:animations/animations.dart';
import 'package:payamlater/presentation/widgets/BottomNavigationBar/bottom_navigation_bar.dart';
import 'package:payamlater/presentation/widgets/page_wrapper.dart';

import '../../product/views/list_product.dart';
import 'home.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  static const List<Widget> screens = [
    HomeScreen(),
    ListProduct(),
    // CartScreen(),
    // ProfileScreen()
  ];
  static List bottomNavyBarItems = [
    BottomNavyBarItem(
      "Home",
      const Icon(Icons.home),
      const Color(0xFFEC6813),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Favorite",
      const Icon(Icons.favorite),
      const Color(0xFFEC6813),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Cart",
      const Icon(Icons.shopping_cart),
      const Color(0xFFEC6813),
      Colors.grey,
    ),
    BottomNavyBarItem(
      "Profile",
      const Icon(Icons.person),
      const Color(0xFFEC6813),
      Colors.grey,
    ),
  ];

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int newIndex = 0;

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
    return PageWrapper(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onIconPresedCallback: onBottomIconPressed,
          onItemSelected: (currentIndex) {
            newIndex = currentIndex;
            setState(() {});
          },
        ),
        body: PageTransitionSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation,) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: AppScreen.screens[newIndex],
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  String title;
  Icon icon;
  Color activeColor;
  Color inActiveColor;

  BottomNavyBarItem(
    this.title,
    this.icon,
    this.activeColor,
    this.inActiveColor,
  );
}
