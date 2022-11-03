// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/Helper.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/detailproductscreen.dart';

// class CartPageLord extends StatefulWidget {
//   const CartPageLord({Key? key}) : super(key: key);

//   @override
//   State<CartPageLord> createState() => _CartPageLordState();
// }

// class _CartPageLordState extends State<CartPageLord> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//                       height: MediaQuery.of(context).size.width /3.5,
                  
//                       width: 500,
//                       color: Colors.red,
//                       child: StreamBuilder<QuerySnapshot>(
//                           stream: FirebaseFirestore.instance
//                               .collection("users")
//                               .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                               .collection("cart")
//                               .snapshots(),
//                           builder: (context, snapshot) {
//                             if (!snapshot.hasData) {
//                               return Center(child: CircularProgressIndicator());
//                             } else {
//                               return ListView.builder(
//                                   // physics:
//                                   //     NeverScrollableScrollPhysics(),

//                                   // gridDelegate:

//                                   //     SliverGridDelegateWithFixedCrossAxisCount(

//                                   //         crossAxisCount: 1),

//                                   //   controller: _scrollController,

//                                   itemCount: snapshot.data!.docs.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return GestureDetector(
//                                       onTap: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     DetailProductScreen(
//                                                         queryDocumentSnapshot:
//                                                             snapshot.data!
//                                                                     .docs[
//                                                                 index])));
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Container(
//                                           height: 120,
//                                           width: 200,

//                                           decoration: BoxDecoration(
//                                             color: Colors.black,
//                                             // color: Color.fromRGBO(

//                                             //     230, 224, 215, 1),

//                                             border: Border.all(
//                                                 color: Colors.black12),
//                                           ),
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.only(
//                                                         left: 15.0,
//                                                         top: 15,
//                                                         bottom: 15),
//                                                 child: Container(
//                                                   height: 100,
//                                                   width: 100,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(0),
//                                                       color:
//                                                           Colors.grey[200],
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   [
//                                                                   'mainimage']),
//                                                           fit: BoxFit
//                                                               .cover)),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 30,
//                                               ),
//                                               Container(
//                                                 width: 210,
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     SizedBox(
//                                                       height: 16,
//                                                     ),

//                                                     Text(
//                                                       snapshot.data!
//                                                           .docs[index]['name']
//                                                           .toString(),
//                                                       style:
//                                                           GoogleFonts.nunitoSans(
//                                                         textStyle: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w500,
//                                                             color:
//                                                                 Colors.black,
//                                                             fontSize: 13,
//                                                             letterSpacing: 1),
//                                                       ),
//                                                     ),

//                                                     SizedBox(
//                                                       height: 4,
//                                                     ),

//                                                     Text(
//                                                       snapshot.data!
//                                                                   .docs[index]
//                                                               ['length'] +
//                                                           " * " +
//                                                           snapshot.data!
//                                                                   .docs[index]
//                                                               ['width'] +
//                                                           "  CM",
//                                                       style:
//                                                           GoogleFonts.nunitoSans(
//                                                         textStyle: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w400,
//                                                             color:
//                                                                 Colors.black,
//                                                             fontSize: 12,
//                                                             letterSpacing: 0),
//                                                       ),
//                                                     ),

//                                                     SizedBox(
//                                                       height: 4,
//                                                     ),

//                                                     Container(
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         children: [
//                                                           Center(
//                                                             child: Text(
//                                                               "QUANTITY : ",
//                                                               style:
//                                                                   GoogleFonts
//                                                                       .lato(
//                                                                 textStyle: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w700,
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     fontSize:
//                                                                         10,
//                                                                     letterSpacing:
//                                                                         1),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 5,
//                                                           ),
//                                                           Container(
//                                                               child: Center(
//                                                                 child: Text(
//                                                                   snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                           index]
//                                                                           [
//                                                                           'quanity']
//                                                                       .toString(),
//                                                                   style:
//                                                                       GoogleFonts
//                                                                           .lato(
//                                                                     textStyle: TextStyle(
//                                                                         fontWeight: FontWeight
//                                                                             .w900,
//                                                                         color: Colors
//                                                                             .black,
//                                                                         fontSize:
//                                                                             12,
//                                                                         letterSpacing:
//                                                                             1),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors
//                                                                           .grey[
//                                                                       300],
//                                                                   borderRadius:
//                                                                       BorderRadius.circular(
//                                                                           2)),
//                                                               height: 20,
//                                                               width: 20),
//                                                           SizedBox(
//                                                             width: 8,
//                                                           ),
//                                                           //  InkWell(
//                                                           //    onTap: (){
//                                                           //      FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString('uid')).collection("cart").doc(snapshot.data!.docs[index]['id']).delete();
//                                                           //   setState(() {
                                                              
//                                                           //   });
                                                            
//                                                           //    },
//                                                           //    child: Text(
//                                                           //       "REMOVE",
//                                                           //       style:
//                                                           //           GoogleFonts
//                                                           //               .nunitoSans(
//                                                           //         textStyle: TextStyle(
//                                                           //             fontWeight:
//                                                           //                 FontWeight
//                                                           //                     .bold,
//                                                           //             color: Colors
//                                                           //                 .red[900],
//                                                           //             fontSize:
//                                                           //                 10,
//                                                           //             letterSpacing:
//                                                           //                 1),
//                                                           //       ),
//                                                           //     ),
//                                                           //  ),
                                                          
//                                                     // Icon(Icons.delete_outline_rounded,color:Colors.red[900])
//                                                         ],
//                                                       ),
//                                                       height: 30,
//                                                       width: 150,
//                                                       decoration: BoxDecoration(
//                                                           color: Colors.white,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       5)),
//                                                     ),

//                                                     // SizedBox(

//                                                     //   height: 0,

//                                                     // ),

//                                                     // Padding(

//                                                     //   padding: const EdgeInsets

//                                                     //           .only(

//                                                     //       top: 8.0),

//                                                     //   child: Center(

//                                                     //     child: Text(

//                                                     //       "Wood : " +

//                                                     //           snapshot

//                                                     //               .data!

//                                                     //               .docs[index]['wood'],

//                                                     //       style: GoogleFonts

//                                                     //           .nunitoSans(

//                                                     //         textStyle: TextStyle(

//                                                     //             fontWeight: FontWeight

//                                                     //                 .w700,

//                                                     //             color: Colors

//                                                     //                 .black54,

//                                                     //             fontSize:

//                                                     //                 14,

//                                                     //             letterSpacing:

//                                                     //                 0),

//                                                     //       ),

//                                                     //     ),

//                                                     //   ),

//                                                     // ),

//                                                     // SizedBox(

//                                                     //   height: 10,

//                                                     // ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Spacer(),
//                                               Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.center,
//                                                 children: [
//                                                   Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             right: 10.0,
//                                                             top: 0),
//                                                     child: Text(
//                                                       "₹ " +
//                                                           snapshot
//                                                               .data!
//                                                               .docs[index]
//                                                                   ['oprice']
//                                                               .toString(),
//                                                       style: GoogleFonts.lato(
//                                                         textStyle: TextStyle(
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .w700,
//                                                             color:
//                                                                 Colors.black,
//                                                             fontSize: 15,
//                                                             letterSpacing: 0),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 width: 30,
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   });
//                             }
//                           }),
//                     ),

//     );
    
//   }
// }