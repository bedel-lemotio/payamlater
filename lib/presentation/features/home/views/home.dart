import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payamlater/presentation/features/home/views/components/item_card2.dart';
import 'package:payamlater/presentation/features/product/views/list_product.dart';
import 'package:payamlater/presentation/widgets/drawer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'components/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listImage = [
    "assets/images/moto1.jpeg",
    "assets/images/moto1.jpeg",
    "assets/images/moto1.jpeg"
  ];
  int selectedSliderPosition = 0;

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

  onwillPop(BuildContext context) {
    final completer = Completer<bool>();
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (buildContext) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text('Are you sure ?'),
                ),
                MaterialButton(
                    child: Text('YES'),
                    onPressed: () {
                      completer.complete(true);
                      Navigator.of(context).pop();
                    }),
                MaterialButton(
                    child: Text('NO'),
                    onPressed: () {
                      completer.complete(false);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>  onwillPop(context),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          brightness: Brightness.dark,
          elevation: 0,
          title: Container(
            color: Colors.red,
            width: Get.width,
            child: Image.asset(
              'assets/logo/home_logo.png',
              height: 35,
              fit: BoxFit.cover,
            ),
          ),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {}
            ),
          ],
        ),
        drawer: MyDrawer(),
        extendBody: true,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                SearchBar(),
                SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  // width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    itemBuilder: (context, position) {
                      return createSlider(listImage[position]);
                    },
                    controller: PageController(viewportFraction: .8),
                    itemCount: listImage.length,
                    onPageChanged: (position) {
                      /*setState(() {
                                selectedSliderPosition = position;
                              });*/
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Shop by Categories',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                /*Category product*/
                Row(
                  children: [
                    _categoriesView("assets/images/merchand.png", "Appliances"),
                    _categoriesView("assets/images/brand2.png", "Loan"),
                    _categoriesView("assets/images/brand1.png", "Motocycle"),
                    _categoriesView("assets/images/brand1.png", "Appliances")
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Popular Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: 2,
                  crossAxisSpacing: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 0.0,
                  itemBuilder: (context, index) {
                    return ItemCard();
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Flash Sale',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, );
                        Get.off(ListProduct());
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff808080),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: 2,
                  crossAxisSpacing: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 0.0,
                  itemBuilder: (context, index) {
                    return ItemCards();
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SearchBar() {
    return const TextField(
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
    );
  }

  Widget createSlider(String image) {
    return Card(
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color(0xFF9FE2FF)),
          ),
          Positioned(
            top: 1,
            left: 2,
            bottom: 1,
            child: ClipPath(
              clipper: ClipClipper(),
              child: Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: Color(0xFFC3EDFF),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 45, right: 50),
                  child: Center(
                    child: Image.asset(
                      'assets/images/moto2.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 2,
            bottom: 30,
            child: Container(
              height: 180,
              width: 180,
              padding: EdgeInsets.only(top: 20, right: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.lightGreen
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Special Offer',
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Discount 10%',
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Text(
                      'Flash Sale',
                      maxLines: 3,
                      // ignore: deprecated_member_use
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesView(String imagePath, String catName) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffF3F5F7),
            radius: 32,
            child: Image.asset(
              imagePath,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            catName,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black),
          )
        ],
      ),
    );
  }

}

class ClipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
