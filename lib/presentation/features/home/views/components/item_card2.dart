import 'package:flutter/material.dart';
import 'package:payamlater/presentation/features/details/views/detail_product.dart';

class ItemCards extends StatefulWidget {
  ItemCards({Key? key}) : super(key: key);

  @override
  State<ItemCards> createState() => _ItemCardsState();
}

class _ItemCardsState extends State<ItemCards> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // key: ValueKey(_myShoes[index]["id"]),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductDetails()));
        },
        child: Container(
          // height: 255,
          width: 143,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 14 - 4,
                  height: MediaQuery.of(context).size.width / 2.5 - 14 - 4,
                  padding: EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage('assets/images/moto1.jpeg'),
                        fit: BoxFit.cover),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 75),
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFF009FE3).withOpacity(0.5),
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 18,
                        // margin: margin,
                        padding: EdgeInsets.only(top: 2, bottom: 4, left: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF93A3A),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '- 10%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Moto Indian KasKay - Something blablablabla",
                            style: TextStyle(
                              color: Color(0xFF808080),
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(height: 3),
                        Text("553 500  FCFA",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            )),
                        SizedBox(height: 3),
                        Text("615 000 FCFA",
                            style: TextStyle(
                                color: Color(0xFF808080),
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Disponible",
                              style: TextStyle(
                                  color: Color(0xFF034A8F),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic),
                            ),
                            InkWell(
                              onTap: () {
                                // showDialog(
                                //     context: context,
                                //     builder: (context) =>
                                //         HelperFunctions()
                                //             .myAlertDialog(
                                //           context: context,
                                //         ));
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    Color(0xFF009FE3).withOpacity(0.5),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // showDialog(
                                //     context: context,
                                //     builder: (context) =>
                                //         HelperFunctions()
                                //             .myAlertDialog(
                                //           context: context,
                                //         ));
                              },
                              child: CircleAvatar(
                                radius: 16,
                                backgroundColor:
                                    Color(0xFF009FE3).withOpacity(0.5),
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
