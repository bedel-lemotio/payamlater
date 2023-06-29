import 'package:flutter/material.dart';
import 'package:payamlater/presentation/features/details/views/detail_product.dart';



class ItemCard extends StatefulWidget {
  ItemCard({Key? key}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  @override
  Widget build(BuildContext context) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails()));
                },
                child: Container(
                  // height: 185,
                  width: 143,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 14 - 4,
                          height: MediaQuery.of(context).size.width / 2.5 - 14 - 4,
                          padding: EdgeInsets.only(left: 108, top: 10),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                                image: AssetImage('assets/images/moto1.jpeg'), fit: BoxFit.cover),
                          ),
                          child: Container(
                            width: 45,
                            height: 18,
                            // margin: margin,
                            padding: EdgeInsets.only(top: 2, bottom: 4, left: 5, right: 5),
                            decoration: BoxDecoration(color: Color(0xFF034A8F), borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //RatingTag(value: product.rating),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Yamaha 27HR",
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w600,
                                    )),
                                SizedBox(height: 5),
                                Text("Premium Choice",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 10,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("850 000 Fcfa",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 17,
                                        )),
                                    InkWell(
                                      onTap: () {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) =>
                                        //         HelperFunctions()
                                        //             .myAlertDialog(
                                        //           context: context,
                                        //         )
                                        // );
                                      },
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Color(0xFF1B1D3B),
                                        child: Icon(
                                          Icons
                                              .add,
                                          size: 30,
                                          color: Colors.white,
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
          // }),
    // );
        // : Center(
        // child: ElevatedButton(
        //     onPressed: () {
        //       // readShoesData();
        //     },
        //     child: Text("Nothing fetched, Check")));
  }


// @override
  // Widget build(BuildContext context) {
  //   return GestureDetector(
  //     // onTap: () {
  //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(item: item)));
  //     // },
  //     child: Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(20)),
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(color: Color(0xfff8f8f), blurRadius: 15, spreadRadius: 10),
  //       ],
  //     ),
  //       child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(25),
  //         ),
  //         margin: EdgeInsets.only(top: index.isOdd ? 10 : 0, bottom: index.isOdd ? 0 : 10),
  //
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Hero(
  //               tag: index,
  //               child: Image.asset(
  //                 'assets/images/moto1.jpeg',
  //                 width: double.infinity,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 10 * 0.4),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Moto',
  //                       ),
  //                       Text(
  //                         '\$ 100',
  //                         style: TextStyle(
  //                             color: Colors.red,
  //                             fontWeight: FontWeight.bold
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //
  //                   IconButton(
  //                       // icon: SvgPicture.asset('assets/icons/heart.svg'),
  //                       icon: Align(
  //                         widthFactor: 1.0,
  //                         heightFactor: 1.0,
  //                         child: Icon(
  //                           Icons.heart_broken,
  //                         ),
  //                       ),
  //                       onPressed: () {}
  //                   )
  //                 ],
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}