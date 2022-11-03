// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/HomePage.dart';
// import 'package:mrandmrs_ecom_webapp/HomeScreenWidgets/HomeWidgets.dart';
// import 'package:mrandmrs_ecom_webapp/Widgets/Custom_Widgets.dart';

// import '../users/views/Helper.dart';


// class cart extends StatefulWidget {
//   //final int cartno;

//   const cart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _cartState createState() => _cartState();
// }

// class _cartState extends State<cart> {
//   num totalAmount = 0;
//   int quanity = 1;
//   int cartno = 0;

//   int cartvalueno() {
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//         .collection("cart")
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       setState(() {
//         cartno = querySnapshot.docs.length;
//       });
//     });
//     return cartno;
//   }

//   @override
//   void initState() {
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//         .collection("cart")
//         .snapshots();
//     // TODO: implement initState
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//         .collection("cart")
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       setState(() {
//         cartno = querySnapshot.docs.length;
//       });
//     });
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//         .collection("cart")
//         .get()
//         .then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           MRANDMRS.sharedprefs!
//               .setInt(element.data()['id'], element.data()['quanity']);
//           totalAmount =
//               totalAmount + element.data()["price"] * element.data()['quanity'];
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: cartno == 0
//             ? Container(
//                 height: MediaQuery.of(context).size.height,
//                 color: Colors.transparent,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       TopNotifyBlackBox(),
//                       TitleWebBox(),
//                       Spacer(),
//                       Text(
//                         "YOUR CART IS EMPTY",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                               fontSize: 14,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => HomeScreen(),
//                               ));
//                         },
//                         child: Container(
//                           height: 45,
//                           width: 400,
//                           child: Center(
//                             child: Text(
//                               "SHOP OUR PRODUCTS",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: const TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     letterSpacing: 2),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(204, 191, 171, 1),
//                               border: Border.all(
//                                   color: Color.fromRGBO(204, 191, 171, 1))),
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                 ),
//               )
//             : SingleChildScrollView(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       TopNotifyBlackBox(),
//                       TitleWebBox(),
//                       Box(height: 50, width: 0),
//                       Text(
//                         "CART",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black,
//                               fontSize: 20,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50,
//                       ),
//                       // SizedBox(height: 10),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 30, left: 100.0, right: 100, bottom: 10),
//                         child: SingleChildScrollView(
//                           //physics: NeverScrollableScrollPhysics(),
//                           child: Container(
//                             color: Colors.white,
//                             height: 280 * cartno.toDouble(),
//                             child: StreamBuilder<QuerySnapshot>(
//                                 stream: FirebaseFirestore.instance
//                                     .collection("users")
//                                     .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                                     .collection("cart")
//                                     .snapshots(),
//                                 builder: (context, snapshot) {
//                                   return !snapshot.hasData
//                             ? Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                             : 
//                               Scrollbar(
//                                       isAlwaysShown: true,
//                                       thickness: 10,

//                                       //  controller: _s`crollController,
//                                       child: ListView.builder(
//                                           physics:
//                                               NeverScrollableScrollPhysics(),
//                                           // gridDelegate:
//                                           //     SliverGridDelegateWithFixedCrossAxisCount(
//                                           //         crossAxisCount: 1),
//                                           //   controller: _scrollController,
//                                           itemCount: snapshot.data!.docs.length,
//                                           itemBuilder: (BuildContext context,
//                                               int index) {
//                                             return GestureDetector(
//                                               onTap: () {
//                                                 // Navigator.push(
//                                                 //     context,
//                                                 //     MaterialPageRoute(
//                                                 //         builder: (context) =>
//                                                 //             DetailScreen()));
//                                               },
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(10.0),
//                                                 child: Container(
//                                                   height: 250,
//                                                   decoration: BoxDecoration(
//                                                     // color: Color.fromRGBO(
//                                                     //     230, 224, 215, 1),
//                                                     border: Border.all(
//                                                         color: Colors.black12),
//                                                   ),
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceEvenly,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                     .only(
//                                                                 left: 15.0,
//                                                                 top: 15,
//                                                                 bottom: 15),
//                                                         child: Expanded(
//                                                           child: Container(
//                                                             height: 220,
//                                                             width: 300,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0),
//                                                                 color: Colors
//                                                                     .grey[200],
//                                                                 image: DecorationImage(
//                                                                     image: NetworkImage(snapshot
//                                                                             .data!
//                                                                             .docs[index]
//                                                                         [
//                                                                         'url']),
//                                                                     fit: BoxFit
//                                                                         .cover)),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         width: 40,
//                                                       ),
//                                                       Container(
//                                                         width: 200,
//                                                         child: Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             SizedBox(
//                                                               height: 16,
//                                                             ),
//                                                             Text(
//                                                               snapshot
//                                                                   .data!
//                                                                   .docs[index]
//                                                                       ['name']
//                                                                   .toString()
//                                                                   .toUpperCase(),
//                                                               style: GoogleFonts
//                                                                   .nunitoSans(
//                                                                 textStyle: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         16,
//                                                                     letterSpacing:
//                                                                         0),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 8,
//                                                             ),
//                                                             Container(
//                                                               height: 25,
//                                                               width: MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width -
//                                                                   180,
//                                                               child: Text(
//                                                                 snapshot.data!.docs[
//                                                                             index]
//                                                                         [
//                                                                         'length'] +
//                                                                     " * " +
//                                                                     snapshot.data!
//                                                                             .docs[index]
//                                                                         [
//                                                                         'width'] +
//                                                                     "  CM",
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .nunitoSans(
//                                                                   textStyle: TextStyle(
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w400,
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           14,
//                                                                       letterSpacing:
//                                                                           0),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 4,
//                                                             ),
//                                                             Container(
//                                                               child: Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Center(
//                                                                     child: Text(
//                                                                       "QUANTITY : ",
//                                                                       style: GoogleFonts
//                                                                           .lato(
//                                                                         textStyle: TextStyle(
//                                                                             fontWeight: FontWeight
//                                                                                 .w700,
//                                                                             color: Colors
//                                                                                 .black54,
//                                                                             fontSize:
//                                                                                 10,
//                                                                             letterSpacing:
//                                                                                 1),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 5,
//                                                                   ),
//                                                                   Container(
//                                                                       child:
//                                                                           Center(
//                                                                         child:
//                                                                             Text(
//                                                                           snapshot
//                                                                               .data!
//                                                                               .docs[index]['quanity']
//                                                                               .toString(),
//                                                                           style:
//                                                                               GoogleFonts.lato(
//                                                                             textStyle: TextStyle(
//                                                                                 fontWeight: FontWeight.w900,
//                                                                                 color: Colors.black,
//                                                                                 fontSize: 14,
//                                                                                 letterSpacing: 1),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                       decoration: BoxDecoration(
//                                                                           color: Colors.grey[
//                                                                               300],
//                                                                           borderRadius: BorderRadius.circular(
//                                                                               2)),
//                                                                       height:
//                                                                           30,
//                                                                       width:
//                                                                           30),
//                                                                   SizedBox(
//                                                                     height: 5,
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               height: 40,
//                                                               width: 120,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors
//                                                                       .white,
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               5)),
//                                                             ),
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                             Row(
//                                                               children: [
//                                                                 Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                           .only(
//                                                                     right: 8.0,
//                                                                   ),
//                                                                   child: Center(
//                                                                     child: Text(
//                                                                       "₹ " +
//                                                                           snapshot
//                                                                               .data!
//                                                                               .docs[index]['rs']
//                                                                               .toString(),
//                                                                       style: GoogleFonts
//                                                                           .lato(
//                                                                         textStyle: TextStyle(
//                                                                             fontWeight: FontWeight
//                                                                                 .w700,
//                                                                             color: Colors
//                                                                                 .black,
//                                                                             fontSize:
//                                                                                 15,
//                                                                             letterSpacing:
//                                                                                 0),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .only(
//                                                                       right:
//                                                                           10.0,
//                                                                       top: 0),
//                                                                   child: Text(
//                                                                     "₹ " +
//                                                                         snapshot
//                                                                             .data!
//                                                                             .docs[index]["rs"]
//                                                                             .toString(),
//                                                                     style:
//                                                                         GoogleFonts
//                                                                             .lato(
//                                                                       textStyle: TextStyle(
//                                                                           fontWeight: FontWeight
//                                                                               .bold,
//                                                                           decoration: TextDecoration
//                                                                               .lineThrough,
//                                                                           color: Colors
//                                                                               .black54,
//                                                                           fontSize:
//                                                                               12,
//                                                                           letterSpacing:
//                                                                               0),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                             // Padding(
//                                                             //   padding: const EdgeInsets
//                                                             //           .only(
//                                                             //       top: 8.0),
//                                                             //   child: Center(
//                                                             //     child: Text(
//                                                             //       "Wood : " +
//                                                             //           snapshot
//                                                             //               .data!
//                                                             //               .docs[index]['wood'],
//                                                             //       style: GoogleFonts
//                                                             //           .nunitoSans(
//                                                             //         textStyle: TextStyle(
//                                                             //             fontWeight: FontWeight
//                                                             //                 .w700,
//                                                             //             color: Colors
//                                                             //                 .black54,
//                                                             //             fontSize:
//                                                             //                 14,
//                                                             //             letterSpacing:
//                                                             //                 0),
//                                                             //       ),
//                                                             //     ),
//                                                             //   ),
//                                                             // ),
//                                                             SizedBox(
//                                                               height: 10,
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Spacer(),
//                                                       Column(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               // print(snapshot
//                                                               //         .data!
//                                                               //         .docs[
//                                                               //     index]['id']);
//                                                               FirebaseFirestore
//                                                                   .instance
//                                                                   .collection(
//                                                                       "users")
//                                                                   .doc(MRANDMRS
//                                                                       .sharedprefs!
//                                                                       .getString(
//                                                                           "uid"))
//                                                                   .collection(
//                                                                       "cart")
//                                                                   .doc(snapshot
//                                                                           .data!
//                                                                           .docs[
//                                                                       index]['id'])
//                                                                   .delete();
//                                                               setState(() {});
//                                                             },
//                                                             child: Container(
//                                                               child: Center(
//                                                                 child: Icon(EvaIcons
//                                                                     .trashOutline),
//                                                               ),
//                                                               height: 50,
//                                                               width: 50,
//                                                               decoration: BoxDecoration(
//                                                                   shape: BoxShape
//                                                                       .circle,
//                                                                   border: Border.all(
//                                                                       color: Colors
//                                                                           .black12)),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       SizedBox(
//                                                         width: 30,
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           }),
//                                     );
//                                   }
//                                 ),
//                           ),
//                         ),
//                       ),
//                       Box(height: 0, width: 15),
//                       Container(
//                         height: 1,
//                         color: Colors.black12,
//                         width: MediaQuery.of(context).size.width - 25,
//                       ),
//                       Box(height: 15, width: 0),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "NO OF ITEMS : " + cartno.toString(),
//                             style: GoogleFonts.nunitoSans(
//                               textStyle: TextStyle(
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                   letterSpacing: 1),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 100,
//                           )
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "TOTAL : " + totalAmount.toString(),
//                             style: GoogleFonts.nunitoSans(
//                               textStyle: TextStyle(
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                   letterSpacing: 2),
//                             ),
//                           ),
//                           Box(height: 0, width: 100)
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Text(
//                             "Shipping & taxes calculated at checkout",
//                             style: GoogleFonts.nunitoSans(
//                               textStyle: TextStyle(
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                   fontSize: 14,
//                                   letterSpacing: 0),
//                             ),
//                           ),
//                           Box(height: 0, width: 100)
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             height: 45,
//                             width: 130,
//                             child: Center(
//                               child: Text(
//                                 "CHECKOUT",
//                                 style: GoogleFonts.nunitoSans(
//                                   textStyle: const TextStyle(
//                                       fontWeight: FontWeight.normal,
//                                       color: Colors.white,
//                                       fontSize: 14,
//                                       letterSpacing: 2),
//                                 ),
//                               ),
//                             ),
//                             decoration: BoxDecoration(
//                                 color: Color.fromRGBO(204, 191, 171, 1),
//                                 border: Border.all(
//                                     color: Color.fromRGBO(204, 191, 171, 1))),
//                           ),
//                           Box(height: 0, width: 100)
//                         ],
//                       ),
//                       Box(height: 50, width: 0),
//                       EndBox()
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
