import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class PolicyToOffAccountScreen extends StatefulWidget {

  @override
  _PolicyToOffAccountState createState() => _PolicyToOffAccountState();
}

class _PolicyToOffAccountState extends State<PolicyToOffAccountScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    super.dispose();
  }


  void willPop(BuildContext ctx, {String? title}) {

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

                          }),
                    ),
                  ],
                )
              ],
            ),
          );
        });

  }


  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: _buildBody(),
      ),
    );

  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildMainContent(),
        _handleErrorMessage(),
        _buildLoading(),
        _buildResponse(),
      ],
    );
  }

  Widget _buildMainContent(){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: (){
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF1B1D3B),width: 1)
              ),
              child: Icon(Icons.arrow_back_ios_new,color: Color(0xFF1B1D3B),),
            ),
          ),
        ),
        title:Text(
          "Supprimer mon compte",
          style: TextStyle(
            color: Color(0xFF1B1D3B),
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Contraintes lié à la suppression de votre compte Payamlater",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )
            ),
            const SizedBox(height: 10,),
            const Text(
                "La suppression de votre compte sera irréversible entraineront les conséquences suivantes :",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                )
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_left,color: Colors.black),
                SizedBox(width:10),
                Expanded(
                  child:  RichText(
                    text: const TextSpan(
                        text:  "La suppression de ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                              text: 'vos événements ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              )
                          ),
                          TextSpan(
                              text: 'créer précédemment.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              )
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_left,color: Colors.black),
                SizedBox(width:10),
                Expanded(
                  child:  RichText(
                    text: const TextSpan(
                        text:  "La suppression ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(
                              text: 'des historiques de paiements ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,)
                          ),
                          TextSpan(
                              text: 'créer précédemment.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,)
                          ),
                        ]
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),

            SizedBox(height: 50,),
            
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color:Color(0xffF4FBFE),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: Offset(
                  1.0,
                  1.0,
                ),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                constraints: BoxConstraints.expand(width: Get.width*0.5,height: 70),
                padding: const EdgeInsets.only(left: 30),
                onPressed: () {
                  willPop(context);
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.delete,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Delete Account",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFFFF0000),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }

  Widget _handleErrorMessage() {
    return SizedBox.shrink();
  }

  Widget _buildLoading() {
    return SizedBox.shrink();
  }

  Widget _buildResponse() {
    return SizedBox.shrink();
  }


  /// General Methods:-----------------------------------------------------------
}
