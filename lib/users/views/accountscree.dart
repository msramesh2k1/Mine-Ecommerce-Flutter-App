import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/HomeScreenWidgets/HomeWidgets.dart';
import 'package:mine/Orders.dart';
import 'package:mine/Widgets/Custom_Widgets.dart';
import 'package:mine/users/views/HomePage.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:mine/helpers/mobilewidgets.dart';
import 'package:mine/helpers/responsive_widget.dart';

import '../../controllers/cart_controller.dart';
import 'Helper.dart';
import 'AddAddress.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override

  void initState() {
    // TODO: implement initState
    context.read<CartController>().cartvaluefinder();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveWidget(
      mobile: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                TopMovileNotifyBlackBox(),
                MobileTitleWebBox(),
                Box(height: 40, width: 0),
                Text(
                  "ACCOUNT",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 14,
                        letterSpacing: 2),
                  ),
                ),
                Box(height: 30, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back !!   " +
                          MRANDMRS.sharedprefs!.getString("name").toString(),
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
                MRANDMRS.sharedprefs!.getString("email").toString() == "" ?  Text(
 MRANDMRS.sharedprefs!.getString("phno").toString(),
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ) : 

                Text(
 MRANDMRS.sharedprefs!.getString("email").toString() +
                          "  -  "+MRANDMRS.sharedprefs!.getString("phno").toString(),
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ),
                Box(height: 30, width: 0),
                GestureDetector(
                  onTap: () {
                    Get.to(Orders());
                  },
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        "View Orders",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Box(height: 30, width: 0),
                GestureDetector(
                  onTap: () {
                    Get.dialog(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 560,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ADDRESS",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.clear,
                                            color: Colors.black))
                                  ],
                                ),
                                Box(height: 8, width: 0),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Container(
                                                width: 400,
                                                height: 800,
                                                child: AddAddress()),
                                          );
                                        });
                                  },
                                  child: Text(
                                    "Add New Address",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black45,
                                          height: 2,
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 405,
                                  width: 900,
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(MRANDMRS.sharedprefs!
                                              .getString("uid"))
                                          .collection("address")
                                          .snapshots(),
                                      builder: ((context, snapshot) {
                                        return !snapshot.hasData
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                itemCount:
                                                    snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8),
                                                    child: Container(
                                                      height: 100,
                                                      width: 900,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  snapshot.data!.docs[index]['name'] +
                                                                      "  -  " +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'flatNumber'] +
                                                                      "\n" +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'street1'] +
                                                                      "\n" +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'city'] +
                                                                      ", " +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'pincode'] +
                                                                      "\n" +
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['state'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      GoogleFonts
                                                                          .nunitoSans(
                                                                    textStyle: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: Colors
                                                                            .black45,
                                                                        fontSize:
                                                                            11,
                                                                        letterSpacing:
                                                                            0.5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                 
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black54)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['type'],
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                               GestureDetector(
                                                                onTap: () {

                                                                   FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "users")
                                                                      .doc(MRANDMRS
                                                                          .sharedprefs!
                                                                          .getString(
                                                                              "uid"))
                                                                      .collection(
                                                                          "address")
                                                                      .doc(snapshot
                                                                          .data!
                                                                          .docs[index]['id'])
                                                                      .delete();
                                                                
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black54)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Delete",
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                      })),
                                ),
                                Box(height: 10, width: 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 300,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        "View Address",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Box(height: 30, width: 0),
                Box(height: 40, width: 0),
                GestureDetector(
                  onTap: () {
                    MRANDMRS.sharedprefs!.remove("uid").then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    });

                      final snackBar = SnackBar(
                               backgroundColor: Colors.brown[200],
                              //  margin: EdgeInsets.all(20),
                               width: 300,
                              // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                               
                               behavior: SnackBarBehavior.floating,

                               dismissDirection: DismissDirection.startToEnd,
                               
                               
                               content: Text('Logged Out Successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },

                  child: Container(
                    height: 45,
                    width: 300,
                    child: Center(
                      child: Text(
                        "LOGOUT",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 191, 171, 1),
                        border: Border.all(
                            color: Color.fromRGBO(204, 191, 171, 1))),
                  ),
                ),
                Box(height: 10, width: 0),
                Box(height: 40, width: 0),
              ],
            ),
            color: Colors.white),
      ),
      tab: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                TopNotifyBlackBox(),
                TitleWebBox(),
                Box(height: 40, width: 0),
                Text(
                  "ACCOUNT",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 14,
                        letterSpacing: 2),
                  ),
                ),
                Box(height: 30, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back !!   " +
                          MRANDMRS.sharedprefs!.getString("name").toString(),
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.5),
                      ),
                    ),
                   
                  ],
                ),
                   MRANDMRS.sharedprefs!.getString("email").toString() == "" ?  Text(
 MRANDMRS.sharedprefs!.getString("phno").toString(),
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ) : 

                Text(
 MRANDMRS.sharedprefs!.getString("email").toString() +
                          "  -  "+MRANDMRS.sharedprefs!.getString("phno").toString(),
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ),

                Box(height: 30, width: 0),
                InkWell(
                  onTap: () {
                    Get.to(Orders());
                  },
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        "View Orders",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Box(height: 30, width: 0),
                GestureDetector(
                  onTap: () {
                    Get.dialog(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          height: 560,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ADDRESS",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.clear,
                                            color: Colors.black))
                                  ],
                                ),
                                Box(height: 8, width: 0),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Container(
                                                width: 400,
                                                height: 800,
                                                child: AddAddress()),
                                          );
                                        });
                                  },
                                  child: Text(
                                    "Add New Address",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black45,
                                          height: 2,
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 405,
                                  width: 900,
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(MRANDMRS.sharedprefs!
                                              .getString("uid"))
                                          .collection("address")
                                          .snapshots(),
                                      builder: ((context, snapshot) {
                                        return !snapshot.hasData
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                itemCount:
                                                    snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8),
                                                    child: Container(
                                                      height: 100,
                                                      width: 900,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  snapshot.data!.docs[index]['name'] +
                                                                      "  -  " +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'flatNumber'] +
                                                                      "\n" +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'street1'] +
                                                                      "\n" +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'city'] +
                                                                      ", " +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'pincode'] +
                                                                      "\n" +
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['state'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      GoogleFonts
                                                                          .nunitoSans(
                                                                    textStyle: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: Colors
                                                                            .black45,
                                                                        fontSize:
                                                                            13,
                                                                        letterSpacing:
                                                                            0.5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                 
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black54)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['type'],
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                               GestureDetector(
                                                                onTap: () {

                                                                   FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "users")
                                                                      .doc(MRANDMRS
                                                                          .sharedprefs!
                                                                          .getString(
                                                                              "uid"))
                                                                      .collection(
                                                                          "address")
                                                                      .doc(snapshot
                                                                          .data!
                                                                          .docs[index]['id'])
                                                                      .delete();
                                                                
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black54)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Delete",
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                      })),
                                ),
                                Box(height: 10, width: 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        "View Address",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Box(height: 30, width: 0),
                Box(height: 40, width: 0),
                GestureDetector(
                  onTap: () {
                    MRANDMRS.sharedprefs!.remove("uid").then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    });
                      final snackBar = SnackBar(
                               backgroundColor: Colors.brown[200],
                              //  margin: EdgeInsets.all(20),
                               width: 300,
                              // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                               
                               behavior: SnackBarBehavior.floating,

                               dismissDirection: DismissDirection.startToEnd,
                               
                               
                               content: Text('Logged Out Successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    height: 45,
                    width: 400,
                    child: Center(
                      child: Text(
                        "LOGOUT",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 191, 171, 1),
                        border: Border.all(
                            color: Color.fromRGBO(204, 191, 171, 1))),
                  ),
                ),
                Box(height: 10, width: 0),
                Box(height: 40, width: 0),
              ],
            ),
            color: Colors.white),
      ),
      desktop: SingleChildScrollView(
        child: Container(
            child: Column(
              children: [
                TopNotifyBlackBox(),
                TitleWebBox(),
                Box(height: 40, width: 0),
                Text(
                  "ACCOUNT",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 14,
                        letterSpacing: 2),
                  ),
                ),
                Box(height: 30, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome Back !!   " +
                          MRANDMRS.sharedprefs!.getString("name").toString(),
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.5),
                      ),
                    ),
                   
                  ],
                ),
                   MRANDMRS.sharedprefs!.getString("email").toString() == "" ?  Text(
 MRANDMRS.sharedprefs!.getString("phno").toString(),
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ) : 

                Text(
 MRANDMRS.sharedprefs!.getString("email").toString() +
                          "  -  "+MRANDMRS.sharedprefs!.getString("phno").toString(),
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                        fontSize: 14,
                        letterSpacing: 0.5),
                  ),
                ),

                Box(height: 30, width: 0),
                GestureDetector(
                  onTap: () {
                    Get.to(Orders());
                  },
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        "View Orders",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Box(height: 30, width: 0),
                GestureDetector(
                  onTap: () {
                    Get.dialog(Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          height: 560,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ADDRESS",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.clear,
                                            color: Colors.black))
                                  ],
                                ),
                                Box(height: 8, width: 0),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Container(
                                                width: 400,
                                                height: 800,
                                                child: AddAddress()),
                                          );
                                        });
                                  },
                                  child: Text(
                                    "Add New Address",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black45,
                                          height: 2,
                                          decoration: TextDecoration.underline,
                                          fontSize: 14,
                                          letterSpacing: 0.5),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 405,
                                  width: 900,
                                  child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(MRANDMRS.sharedprefs!
                                              .getString("uid"))
                                          .collection("address")
                                          .snapshots(),
                                      builder: ((context, snapshot) {
                                        return !snapshot.hasData
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : ListView.builder(
                                                itemCount:
                                                    snapshot.data!.docs.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0,
                                                            bottom: 8),
                                                    child: Container(
                                                      height: 100,
                                                      width: 900,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: Colors
                                                                  .black)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                  snapshot.data!.docs[index]['name'] +
                                                                      "  -  " +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'flatNumber'] +
                                                                      "\n" +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'street1'] +
                                                                      "\n" +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'city'] +
                                                                      ", " +
                                                                      snapshot.data!
                                                                              .docs[index]
                                                                          [
                                                                          'pincode'] +
                                                                      "\n" +
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['state'],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      GoogleFonts
                                                                          .nunitoSans(
                                                                    textStyle: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                        color: Colors
                                                                            .black45,
                                                                        fontSize:
                                                                            13,
                                                                        letterSpacing:
                                                                            0.5),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                           Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                 
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black54)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      snapshot
                                                                          .data!
                                                                          .docs[index]['type'],
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 20,),
                                                               GestureDetector(
                                                                onTap: () {

                                                                   FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "users")
                                                                      .doc(MRANDMRS
                                                                          .sharedprefs!
                                                                          .getString(
                                                                              "uid"))
                                                                      .collection(
                                                                          "address")
                                                                      .doc(snapshot
                                                                          .data!
                                                                          .docs[index]['id'])
                                                                      .delete();
                                                                
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 20,
                                                                  width: 80,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.black54)),
                                                                  child: Center(
                                                                    child: Text(
                                                                      "Delete",
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        textStyle: const TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                      })),
                                ),
                                Box(height: 10, width: 0),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
                  },
                  child: Container(
                    height: 40,
                    width: 400,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        "View Address",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              fontSize: 14,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Box(height: 30, width: 0),
                Box(height: 40, width: 0),
                GestureDetector(
                  onTap: () {
                    MRANDMRS.sharedprefs!.remove("uid").then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    });
                      final snackBar = SnackBar(
                               backgroundColor: Colors.brown[200],
                              //  margin: EdgeInsets.all(20),
                               width: 300,
                              // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                               
                               behavior: SnackBarBehavior.floating,

                               dismissDirection: DismissDirection.startToEnd,
                               
                               
                               content: Text('Logged Out Successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Container(
                    height: 45,
                    width: 400,
                    child: Center(
                      child: Text(
                        "LOGOUT",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 191, 171, 1),
                        border: Border.all(
                            color: Color.fromRGBO(204, 191, 171, 1))),
                  ),
                ),
                Box(height: 10, width: 0),
                Box(height: 40, width: 0),
              ],
            ),
            color: Colors.white),
      ),
    ));
  }
}
