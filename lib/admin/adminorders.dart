// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mine/HomeScreenWidgets/HomeWidgets.dart';
// import 'package:mine/helpers/mobilewidgets.dart';
// import 'package:mine/helpers/responsive_widget.dart';
// import 'package:mine/users/views/HomePage.dart';
// import 'package:mine/vieworder.dart';
// import '../Widgets/Custom_Widgets.dart';
// import '../users/views/Helper.dart';
// import 'helper.dart';

// class AdminOrders extends StatefulWidget {
//   @override
//   _AdminOrdersState createState() => _AdminOrdersState();
// }

// class _AdminOrdersState extends State<AdminOrders> {



// List uidlist = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
    
//     FirebaseFirestore.instance
//                         .collection("orders").get().then((value) {

//                        value.docs.forEach((element) {
//                         print(element.id);
//                        });
                          
//                         },);
                        
                        
                        

//   }
//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//               size: 15,
//             )),
//         elevation: 0,
//         backgroundColor: Color.fromRGBO(204, 191, 171, 1),
//         title: WidgetHelper.subtext("User Orders", 16, Colors.black),
//       ),
//       body: ResponsiveWidget(
       
//         desktop: SingleChildScrollView(
//           child: Column(
//             children: [
//     //           Container(
//     //   height: 50,
//     //   color: Color.fromRGBO(204, 191, 171, 1),
//     //   child: Row(
//     //     mainAxisAlignment: MainAxisAlignment.center,
//     //     children: [
//     //      Text(
//     //   "User Orders",
//     //   textAlign: TextAlign.center,
//     //   style: GoogleFonts.nunitoSans(
//     //     textStyle: const TextStyle(
//     //         fontWeight: FontWeight.bold,
//     //         color: Colors.black,
//     //         fontSize: 15,
//     //         letterSpacing: 1),
//     //   ),
//     // ),
//     //     ],
//     //   ),
//     // ),



//               Box(height: 0, width: 0),
//               Container(
//                 color: Color.fromRGBO(230, 224, 215, 1),
//                 height: MediaQuery.of(context).size.width,
//                 width: MediaQuery.of(context).size.width,
//                 child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection("adminorders")
                   
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                        if (!snapshot.hasData) {
//                           return Center(child: CircularProgressIndicator());
//                         } 
//                       if (snapshot.data!.docs.length == 0) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: 100,
//                               ),
//                               Text(
//                                   "NO ORDERS",
//                                   style: GoogleFonts.nunitoSans(
//                                     textStyle: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         letterSpacing: 6),
//                                   ),
//                                 ),
//                               SizedBox(
//                                 height: 20,
//                               ),
                              
//                             ],
//                           ),
//                         );
//                       }
//                       if (!snapshot.hasData) {
//                         return Center(child: CircularProgressIndicator());
//                       } else {
//                         return Scrollbar(
//                           //   isAlwaysShown: true,
//                           //
//                           //

//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10.0, right: 10, bottom: 10, top: 10),
//                             child: ListView.builder(
//                                 primary: false,
//                                 shrinkWrap: true,
//                                 // physics: NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: snapshot.data!.docs.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       // Navigator.push(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //         builder: (context) => DetailScreen(
//                                       //               queryDocumentSnapshot:
//                                       //                   snapshot.data.docs[index],
//                                       //             )));
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         height: 300,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             // color: Colors.brown[200]!
//                                             //     .withOpacity(0.4),
//                                             borderRadius:
//                                                 BorderRadius.circular(5)),
//                                         child: Column(
//                                           children: [
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   height: 64,
//                                                   width: 300,
//                                                   child: Column(
//                                                     children: [
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(6.0),
//                                                         child: Row(
//                                                           children: [
//                                                             SizedBox(
//                                                               width: 10,
//                                                             ),
//                                                             Container(
//                                                               height: 15,
//                                                               width: 15,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors
//                                                                           .green[
//                                                                       200],
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 6,
//                                                             ),
//                                                             Text(
//                                                               "Order Placed : " +
//                                                                   snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                           index]
//                                                                           [
//                                                                           "odate"]
//                                                                       .toUpperCase(),
//                                                               style: GoogleFonts
//                                                                   .nunitoSans(
//                                                                 textStyle: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         12,
//                                                                     letterSpacing:
//                                                                         1),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),

//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(6.0),
//                                                         child: Row(
//                                                           children: [
//                                                             SizedBox(
//                                                               width: 10,
//                                                             ),
//                                                             Container(
//                                                               height: 15,
//                                                               width: 15,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors
//                                                                           .green[
//                                                                       200],
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 6,
//                                                             ),
//                                                             Text(
//                                                               "Order Id : " +
//                                                                   snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                           index]
//                                                                           ["payid"]
//                                                                       .toString()
//                                                                       .substring(
//                                                                           4)
//                                                                       .toUpperCase(),
//                                                               style: GoogleFonts
//                                                                   .nunitoSans(
//                                                                 textStyle: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         12,
//                                                                     letterSpacing:
//                                                                         1),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),

                                            
//                                                       //  Padding(
//                                                       //    padding: const EdgeInsets.all(6.0),
//                                                       //    child: Row(
//                                                       //     children: [
//                                                       //           SizedBox(width: 10,),
//                                                       //      Container(
//                                                       //        height: 15,
//                                                       //        width: 15,
//                                                       //        decoration: BoxDecoration(
//                                                       //          color: Colors.green[200],shape: BoxShape.circle
//                                                       //        ),
//                                                       //      ),
//                                                       //      SizedBox(width: 6,),
//                                                       //     Text(
//                                                       //       "Payment Status : " +
//                                                       //           snapshot
//                                                       //               .data!
//                                                       //               .docs[index]
//                                                       //                   ["payment"]
//                                                       //               .toUpperCase(),
//                                                       //       style: GoogleFonts.nunitoSans(
//                                                       //         textStyle: TextStyle(
//                                                       //             fontWeight:
//                                                       //                 FontWeight
//                                                       //                   .bold,
//                                                       //             color:
//                                                       //                 Colors.black,
//                                                       //             fontSize: 12,
//                                                       //             letterSpacing: 0),
//                                                       //       ),
//                                                       //     ),

//                                                       //     ],
//                                                       // ),
//                                                       //  ),
//                                                       //  Padding(
//                                                       //    padding: const EdgeInsets.all(6.0),
//                                                       //    child: Row(
//                                                       //     children: [
//                                                       //           // SizedBox(width: 10,),
//                                                       //     //  Container(
//                                                       //     //    height: 15,
//                                                       //     //    width: 15,
//                                                       //     //    decoration: BoxDecoration(
//                                                       //     //      color: Colors.green[200],shape: BoxShape.circle
//                                                       //     //    ),
//                                                       //     //  ),
//                                                       //     //  SizedBox(width: 6,),
//                                                       //     // Text(
//                                                       //     //   "Order Status : " +
//                                                       //     //       snapshot
//                                                       //     //           .data!
//                                                       //     //           .docs[index]
//                                                       //     //               ["status"]
//                                                       //     //           .toUpperCase(),
//                                                       //     //   style: GoogleFonts.nunitoSans(
//                                                       //     //     textStyle: TextStyle(
//                                                       //     //         fontWeight:
//                                                       //     //             FontWeight
//                                                       //     //               .bold,
//                                                       //     //         color:
//                                                       //     //             Colors.black,
//                                                       //     //         fontSize: 12,
//                                                       //     //         letterSpacing: 0),
//                                                       //     //   ),
//                                                       //     // ),

//                                                       //     ],
//                                                       // ),
//                                                       //  )
//                                                     ],
//                                                   ),
//                                                   color: Colors.white,
//                                                 ),
                                               


//                                                 Spacer(),
                                               
//                                                 InkWell(
//                                                   onTap: (){
                                                  

//                                                      FirebaseFirestore.instance.collection("orders").doc(snapshot.data!.docs[index]['uid'])
//                                                     .collection("items")
//                                                     .doc(snapshot.data!.docs[index]['payid']).update({
//                                                       "status":"Order Delivered"
//                                                     });
//                                                   },
//                                                   child: Container(
//                                                       height: 40,
//                                                       width: 150,
//                                                       decoration: BoxDecoration(
//                                                           color:

                                                        
                                                          
                                                          
//                                                            Colors.green[200],
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(20)),
//                                                       child: Center(
//                                                         child: Text(
//                                                           "Change Status",
//                                                           style:
//                                                               GoogleFonts.nunitoSans(
//                                                             textStyle: TextStyle(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .bold,
//                                                                 color:
//                                                                     Colors.black,
//                                                                 fontSize: 14,
//                                                                 letterSpacing: 0),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                 ),

//                                                 //doher
// //                                                 InkWell(
// //                                                   onTap: () {
// //                                                     Get.dialog(Row(
// //                                                       mainAxisAlignment:
// //                                                           MainAxisAlignment
// //                                                               .center,
// //                                                       children: [
// //                                                         Padding(
// //                                                           padding:
// //                                                               const EdgeInsets
// //                                                                   .all(8.0),
// //                                                           child: Container(
// //                                                             child: Padding(
// //                                                               padding:
// //                                                                   const EdgeInsets
// //                                                                           .all(
// //                                                                       20.0),
// //                                                               child: Column(
// //                                                                 crossAxisAlignment:
// //                                                                     CrossAxisAlignment
// //                                                                         .center,
// //                                                                 children: [
// //                                                                   SizedBox(
// //                                                                     height: 10,
// //                                                                   ),
// //                                                                   Row(
// //                                                                     children: [
// //                                                                       Text(
// //                                                                         "Your Order Confirmed !!!",
// //                                                                         style: GoogleFonts
// //                                                                             .nunitoSans(
// //                                                                           textStyle: TextStyle(
// //                                                                               fontWeight: FontWeight.bold,
// //                                                                               color: Colors.black,
// //                                                                               fontSize: 16,
// //                                                                               letterSpacing: 0),
// //                                                                         ),
// //                                                                       ),
                                                                     
// //                                                                     ],
// //                                                                   ),
// //                                                                   SizedBox(
// //                                                                     height: 15,
// //                                                                   ),
// //                                                                   Container(
// //                                                                     height: 0.5,
// //                                                                     color: Colors
// //                                                                         .black,
// //                                                                   ),
// //                                                                   Container(
// //                                                                     height: 80,
// //                                                                     child: Row(
// //                                                                       children: [
// //                                                                         Padding(
// //                                                                           padding:
// //                                                                               const EdgeInsets.all(8.0),
// //                                                                           child:
// //                                                                               Column(
// //                                                                             children: [
// //                                                                               Text(
// //                                                                                 "Order Date",
// //                                                                                 style: GoogleFonts.nunitoSans(
// //                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14, letterSpacing: 0),
// //                                                                                 ),
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 height: 6,
// //                                                                               ),
// //                                                                               Text(
// //                                                                                 snapshot.data!.docs[index]["date"].toUpperCase(),
// //                                                                                 style: GoogleFonts.nunitoSans(
// //                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54, fontSize: 12, letterSpacing: 0),
// //                                                                                 ),
// //                                                                               ),
// //                                                                             ],
// //                                                                           ),
// //                                                                         ),
// //                                                                         Spacer(),
// //                                                                         Padding(
// //                                                                           padding:
// //                                                                               const EdgeInsets.all(10.0),
// //                                                                           child:
// //                                                                               Column(
// //                                                                             children: [
// //                                                                               Text(
// //                                                                                 "Address",
// //                                                                                 style: GoogleFonts.nunitoSans(
// //                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14, letterSpacing: 0),
// //                                                                                 ),
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 height: 0,
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 height: 40,
// //                                                                                 width: 200,
// //                                                                                 child: StreamBuilder<QuerySnapshot>(
// //                                                                                     stream: FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString("uid")).collection("address").where("id", isEqualTo: snapshot.data!.docs[index]["address"].toString()).snapshots(),
// //                                                                                     builder: (context, snapshot) {
// //                                                                                       return !snapshot.hasData
// //                                                                                           ? Center(
// //                                                                                               child: CircularProgressIndicator(),
// //                                                                                             )
// //                                                                                           : snapshot.data!.docs.length == 0
// //                                                                                               ? SizedBox()
// //                                                                                               : ListView.builder(
// //                                                                                                   physics: NeverScrollableScrollPhysics(),
// //                                                                                                   itemBuilder: (context, index) {
// //                                                                                                     return Padding(
// //                                                                                                       padding: const EdgeInsets.only(top: 0.0),
// //                                                                                                       child: GestureDetector(
// //                                                                                                         onTap: () {},
// //                                                                                                         child: Column(
// //                                                                                                           mainAxisAlignment: MainAxisAlignment.center,
// //                                                                                                           children: [
// //                                                                                                             Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
// //                                                                                                             Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
// //                                                                                                             Text(snapshot.data!.docs[index]['country'] + " - " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
// //                                                                                                           ],
// //                                                                                                         ),
// //                                                                                                       ),
// //                                                                                                     );
// //                                                                                                   },
// //                                                                                                   itemCount: snapshot.data!.docs.length,
// //                                                                                                   shrinkWrap: true,
// //                                                                                                 );
// //                                                                                     }),
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 width: 10,
// //                                                                               )
// //                                                                             ],
// //                                                                           ),
// //                                                                         )
// //                                                                       ],
// //                                                                     ),
// //                                                                     // color: Colors.green,
// //                                                                   ),
// //                                                                   Container(
// //                                                                     height: 0.5,
// //                                                                     color: Colors
// //                                                                         .black,
// //                                                                   ),
// //                                                                  Container(
// //                                                     height: 150,
// //                                                     decoration: BoxDecoration(
// //                                                         color: Colors.grey[200],
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(5)),
// //                                                     child: SizedBox(
// //                                                       height: 150,
// //                                                       child: StreamBuilder<
// //                                                               QuerySnapshot>(
// //                                                           stream: FirebaseFirestore
// //                                                               .instance
// //                                                               .collection(
// //                                                                   "orders")
// //                                                               .doc(MRANDMRS
// //                                                                   .sharedprefs!
// //                                                                   .getString(
// //                                                                       "uid"))
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .doc(snapshot
// //                                                                       .data!
// //                                                                       .docs[
// //                                                                   index]["id"])
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .snapshots(),
// //                                                           builder: (context,
// //                                                               snapshot) {
// //                                                             if (!snapshot
// //                                                                 .hasData) {
// //                                                               return Center(
// //                                                                   child:
// //                                                                       CircularProgressIndicator());
// //                                                             } else {
// //                                                               return Scrollbar(
// //                                                                 //   isAlwaysShown: true,

// //                                                                 child: ListView
// //                                                                     .builder(
// //                                                                         scrollDirection:
// //                                                                             Axis
// //                                                                                 .horizontal,
// //                                                                         //                     gridDelegate:
// //                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

// //                                                                         itemCount: snapshot
// //                                                                             .data!
// //                                                                             .docs
// //                                                                             .length,
// //                                                                         itemBuilder:
// //                                                                             (BuildContext context,
// //                                                                                 int index) {
// //                                                                           return Padding(
// //                                                                             padding:
// //                                                                                 const EdgeInsets.all(10.0),
// //                                                                             child:
// //                                                                                 GestureDetector(
// //                                                                               onTap: () {
// //                                                                                 // Navigator.push(
// //                                                                                 //     context,
// //                                                                                 //     MaterialPageRoute(
// //                                                                                 //         builder: (context) =>
// //                                                                                 //             DetailScreen(
// //                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
// //                                                                                 //             )));
// //                                                                               },
// //                                                                               child: Container(
// //                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
// //                                                                                 height: 142,
// //                                                                                 child: Column(
// //                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                                                                                   children: [
// //                                                                                     Container(
// //                                                                                       height: 80,
// //                                                                                       width: 150,
// //                                                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
// //                                                                                     ),
// //                                                                                     Text(
// //                                                                                       snapshot.data!.docs[index]['name'],
// //                                                                                       style: GoogleFonts.nunitoSans(
// //                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                       ),
// //                                                                                     ),
// //                                                                                     Row(
                                                                                      
// //                                                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                                                                                       children: [
// //                                                                                         Text(
// //                                                                                           "Quantity : " + snapshot.data!.docs[index]['quanity'].toString(),
// //                                                                                           style: GoogleFonts.nunitoSans(
// //                                                                                             textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                           ),
// //                                                                                         ),
// //                                                                                         SizedBox(width: 30,)
// // ,                                                                                         Text(
// //                                                                                       "₹" + snapshot.data!.docs[index]['oprice'].toString(),
// //                                                                                       style: GoogleFonts.nunitoSans(
// //                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                       ),
// //                                                                                     ),
// //                                                                                       ],
// //                                                                                     ),
                                                                                   
// //                                                                                   ],
// //                                                                                 ),
// //                                                                               ),
// //                                                                             ),
// //                                                                           );
// //                                                                         }),
// //                                                               );
// //                                                             }
                                                          
                                                  
                                                
                                              
// //                                             ////
                                        
                                      
                                
// //                                 })),)
                    
// //               ,      
            
            
// //              Container(
// //                                                     height: 250,
// //                                                     decoration: BoxDecoration(
// //                                                         color: Colors.grey[200],
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(5)),
// //                                                     child: SizedBox(
// //                                                       height: 150,
// //                                                       child: StreamBuilder<
// //                                                               QuerySnapshot>(
// //                                                           stream: FirebaseFirestore
// //                                                               .instance
// //                                                               .collection(
// //                                                                   "orders")
// //                                                               .doc(MRANDMRS
// //                                                                   .sharedprefs!
// //                                                                   .getString(
// //                                                                       "uid"))
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .doc(snapshot
// //                                                                       .data!
// //                                                                       .docs[
// //                                                                   index]["id"])
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .snapshots(),
// //                                                           builder: (context,
// //                                                               snapshot) {
// //                                                             if (!snapshot
// //                                                                 .hasData) {
// //                                                               return Center(
// //                                                                   child:
// //                                                                       CircularProgressIndicator());
// //                                                             } else {
// //                                                               return Scrollbar(
// //                                                                 //   isAlwaysShown: true,

// //                                                                 child: ListView
// //                                                                     .builder(
// //                                                                         scrollDirection:
// //                                                                             Axis
// //                                                                                 .vertical,
// //                                                                         //                     gridDelegate:
// //                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

// //                                                                         itemCount: snapshot
// //                                                                             .data!
// //                                                                             .docs
// //                                                                             .length,
// //                                                                         itemBuilder:
// //                                                                             (BuildContext context,
// //                                                                                 int index) {
// //                                                                           return Padding(
// //                                                                             padding:
// //                                                                                 const EdgeInsets.all(10.0),
// //                                                                             child:
// //                                                                                 GestureDetector(
// //                                                                               onTap: () {
// //                                                                                 // Navigator.push(
// //                                                                                 //     context,
// //                                                                                 //     MaterialPageRoute(
// //                                                                                 //         builder: (context) =>
// //                                                                                 //             DetailScreen(
// //                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
// //                                                                                 //             )));
// //                                                                               },
// //                                                                               child: Container(
// //                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
// //                                                                                 height: 40,
// //                                                                                 child: Row(
// //                                                                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                                                                   children: [
// //                                                                                     // Container(
// //                                                                                     //   height: 80,
// //                                                                                     //   width: 150,
// //                                                                                     //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
// //                                                                                     // ),
// //                                                                                     SizedBox(width: 10,),
// //                                                                                     Container(
// //                                                                                       width: 100,
// //                                                                                       child: Text(
// //                                                                                         snapshot.data!.docs[index]['name'],
// //                                                                                         style: GoogleFonts.nunitoSans(
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                         ),
// //                                                                                       ),
// //                                                                                     ),
// //                                                                                     Spacer(),
                                                                                   
// //                                                                                         Container(
// //                                                                                           width: 60,
// //                                                                                           child: Text(
// //                                                                                             "Quantity : " + snapshot.data!.docs[index]['quanity'].toString(),
// //                                                                                             style: GoogleFonts.nunitoSans(
// //                                                                                               textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                             ),
// //                                                                                           ),
// //                                                                                         ),
// //                                                                                         SizedBox(width: 20,)
// // ,                                                                                         Container(
// //   width: 60,
// //   child:   Text("CGST : ${(snapshot.data!.docs[index]['cgst'] * snapshot.data!.docs[index]['quanity'])}",                       
  
// //                                                                                         style: GoogleFonts.nunitoSans(
  
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
// //                                                                                         ),
  
  
  
                                                                                        
  
                                                                                     
  
// //                                                                                       ),
// // ),
// //                                                                                       SizedBox(width: 20,)
// // ,                                                                                         Container(
// //   width: 60,
// //   child:   Text(
   
    
// //     "SGST : ${(snapshot.data!.docs[index]['sgst'] * snapshot.data!.docs[index]['quanity'])}",           
  
// //                                                                                         style: GoogleFonts.nunitoSans(
  
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
// //                                                                                         ),
  
                                                                                        
  
                                                                                        
  
                                                                                     
  
// //                                                                                       ),
// // ),
// //                                                                                      SizedBox(width: 30,)
// // ,                                                                                         Container(
// //   width: 60,
// //   child:   Text("Total : ₹ ${(snapshot.data!.docs[index]['oprice'] * snapshot.data!.docs[index]['quanity'])}",
  
// //                                                                                         style: GoogleFonts.nunitoSans(
  
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
// //                                                                                         ),
  
                                                                                        
  
                                                                                     
  
// //                                                                                       ),
// // ),
// //                                                                                    SizedBox(width: 0,)
// //                                                                                   ],
// //                                                                                 ),
// //                                                                               ),
// //                                                                             ),
// //                                                                           );
// //                                                                         }),
// //                                                               );
// //                                                             }
                                                          
                                                  
                                                
                                              
// //                                             ////
                                        
                                      
                                
// //                                 })),)
                    
                    
            
            
// //                                                                 ],
// //                                                               ),
// //                                                             ),
// //                                                             color: Colors.white,
// //                                                             height: MediaQuery.of(
// //                                                                         context)
// //                                                                     .size
// //                                                                     .width /
// //                                                                 1.2,
// //                                                             width: MediaQuery.of(
// //                                                                             context)
// //                                                                         .size
// //                                                                         .width >
// //                                                                     400
// //                                                                 ? 500
// //                                                                 : MediaQuery.of(
// //                                                                             context)
// //                                                                         .size
// //                                                                         .width -
// //                                                                     30,
// //                                                           ),
// //                                                         ),
// //                                                       ],
// //                                                     ));
// //                                                   },
// //                                                   child: Container(
// //                                                     height: 40,
// //                                                     width: 150,
// //                                                     decoration: BoxDecoration(
// //                                                         color: Color.fromRGBO(
// //                                                             242, 242, 239, 1),
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(20)),
// //                                                     child: Center(
// //                                                       child: Text(
// //                                                         "View Order Details",
// //                                                         style:
// //                                                             GoogleFonts.nunitoSans(
// //                                                           textStyle: TextStyle(
// //                                                               fontWeight:
// //                                                                   FontWeight
// //                                                                       .bold,
// //                                                               color:
// //                                                                   Colors.black,
// //                                                               fontSize: 12,
// //                                                               letterSpacing: 0),
// //                                                         ),
// //                                                       ),
// //                                                     ),
// //                                                   ),
// //                                                 ),
//                                                 SizedBox(
//                                                   width: 20,
//                                                 ),
//  SizedBox(
//                                                                                 height: 40,
//                                                                                 width: 200,
//                                                                                 child: StreamBuilder<QuerySnapshot>(
//                                                                                     stream: FirebaseFirestore.instance.collection("users")
//                                                                                     .doc(snapshot.data!.docs[index]["uid"])
//                                                                                     .collection("address").where("id", isEqualTo: snapshot.data!.docs[index]["oaddress"].toString()).snapshots(),
//                                                                                     builder: (context, snapshot) {
//                                                                                       return !snapshot.hasData
//                                                                                           ? Center(
//                                                                                               child: CircularProgressIndicator(),
//                                                                                             )
//                                                                                           : snapshot.data!.docs.length == 0
//                                                                                               ? SizedBox()
//                                                                                               : ListView.builder(
//                                                                                                   physics: NeverScrollableScrollPhysics(),
//                                                                                                   itemBuilder: (context, index) {
//                                                                                                     return Padding(
//                                                                                                       padding: const EdgeInsets.only(top: 0.0),
//                                                                                                       child: GestureDetector(
//                                                                                                         onTap: () {},
//                                                                                                         child: Column(
//                                                                                                           mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                           children: [
//                                                                                                             Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                             Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                             Text(snapshot.data!.docs[index]['country'] + " - " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                           ],
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     );
//                                                                                                   },
//                                                                                                   itemCount: snapshot.data!.docs.length,
//                                                                                                   shrinkWrap: true,
//                                                                                                 );
//                                                                                     }),
//                                                                               ),

//                                                 //here
//                                                 //   SizedBox(
//                                                 //     height: 84,
//                                                 //     width: 300,

//                                                 //     child: StreamBuilder<
//                                                 //             QuerySnapshot>(
//                                                 //         stream: FirebaseFirestore
//                                                 //             .instance
//                                                 //             .collection("users")
//                                                 //             .doc(MRANDMRS
//                                                 //                 .sharedprefs!
//                                                 //                 .getString(
//                                                 //                     "uid"))
//                                                 //             .collection(
//                                                 //                 "address")
//                                                 //             .where("id",
//                                                 //                 isEqualTo:
//                                                 //                      snapshot
//                                                 //                 .data!
//                                                 //                 .docs[index]
//                                                 //                     ["address"]
//                                                 //                         .toString())
//                                                 //             .snapshots(),
//                                                 //         builder: (context,
//                                                 //             snapshot) {
//                                                 //           return !snapshot
//                                                 //                   .hasData
//                                                 //               ? Center(
//                                                 //                   child:
//                                                 //                       CircularProgressIndicator(),
//                                                 //                 )
//                                                 //               : snapshot
//                                                 //                           .data!
//                                                 //                           .docs
//                                                 //                           .length ==
//                                                 //                       0
//                                                 //                   ? SizedBox()
//                                                 //                   : ListView
//                                                 //                       .builder(
//                                                 //                       physics:
//                                                 //                           NeverScrollableScrollPhysics(),
//                                                 //                       itemBuilder:
//                                                 //                           (context,
//                                                 //                               index) {
//                                                 //                         return Padding(
//                                                 //                           padding:
//                                                 //                               const EdgeInsets.only(top: 0.0),
//                                                 //                           child:
//                                                 //                               GestureDetector(
//                                                 //                             onTap:
//                                                 //                                 () {},
//                                                 //                             child:
//                                                 //                                 Padding(
//                                                 //                                   padding: const EdgeInsets.all(2.0),
//                                                 //                                   child: Container(
//                                                 //                                     height: 84,
//                                                 //                               child: Column(
//                                                 //                                   mainAxisAlignment: MainAxisAlignment.center,
//                                                 //                                   children: [
//                                                 //                                     Text("Address : ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 1))),

//                                                 //                                     Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                                 //                                     Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                                 //                                     Text(snapshot.data!.docs[index]['country'] + " / " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                                 //                                   ],
//                                                 //                               ),
//                                                 //                               decoration: BoxDecoration(
//                                                 //                                   // border: Border.all(
//                                                 //                                   //   color: Colors.black
//                                                 //                                   //   ,width: 0.5
//                                                 //                                   // ),
//                                                 //                                   color: Colors.grey[100],
//                                                 //                                   borderRadius: BorderRadius.circular(4),
//                                                 //                               ),
//                                                 //                             ),
//                                                 //                                 ),
//                                                 //                           ),
//                                                 //                         );
//                                                 //                       },
//                                                 //                       itemCount: snapshot
//                                                 //                           .data!
//                                                 //                           .docs
//                                                 //                           .length,
//                                                 //                       shrinkWrap:
//                                                 //                           true,
//                                                 //                     );
//                                                 //         }),
//                                                 //   ),
//                                                 //   SizedBox(width: 10,)
//                                               ],
//                                             ),

//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.grey[200],
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5)),
//                                                 height: 200,
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 1.0,
//                                                           right: 1.0),
//                                                   child: Container(
//                                                     height: 250,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[200],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: SizedBox(
//                                                       height: 150,
//                                                       child: StreamBuilder<
//                                                               QuerySnapshot>(
//                                                           stream: FirebaseFirestore
//                                                               .instance
//                                                               .collection(
//                                                                   "adminorders").where( "payid",isEqualTo: snapshot.data!.docs[index]['payid']).where('id',isEqualTo: snapshot.data!.docs[index]['id'])                                                              
//                                                               .snapshots(),
//                                                           builder: (context,
//                                                               snapshot) {
//                                                             if (!snapshot
//                                                                 .hasData) {
//                                                               return Center(
//                                                                   child:
//                                                                       CircularProgressIndicator());
//                                                             } else {
//                                                               return Scrollbar(
//                                                                 //   isAlwaysShown: true,

//                                                                 child: ListView
//                                                                     .builder(
//                                                                         scrollDirection:
//                                                                             Axis
//                                                                                 .horizontal,
//                                                                         //                     gridDelegate:
//                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

//                                                                         itemCount: snapshot
//                                                                             .data!
//                                                                             .docs
//                                                                             .length,
//                                                                         itemBuilder:
//                                                                             (BuildContext context,
//                                                                                 int index) {
//                                                                           return Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.all(10.0),
//                                                                             child:
//                                                                                 GestureDetector(
//                                                                               onTap: () {
//                                                                                 // Navigator.push(
//                                                                                 //     context,
//                                                                                 //     MaterialPageRoute(
//                                                                                 //         builder: (context) =>
//                                                                                 //             DetailScreen(
//                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
//                                                                                 //             )));
//                                                                               },
//                                                                               child: Container(
//                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                                                                                 height: 162,
//                                                                                 child: Column(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                   children: [
//                                                                                     Container(
//                                                                                       height: 100,
//                                                                                       width: 200,
//                                                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       snapshot.data!.docs[index]['name'],
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       "QUANTITY : " + snapshot.data!.docs[index]['quanity'].toString(),
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       "₹" + snapshot.data!.docs[index]['oprice'].toString(),
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           );
//                                                                         }),
//                                                               );
//                                                             }
//                                                           }),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             ////
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           ),
//                         );
//                       }
//                     }),
//               ),
//             ],
//           ),
//         ),
//          mobile: SingleChildScrollView(
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children: [
//                 TopMovileNotifyBlackBox(),
//                 MobileTitleWebBox(),
//                 Container(
//                   color: Color.fromRGBO(230, 224, 215, 1),
//                   height: MediaQuery.of(context).size.height - 210,
//                   width: MediaQuery.of(context).size.width,
//                   child: StreamBuilder<QuerySnapshot>(
//                       stream: FirebaseFirestore.instance
//                           .collection("orders")
//                           .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                           .collection("items")
//                           .snapshots(),
//                       builder: (context, snapshot) {
//                         if (!snapshot.hasData) {
//                           return Center(child: CircularProgressIndicator());
//                         } 
//                         if (snapshot.data!.docs.length == 0) {
//                           return Center(
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "NO ORDERS",
//                                   style: GoogleFonts.nunitoSans(
//                                     textStyle: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         letterSpacing: 6),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                                               ],
//                             ),
//                           );
//                         }
//                         if (!snapshot.hasData) {
//                           return Center(child: CircularProgressIndicator());
//                         } else {
//                           return Scrollbar(
//                             //   isAlwaysShown: true,
//                             //
//                             //

//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 10.0, right: 10, bottom: 10, top: 10),
//                               child: ListView.builder(
//                                   primary: false,
//                                   shrinkWrap: true,
//                                   // physics: NeverScrollableScrollPhysics(),
//                                   scrollDirection: Axis.vertical,
//                                   itemCount: snapshot.data!.docs.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     return GestureDetector(
//                                       onTap: () {
//                                         // Navigator.push(
//                                         //     context,
//                                         //     MaterialPageRoute(
//                                         //         builder: (context) => DetailScreen(
//                                         //               queryDocumentSnapshot:
//                                         //                   snapshot.data.docs[index],
//                                         //             )));
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           height: 342,
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               // color: Colors.brown[200]!
//                                               //     .withOpacity(0.4),
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           child: Column(
//                                             children: [
//                                               Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.center,
//                                                 children: [
//                                                   Container(
//                                                     height: 63,
//                                                     width: 300,
//                                                     child: Column(
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(4.0),
//                                                           child: Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 10,
//                                                               ),
//                                                               Container(
//                                                                 height: 8,
//                                                                 width: 8,
//                                                                 decoration: BoxDecoration(
//                                                                     color: Colors
//                                                                             .green[
//                                                                         200],
//                                                                     shape: BoxShape
//                                                                         .circle),
//                                                               ),
//                                                               SizedBox(
//                                                                 width: 6,
//                                                               ),
//                                                               Text(
//                                                                 "Order Placed : " +
//                                                                     snapshot
//                                                                         .data!
//                                                                         .docs[
//                                                                             index]
//                                                                             [
//                                                                             "date"]
//                                                                         .toUpperCase(),
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .nunitoSans(
//                                                                   textStyle: TextStyle(
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold,
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           12,
//                                                                       letterSpacing:
//                                                                           0),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                         //  Padding(
//                                                         //    padding: const EdgeInsets.all(4.0),
//                                                         //    child: Row(
//                                                         //     children: [
//                                                         //           SizedBox(width: 10,),
//                                                         //      Container(
//                                                         //        height: 8,
//                                                         //        width: 8,
//                                                         //        decoration: BoxDecoration(
//                                                         //          color: Colors.green[200],shape: BoxShape.circle
//                                                         //        ),
//                                                         //      ),
//                                                         //      SizedBox(width: 6,),
//                                                         //     Text(
//                                                         //       "Payment Status : " +
//                                                         //           snapshot
//                                                         //               .data!
//                                                         //               .docs[index]
//                                                         //                   ["payment"]
//                                                         //               .toUpperCase(),
//                                                         //       style: GoogleFonts.nunitoSans(
//                                                         //         textStyle: TextStyle(
//                                                         //             fontWeight:
//                                                         //                 FontWeight
//                                                         //                   .bold,
//                                                         //             color:
//                                                         //                 Colors.black,
//                                                         //             fontSize: 12,
//                                                         //             letterSpacing: 0),
//                                                         //       ),
//                                                         //     ),

//                                                         //     ],
//                                                         // ),
//                                                         //  ),
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(4.0),
//                                                           child: Row(
//                                                             children: [
//                                                               SizedBox(
//                                                                 width: 10,
//                                                               ),
//                                                               Container(
//                                                                 height: 8,
//                                                                 width: 8,
//                                                                 decoration: BoxDecoration(
//                                                                     color: Colors
//                                                                             .green[
//                                                                         200],
//                                                                     shape: BoxShape
//                                                                         .circle),
//                                                               ),
//                                                               SizedBox(
//                                                                 width: 6,
//                                                               ),
//                                                               Text(
//                                                                 "Order Id : " +
//                                                                     snapshot
//                                                                         .data!
//                                                                         .docs[
//                                                                             index]
//                                                                             [
//                                                                             "id"]
//                                                                         .toString()
//                                                                         .substring(
//                                                                             4)
//                                                                         .toUpperCase(),
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .nunitoSans(
//                                                                   textStyle: TextStyle(
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .bold,
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           12,
//                                                                       letterSpacing:
//                                                                           0),
//                                                                 ),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     color: Colors.white,
//                                                   ),
//                                                 ],
//                                               ),

//                                               //  SizedBox(
//                                               //         height: 63,

//                                               //         child: StreamBuilder<
//                                               //                 QuerySnapshot>(
//                                               //             stream: FirebaseFirestore
//                                               //                 .instance
//                                               //                 .collection("users")
//                                               //                 .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                                               //                 .collection(
//                                               //                     "address")
//                                               //                 .where("id",
//                                               //                     isEqualTo:
//                                               //                         snapshot
//                                               //                         .data!
//                                               //                         .docs[index]
//                                               //                             ["id"])
//                                               //                 .snapshots(),
//                                               //             builder: (context,
//                                               //                 snapshot) {
//                                               //               return !snapshot
//                                               //                       .hasData
//                                               //                   ? Center(
//                                               //                       child:
//                                               //                           CircularProgressIndicator(),
//                                               //                     )
//                                               //                   : snapshot
//                                               //                               .data!
//                                               //                               .docs
//                                               //                               .length ==
//                                               //                           0
//                                               //                       ? SizedBox()
//                                               //                       : ListView
//                                               //                           .builder(
//                                               //                           physics:
//                                               //                               NeverScrollableScrollPhysics(),
//                                               //                           itemBuilder:
//                                               //                               (context,
//                                               //                                   index) {
//                                               //                             return Padding(
//                                               //                               padding:
//                                               //                                   const EdgeInsets.only(top: 0.0),
//                                               //                               child:
//                                               //                                   GestureDetector(
//                                               //                                 onTap:
//                                               //                                     () {},
//                                               //                                 child:
//                                               //                                     Padding(
//                                               //                                       padding: const EdgeInsets.only(left:4.0,right: 4,top:2,bottom: 2),
//                                               //                                       child: Container(
//                                               //                                         height: 63,

//                                               //                                   child: Column(
//                                               //                                       mainAxisAlignment: MainAxisAlignment.center,
//                                               //                                       children: [
//                                               //                                         Text("Address : ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 1))),

//                                               //                                         Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                               //                                         Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                               //                                         Text(snapshot.data!.docs[index]['country'] + " / " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                               //                                       ],
//                                               //                                   ),
//                                               //                                   decoration: BoxDecoration(
//                                               //                                       // border: Border.all(
//                                               //                                       //   color: Colors.black
//                                               //                                       //   ,width: 0.5
//                                               //                                       // ),
//                                               //                                       color: Colors.grey[100],
//                                               //                                       borderRadius: BorderRadius.circular(4),
//                                               //                                   ),
//                                               //                                 ),
//                                               //                                     ),
//                                               //                               ),
//                                               //                             );
//                                               //                           },
//                                               //                           itemCount: snapshot
//                                               //                               .data!
//                                               //                               .docs
//                                               //                               .length,
//                                               //                           shrinkWrap:
//                                               //                               true,
//                                               //                         );
//                                               //             }),
//                                               //       ),

//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width: 20,
//                                                   ),
// //                                                   InkWell(
// //                                                     onTap: () {
// //                                                       Get.dialog(
// //                                                         Row(
// //                                                       mainAxisAlignment:
// //                                                           MainAxisAlignment
// //                                                               .center,
// //                                                       children: [
// //                                                         Padding(
// //                                                           padding:
// //                                                               const EdgeInsets
// //                                                                   .all(8.0),
// //                                                           child: Container(
// //                                                             child: Padding(
// //                                                               padding:
// //                                                                   const EdgeInsets
// //                                                                           .all(
// //                                                                       20.0),
// //                                                               child: Column(
// //                                                                 crossAxisAlignment:
// //                                                                     CrossAxisAlignment
// //                                                                         .center,
// //                                                                 children: [
// //                                                                   SizedBox(
// //                                                                     height: 10,
// //                                                                   ),
// //                                                                   Row(
// //                                                                     children: [
// //                                                                       Text(
// //                                                                         "Your Order Confirmed !!!",
// //                                                                         style: GoogleFonts
// //                                                                             .nunitoSans(
// //                                                                           textStyle: TextStyle(
// //                                                                               fontWeight: FontWeight.bold,
// //                                                                               color: Colors.black,
// //                                                                               fontSize: 16,
// //                                                                               letterSpacing: 0),
// //                                                                         ),
// //                                                                       ),
                                                                     
// //                                                                     ],
// //                                                                   ),
// //                                                                   SizedBox(
// //                                                                     height: 15,
// //                                                                   ),
// //                                                                   Container(
// //                                                                     height: 0.5,
// //                                                                     color: Colors
// //                                                                         .black,
// //                                                                   ),
// //                                                                   Container(
// //                                                                     height: 80,
// //                                                                     child: Row(
// //                                                                       children: [
// //                                                                         Padding(
// //                                                                           padding:
// //                                                                               const EdgeInsets.all(8.0),
// //                                                                           child:
// //                                                                               Column(
// //                                                                             children: [
// //                                                                               Text(
// //                                                                                 "Order Date",
// //                                                                                 style: GoogleFonts.nunitoSans(
// //                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14, letterSpacing: 0),
// //                                                                                 ),
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 height: 6,
// //                                                                               ),
// //                                                                               Text(
// //                                                                                 snapshot.data!.docs[index]["date"].toUpperCase(),
// //                                                                                 style: GoogleFonts.nunitoSans(
// //                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54, fontSize: 12, letterSpacing: 0),
// //                                                                                 ),
// //                                                                               ),
// //                                                                             ],
// //                                                                           ),
// //                                                                         ),
// //                                                                         Spacer(),
// //                                                                         Padding(
// //                                                                           padding:
// //                                                                               const EdgeInsets.all(10.0),
// //                                                                           child:
// //                                                                               Column(
// //                                                                             children: [
// //                                                                               Text(
// //                                                                                 "Address",
// //                                                                                 style: GoogleFonts.nunitoSans(
// //                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14, letterSpacing: 0),
// //                                                                                 ),
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 height: 0,
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 height: 40,
// //                                                                                 width: 200,
// //                                                                                 child: StreamBuilder<QuerySnapshot>(
// //                                                                                     stream: FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString("uid")).collection("address").where("id", isEqualTo: snapshot.data!.docs[index]["address"].toString()).snapshots(),
// //                                                                                     builder: (context, snapshot) {
// //                                                                                       return !snapshot.hasData
// //                                                                                           ? Center(
// //                                                                                               child: CircularProgressIndicator(),
// //                                                                                             )
// //                                                                                           : snapshot.data!.docs.length == 0
// //                                                                                               ? SizedBox()
// //                                                                                               : ListView.builder(
// //                                                                                                   physics: NeverScrollableScrollPhysics(),
// //                                                                                                   itemBuilder: (context, index) {
// //                                                                                                     return Padding(
// //                                                                                                       padding: const EdgeInsets.only(top: 0.0),
// //                                                                                                       child: GestureDetector(
// //                                                                                                         onTap: () {},
// //                                                                                                         child: Column(
// //                                                                                                           mainAxisAlignment: MainAxisAlignment.center,
// //                                                                                                           children: [
// //                                                                                                             Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
// //                                                                                                             Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
// //                                                                                                             Text(snapshot.data!.docs[index]['country'] + " - " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
// //                                                                                                           ],
// //                                                                                                         ),
// //                                                                                                       ),
// //                                                                                                     );
// //                                                                                                   },
// //                                                                                                   itemCount: snapshot.data!.docs.length,
// //                                                                                                   shrinkWrap: true,
// //                                                                                                 );
// //                                                                                     }),
// //                                                                               ),
// //                                                                               SizedBox(
// //                                                                                 width: 10,
// //                                                                               )
// //                                                                             ],
// //                                                                           ),
// //                                                                         )
// //                                                                       ],
// //                                                                     ),
// //                                                                     // color: Colors.green,
// //                                                                   ),
// //                                                                   Container(
// //                                                                     height: 0.5,
// //                                                                     color: Colors
// //                                                                         .black,
// //                                                                   ),
// //                                                                  Container(
// //                                                     height: 130,
// //                                                     decoration: BoxDecoration(
// //                                                         color: Colors.grey[200],
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(5)),
// //                                                     child: SizedBox(
// //                                                       height: 130,
// //                                                       child: StreamBuilder<
// //                                                               QuerySnapshot>(
// //                                                           stream: FirebaseFirestore
// //                                                               .instance
// //                                                               .collection(
// //                                                                   "orders")
// //                                                               .doc(MRANDMRS
// //                                                                   .sharedprefs!
// //                                                                   .getString(
// //                                                                       "uid"))
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .doc(snapshot
// //                                                                       .data!
// //                                                                       .docs[
// //                                                                   index]["id"])
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .snapshots(),
// //                                                           builder: (context,
// //                                                               snapshot) {
// //                                                             if (!snapshot
// //                                                                 .hasData) {
// //                                                               return Center(
// //                                                                   child:
// //                                                                       CircularProgressIndicator());
// //                                                             } else {
// //                                                               return Scrollbar(
// //                                                                 //   isAlwaysShown: true,

// //                                                                 child: ListView
// //                                                                     .builder(
// //                                                                         scrollDirection:
// //                                                                             Axis
// //                                                                                 .horizontal,
// //                                                                         //                     gridDelegate:
// //                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

// //                                                                         itemCount: snapshot
// //                                                                             .data!
// //                                                                             .docs
// //                                                                             .length,
// //                                                                         itemBuilder:
// //                                                                             (BuildContext context,
// //                                                                                 int index) {
// //                                                                           return Padding(
// //                                                                             padding:
// //                                                                                 const EdgeInsets.all(10.0),
// //                                                                             child:
// //                                                                                 GestureDetector(
// //                                                                               onTap: () {
// //                                                                                 // Navigator.push(
// //                                                                                 //     context,
// //                                                                                 //     MaterialPageRoute(
// //                                                                                 //         builder: (context) =>
// //                                                                                 //             DetailScreen(
// //                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
// //                                                                                 //             )));
// //                                                                               },
// //                                                                               child: Container(
// //                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
// //                                                                                 height: 142,
// //                                                                                 child: Column(
// //                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                                                                                   children: [
// //                                                                                     Container(
// //                                                                                       height: 80,
// //                                                                                       width: 150,
// //                                                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
// //                                                                                     ),
// //                                                                                     Text(
// //                                                                                       snapshot.data!.docs[index]['name'],
// //                                                                                       style: GoogleFonts.nunitoSans(
// //                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                       ),
// //                                                                                     ),
// //                                                                                     Row(
                                                                                      
// //                                                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                                                                                       children: [
// //                                                                                         Text(
// //                                                                                           "Quantity : " + snapshot.data!.docs[index]['quanity'].toString(),
// //                                                                                           style: GoogleFonts.nunitoSans(
// //                                                                                             textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                           ),
// //                                                                                         ),
// //                                                                                         SizedBox(width: 30,)
// // ,                                                                                         Text(
// //                                                                                       "₹" + snapshot.data!.docs[index]['oprice'].toString(),
// //                                                                                       style: GoogleFonts.nunitoSans(
// //                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                       ),
// //                                                                                     ),
// //                                                                                       ],
// //                                                                                     ),
                                                                                   
// //                                                                                   ],
// //                                                                                 ),
// //                                                                               ),
// //                                                                             ),
// //                                                                           );
// //                                                                         }),
// //                                                               );
// //                                                             }
                                                          
                                                  
                                                
                                              
// //                                             ////
                                        
                                      
                                
// //                                 })),)
                    
// //               ,      
            
            
// //              Container(
// //                                                     height: 115,
// //                                                     decoration: BoxDecoration(
// //                                                         color: Colors.grey[200],
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(5)),
// //                                                     child: SizedBox(
// //                                                       height: 50,
// //                                                       child: StreamBuilder<
// //                                                               QuerySnapshot>(
// //                                                           stream: FirebaseFirestore
// //                                                               .instance
// //                                                               .collection(
// //                                                                   "orders")
// //                                                               .doc(MRANDMRS
// //                                                                   .sharedprefs!
// //                                                                   .getString(
// //                                                                       "uid"))
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .doc(snapshot
// //                                                                       .data!
// //                                                                       .docs[
// //                                                                   index]["id"])
// //                                                               .collection(
// //                                                                   "items")
// //                                                               .snapshots(),
// //                                                           builder: (context,
// //                                                               snapshot) {
// //                                                             if (!snapshot
// //                                                                 .hasData) {
// //                                                               return Center(
// //                                                                   child:
// //                                                                       CircularProgressIndicator());
// //                                                             } else {
// //                                                               return Scrollbar(
// //                                                                 //   isAlwaysShown: true,

// //                                                                 child: ListView
// //                                                                     .builder(
// //                                                                         scrollDirection:
// //                                                                             Axis
// //                                                                                 .vertical,
// //                                                                         //                     gridDelegate:
// //                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

// //                                                                         itemCount: snapshot
// //                                                                             .data!
// //                                                                             .docs
// //                                                                             .length,
// //                                                                         itemBuilder:
// //                                                                             (BuildContext context,
// //                                                                                 int index) {
// //                                                                           return Padding(
// //                                                                             padding:
// //                                                                                 const EdgeInsets.all(10.0),
// //                                                                             child:
// //                                                                                 GestureDetector(
// //                                                                               onTap: () {
// //                                                                                 // Navigator.push(
// //                                                                                 //     context,
// //                                                                                 //     MaterialPageRoute(
// //                                                                                 //         builder: (context) =>
// //                                                                                 //             DetailScreen(
// //                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
// //                                                                                 //             )));
// //                                                                               },
// //                                                                               child: Container(
// //                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
// //                                                                                 height: 40,
// //                                                                                 child: Row(
// //                                                                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                                                                   children: [
// //                                                                                     // Container(
// //                                                                                     //   height: 80,
// //                                                                                     //   width: 150,
// //                                                                                     //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
// //                                                                                     // ),
// //                                                                                     SizedBox(width: 10,),
// //                                                                                     Container(
// //                                                                                       width: 100,
// //                                                                                       child: Text(
// //                                                                                         snapshot.data!.docs[index]['name'],
// //                                                                                         style: GoogleFonts.nunitoSans(
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                         ),
// //                                                                                       ),
// //                                                                                     ),
// //                                                                                     Spacer(),
                                                                                   
// //                                                                                         Container(
// //                                                                                           width: 60,
// //                                                                                           child: Text(
// //                                                                                             "Quantity : " + snapshot.data!.docs[index]['quanity'].toString(),
// //                                                                                             style: GoogleFonts.nunitoSans(
// //                                                                                               textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
// //                                                                                             ),
// //                                                                                           ),
// //                                                                                         ),
// //                                                                                         SizedBox(width: 20,)
// // ,                                                                                         Container(
// //   width: 60,
// //   child:   Text("CGST : ${(snapshot.data!.docs[index]['cgst'] * snapshot.data!.docs[index]['quanity'])}",                       
  
// //                                                                                         style: GoogleFonts.nunitoSans(
  
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
// //                                                                                         ),
  
  
  
                                                                                        
  
                                                                                     
  
// //                                                                                       ),
// // ),
// //                                                                                       SizedBox(width: 20,)
// // ,                                                                                         Container(
// //   width: 60,
// //   child:   Text(
   
    
// //     "SGST : ${(snapshot.data!.docs[index]['sgst'] * snapshot.data!.docs[index]['quanity'])}",           
  
// //                                                                                         style: GoogleFonts.nunitoSans(
  
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
// //                                                                                         ),
  
                                                                                        
  
                                                                                        
  
                                                                                     
  
// //                                                                                       ),
// // ),
// //                                                                                      SizedBox(width: 30,)
// // ,                                                                                         Container(
// //   width: 60,
// //   child:   Text("Total : ₹ ${(snapshot.data!.docs[index]['oprice'] * snapshot.data!.docs[index]['quanity'])}",
  
// //                                                                                         style: GoogleFonts.nunitoSans(
  
// //                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
// //                                                                                         ),
  
                                                                                        
  
                                                                                     
  
// //                                                                                       ),
// // ),
// //                                                                                    SizedBox(width: 0,)
// //                                                                                   ],
// //                                                                                 ),
// //                                                                               ),
// //                                                                             ),
// //                                                                           );
// //                                                                         }),
// //                                                               );
// //                                                             }
                                                          
                                                  
                                                
                                              
// //                                             ////
                                        
                                      
                                
// //                                 })),)
                    
                    
            
            
// //                                                                 ],
// //                                                               ),
// //                                                             ),
// //                                                             color: Colors.white,
// //                                                             height: MediaQuery.of(
// //                                                                         context)
// //                                                                     .size
// //                                                                     .width /
// //                                                                 1.2,
// //                                                             width: MediaQuery.of(
// //                                                                             context)
// //                                                                         .size
// //                                                                         .width >
// //                                                                     400
// //                                                                 ? 500
// //                                                                 : MediaQuery.of(
// //                                                                             context)
// //                                                                         .size
// //                                                                         .width -
// //                                                                     30,
// //                                                           ),
// //                                                         ),
// //                                                       ],
// //                                                     ));
                                            
                                                      
// //                                                     },
// //                                                     child: Container(
// //                                                       height: 40,
// //                                                       width: 150,
// //                                                       decoration: BoxDecoration(
// //                                                           color: Color.fromRGBO(
// //                                                               242, 242, 239, 1),
// //                                                           borderRadius:
// //                                                               BorderRadius
// //                                                                   .circular(20)),
// //                                                       child: Center(
// //                                                         child: Text(
// //                                                           "View Order Details",
// //                                                           style:
// //                                                               GoogleFonts.nunitoSans(
// //                                                             textStyle: TextStyle(
// //                                                                 fontWeight:
// //                                                                     FontWeight
// //                                                                         .bold,
// //                                                                 color:
// //                                                                     Colors.black,
// //                                                                 fontSize: 12,
// //                                                                 letterSpacing: 0),
// //                                                           ),
// //                                                         ),
// //                                                       ),
// //                                                     ),
// //                                                   ),
//                                                 ],
//                                               ),
//                                                SizedBox(
//                                                                                 height: 40,
//                                                                                 width: 200,
//                                                                                 child: StreamBuilder<QuerySnapshot>(
//                                                                                     stream: FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString("uid")).collection("address").where("id", isEqualTo: snapshot.data!.docs[index]["address"].toString()).snapshots(),
//                                                                                     builder: (context, snapshot) {
//                                                                                       return !snapshot.hasData
//                                                                                           ? Center(
//                                                                                               child: CircularProgressIndicator(),
//                                                                                             )
//                                                                                           : snapshot.data!.docs.length == 0
//                                                                                               ? SizedBox()
//                                                                                               : ListView.builder(
//                                                                                                   physics: NeverScrollableScrollPhysics(),
//                                                                                                   itemBuilder: (context, index) {
//                                                                                                     return Padding(
//                                                                                                       padding: const EdgeInsets.only(top: 0.0),
//                                                                                                       child: GestureDetector(
//                                                                                                         onTap: () {},
//                                                                                                         child: Column(
//                                                                                                           mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                           children: [
//                                                                                                             Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                             Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                             Text(snapshot.data!.docs[index]['country'] + " - " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                           ],
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     );
//                                                                                                   },
//                                                                                                   itemCount: snapshot.data!.docs.length,
//                                                                                                   shrinkWrap: true,
//                                                                                                 );
//                                                                                     }),
//                                                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.grey[200],
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5)),
//                                                   height: 200,
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 1.0,
//                                                             right: 1.0),
//                                                     child: Container(
//                                                       height: 250,
//                                                       decoration: BoxDecoration(
//                                                           color:
//                                                               Colors.grey[200],
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(5)),
//                                                       child: SizedBox(
//                                                         height: 150,
//                                                         child: StreamBuilder<
//                                                                 QuerySnapshot>(
//                                                             stream: FirebaseFirestore
//                                                                 .instance
//                                                                 .collection(
//                                                                     "orders")
//                                                                 .doc(MRANDMRS
//                                                                     .sharedprefs!
//                                                                     .getString(
//                                                                         "uid"))
//                                                                 .collection(
//                                                                     "items")
//                                                                 .doc(snapshot
//                                                                         .data!
//                                                                         .docs[index]
//                                                                     ["id"])
//                                                                 .collection(
//                                                                     "items")
//                                                                 .snapshots(),
//                                                             builder: (context,
//                                                                 snapshot) {
//                                                               if (!snapshot
//                                                                   .hasData) {
//                                                                 return Center(
//                                                                     child:
//                                                                         CircularProgressIndicator());
//                                                               } else {
//                                                                 return Scrollbar(
//                                                                   //   isAlwaysShown: true,

//                                                                   child: ListView.builder(
//                                                                       scrollDirection: Axis.horizontal,
//                                                                       //                     gridDelegate:
//                                                                       // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

//                                                                       itemCount: snapshot.data!.docs.length,
//                                                                       itemBuilder: (BuildContext context, int index) {
//                                                                         return Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(10.0),
//                                                                           child:
//                                                                               GestureDetector(
//                                                                             onTap:
//                                                                                 () {
//                                                                               // Navigator.push(
//                                                                               //     context,
//                                                                               //     MaterialPageRoute(
//                                                                               //         builder: (context) =>
//                                                                               //             DetailScreen(
//                                                                               //               // queryDocumentSnapshot: snapshot.data.docs[index],
//                                                                               //             )));
//                                                                             },
//                                                                             child:
//                                                                                 Container(
//                                                                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                                                                               height: 162,
//                                                                               child: Column(
//                                                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                 children: [
//                                                                                   Container(
//                                                                                     height: 100,
//                                                                                     width: 200,
//                                                                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     snapshot.data!.docs[index]['name'],
//                                                                                     style: GoogleFonts.nunitoSans(
//                                                                                       textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                     ),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     "QUANTITY : " + snapshot.data!.docs[index]['quanity'].toString(),
//                                                                                     style: GoogleFonts.nunitoSans(
//                                                                                       textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                     ),
//                                                                                   ),
//                                                                                   Text(
//                                                                                     "₹" + snapshot.data!.docs[index]['oprice'].toString(),
//                                                                                     style: GoogleFonts.nunitoSans(
//                                                                                       textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         );
//                                                                       }),
//                                                                 );
//                                                               }
//                                                             }),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               ////
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   }),
//                             ),
//                           );
//                         }
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         tab: SingleChildScrollView(
//           child: Column(
//             children: [
//               TopNotifyBlackBox(),
//               TitleWebBox(),
//               Box(height: 0, width: 0),
//               Container(
//                 color: Color.fromRGBO(230, 224, 215, 1),
//                 height: MediaQuery.of(context).size.width,
//                 width: MediaQuery.of(context).size.width,
//                 child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection("orders")
//                         .doc(MRANDMRS.sharedprefs!.getString('uid'))
//                         .collection("items")
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                        if (!snapshot.hasData) {
//                           return Center(child: CircularProgressIndicator());
//                         } 
//                       if (snapshot.data!.docs.length == 0) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                                SizedBox(
//                                 height: 100,
//                               ),
//                                Text(
//                                   "NO ORDERS",
//                                   style: GoogleFonts.nunitoSans(
//                                     textStyle: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black,
//                                         fontSize: 15,
//                                         letterSpacing: 6),
//                                   ),
//                                 ),
//                               SizedBox(
//                                 height: 20,
//                               ),
                            
//                             ],
//                           ),
//                         );
//                       }
//                       if (!snapshot.hasData) {
//                         return Center(child: CircularProgressIndicator());
//                       } else {
//                         return Scrollbar(
//                           //   isAlwaysShown: true,
//                           //
//                           //

//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 10.0, right: 10, bottom: 10, top: 10),
//                             child: ListView.builder(
//                                 primary: false,
//                                 shrinkWrap: true,
//                                 // physics: NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: snapshot.data!.docs.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return GestureDetector(
//                                     onTap: () {
//                                       // Navigator.push(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //         builder: (context) => DetailScreen(
//                                       //               queryDocumentSnapshot:
//                                       //                   snapshot.data.docs[index],
//                                       //             )));
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Container(
//                                         height: 300,
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             // color: Colors.brown[200]!
//                                             //     .withOpacity(0.4),
//                                             borderRadius:
//                                                 BorderRadius.circular(5)),
//                                         child: Column(
//                                           children: [
//                                             Row(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                   height: 64,
//                                                   width: 300,
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(
//                                                         height: 8,
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(6.0),
//                                                         child: Row(
//                                                           children: [
//                                                             SizedBox(
//                                                               width: 10,
//                                                             ),
//                                                             Container(
//                                                               height: 15,
//                                                               width: 15,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors
//                                                                           .green[
//                                                                       200],
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 6,
//                                                             ),
//                                                             Text(
//                                                               "Order Placed : " +
//                                                                   snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                           index]
//                                                                           [
//                                                                           "date"]
//                                                                       .toUpperCase(),
//                                                               style: GoogleFonts
//                                                                   .nunitoSans(
//                                                                 textStyle: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         12,
//                                                                     letterSpacing:
//                                                                         0),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(6.0),
//                                                         child: Row(
//                                                           children: [
//                                                             SizedBox(
//                                                               width: 10,
//                                                             ),
//                                                             Container(
//                                                               height: 15,
//                                                               width: 15,
//                                                               decoration: BoxDecoration(
//                                                                   color: Colors
//                                                                           .green[
//                                                                       200],
//                                                                   shape: BoxShape
//                                                                       .circle),
//                                                             ),
//                                                             SizedBox(
//                                                               width: 6,
//                                                             ),
//                                                             Text(
//                                                               "Order Id : " +
//                                                                   snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                           index]
//                                                                           ["id"]
//                                                                       .toString()
//                                                                       .substring(
//                                                                           4)
//                                                                       .toUpperCase(),
//                                                               style: GoogleFonts
//                                                                   .nunitoSans(
//                                                                 textStyle: TextStyle(
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     color: Colors
//                                                                         .black,
//                                                                     fontSize:
//                                                                         12,
//                                                                     letterSpacing:
//                                                                         0),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   color: Colors.white,
//                                                 ),
//                                                 Spacer(),
//                                                 //   SizedBox(
//                                                 //     height: 84,
//                                                 //     width: 300,

//                                                 //     child: StreamBuilder<
//                                                 //             QuerySnapshot>(
//                                                 //         stream: FirebaseFirestore
//                                                 //             .instance
//                                                 //             .collection("users")
//                                                 //             .doc(MRANDMRS
//                                                 //                 .sharedprefs!
//                                                 //                 .getString(
//                                                 //                     "uid"))
//                                                 //             .collection(
//                                                 //                 "address")
//                                                 //             .where("id",
//                                                 //                 isEqualTo:
//                                                 //                      snapshot
//                                                 //                 .data!
//                                                 //                 .docs[index]
//                                                 //                     ["address"]
//                                                 //                         .toString())
//                                                 //             .snapshots(),
//                                                 //         builder: (context,
//                                                 //             snapshot) {
//                                                 //           return !snapshot
//                                                 //                   .hasData
//                                                 //               ? Center(
//                                                 //                   child:
//                                                 //                       CircularProgressIndicator(),
//                                                 //                 )
//                                                 //               : snapshot
//                                                 //                           .data!
//                                                 //                           .docs
//                                                 //                           .length ==
//                                                 //                       0
//                                                 //                   ? SizedBox()
//                                                 //                   : ListView
//                                                 //                       .builder(
//                                                 //                       physics:
//                                                 //                           NeverScrollableScrollPhysics(),
//                                                 //                       itemBuilder:
//                                                 //                           (context,
//                                                 //                               index) {
//                                                 //                         return Padding(
//                                                 //                           padding:
//                                                 //                               const EdgeInsets.only(top: 0.0),
//                                                 //                           child:
//                                                 //                               GestureDetector(
//                                                 //                             onTap:
//                                                 //                                 () {},
//                                                 //                             child:
//                                                 //                                 Padding(
//                                                 //                                   padding: const EdgeInsets.all(2.0),
//                                                 //                                   child: Container(
//                                                 //                                     height: 84,
//                                                 //                               child: Column(
//                                                 //                                   mainAxisAlignment: MainAxisAlignment.center,
//                                                 //                                   children: [
//                                                 //                                     Text("Address : ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold,letterSpacing: 1))),

//                                                 //                                     Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                                 //                                     Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                                 //                                     Text(snapshot.data!.docs[index]['country'] + " / " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold))),
//                                                 //                                   ],
//                                                 //                               ),
//                                                 //                               decoration: BoxDecoration(
//                                                 //                                   // border: Border.all(
//                                                 //                                   //   color: Colors.black
//                                                 //                                   //   ,width: 0.5
//                                                 //                                   // ),
//                                                 //                                   color: Colors.grey[100],
//                                                 //                                   borderRadius: BorderRadius.circular(4),
//                                                 //                               ),
//                                                 //                             ),
//                                                 //                                 ),
//                                                 //                           ),
//                                                 //                         );
//                                                 //                       },
//                                                 //                       itemCount: snapshot
//                                                 //                           .data!
//                                                 //                           .docs
//                                                 //                           .length,
//                                                 //                       shrinkWrap:
//                                                 //                           true,
//                                                 //                     );
//                                                 //         }),
//                                                 //   ),
//                                                 //   SizedBox(width: 10,)
//                                                 InkWell(
//                                                   onTap: (){
//                                                     Get.dialog(Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(8.0),
//                                                           child: Container(
//                                                             child: Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                           .all(
//                                                                       20.0),
//                                                               child: Column(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .center,
//                                                                 children: [
//                                                                   SizedBox(
//                                                                     height: 10,
//                                                                   ),
//                                                                   Row(
//                                                                     children: [
//                                                                       Text(
//                                                                         "Your Order Confirmed !!!",
//                                                                         style: GoogleFonts
//                                                                             .nunitoSans(
//                                                                           textStyle: TextStyle(
//                                                                               fontWeight: FontWeight.bold,
//                                                                               color: Colors.black,
//                                                                               fontSize: 16,
//                                                                               letterSpacing: 0),
//                                                                         ),
//                                                                       ),
                                                                     
//                                                                     ],
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 15,
//                                                                   ),
//                                                                   Container(
//                                                                     height: 0.5,
//                                                                     color: Colors
//                                                                         .black,
//                                                                   ),
//                                                                   Container(
//                                                                     height: 80,
//                                                                     child: Row(
//                                                                       children: [
//                                                                         Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(8.0),
//                                                                           child:
//                                                                               Column(
//                                                                             children: [
//                                                                               Text(
//                                                                                 "Order Date",
//                                                                                 style: GoogleFonts.nunitoSans(
//                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14, letterSpacing: 0),
//                                                                                 ),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 height: 6,
//                                                                               ),
//                                                                               Text(
//                                                                                 snapshot.data!.docs[index]["date"].toUpperCase(),
//                                                                                 style: GoogleFonts.nunitoSans(
//                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54, fontSize: 12, letterSpacing: 0),
//                                                                                 ),
//                                                                               ),
//                                                                             ],
//                                                                           ),
//                                                                         ),
//                                                                         Spacer(),
//                                                                         Padding(
//                                                                           padding:
//                                                                               const EdgeInsets.all(10.0),
//                                                                           child:
//                                                                               Column(
//                                                                             children: [
//                                                                               Text(
//                                                                                 "Address",
//                                                                                 style: GoogleFonts.nunitoSans(
//                                                                                   textStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black87, fontSize: 14, letterSpacing: 0),
//                                                                                 ),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 height: 0,
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 height: 40,
//                                                                                 width: 200,
//                                                                                 child: StreamBuilder<QuerySnapshot>(
//                                                                                     stream: FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString("uid")).collection("address").where("id", isEqualTo: snapshot.data!.docs[index]["address"].toString()).snapshots(),
//                                                                                     builder: (context, snapshot) {
//                                                                                       return !snapshot.hasData
//                                                                                           ? Center(
//                                                                                               child: CircularProgressIndicator(),
//                                                                                             )
//                                                                                           : snapshot.data!.docs.length == 0
//                                                                                               ? SizedBox()
//                                                                                               : ListView.builder(
//                                                                                                   physics: NeverScrollableScrollPhysics(),
//                                                                                                   itemBuilder: (context, index) {
//                                                                                                     return Padding(
//                                                                                                       padding: const EdgeInsets.only(top: 0.0),
//                                                                                                       child: GestureDetector(
//                                                                                                         onTap: () {},
//                                                                                                         child: Column(
//                                                                                                           mainAxisAlignment: MainAxisAlignment.center,
//                                                                                                           children: [
//                                                                                                             Text(snapshot.data!.docs[index]['name'] + "  :  " + snapshot.data!.docs[index]['flatNumber'] + " " + snapshot.data!.docs[index]['street1'] + " , ", textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                             Text(snapshot.data!.docs[index]['city'] + "  -  " + snapshot.data!.docs[index]['state'] + "  -  " + " " + snapshot.data!.docs[index]['pincode'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                             Text(snapshot.data!.docs[index]['country'] + " - " + snapshot.data!.docs[index]['phoneNumber'], textAlign: TextAlign.center, style: GoogleFonts.nunitoSans(textStyle: TextStyle(decoration: TextDecoration.none, color: Colors.black54, fontSize: 10, fontWeight: FontWeight.bold))),
//                                                                                                           ],
//                                                                                                         ),
//                                                                                                       ),
//                                                                                                     );
//                                                                                                   },
//                                                                                                   itemCount: snapshot.data!.docs.length,
//                                                                                                   shrinkWrap: true,
//                                                                                                 );
//                                                                                     }),
//                                                                               ),
//                                                                               SizedBox(
//                                                                                 width: 10,
//                                                                               )
//                                                                             ],
//                                                                           ),
//                                                                         )
//                                                                       ],
//                                                                     ),
//                                                                     // color: Colors.green,
//                                                                   ),
//                                                                   Container(
//                                                                     height: 0.5,
//                                                                     color: Colors
//                                                                         .black,
//                                                                   ),
//                                                                  Container(
//                                                     height: 150,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[200],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: SizedBox(
//                                                       height: 150,
//                                                       child: StreamBuilder<
//                                                               QuerySnapshot>(
//                                                           stream: FirebaseFirestore
//                                                               .instance
//                                                               .collection(
//                                                                   "orders")
//                                                               .doc(MRANDMRS
//                                                                   .sharedprefs!
//                                                                   .getString(
//                                                                       "uid"))
//                                                               .collection(
//                                                                   "items")
//                                                               .doc(snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                   index]["id"])
//                                                               .collection(
//                                                                   "items")
//                                                               .snapshots(),
//                                                           builder: (context,
//                                                               snapshot) {
//                                                             if (!snapshot
//                                                                 .hasData) {
//                                                               return Center(
//                                                                   child:
//                                                                       CircularProgressIndicator());
//                                                             } else {
//                                                               return Scrollbar(
//                                                                 //   isAlwaysShown: true,

//                                                                 child: ListView
//                                                                     .builder(
//                                                                         scrollDirection:
//                                                                             Axis
//                                                                                 .horizontal,
//                                                                         //                     gridDelegate:
//                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

//                                                                         itemCount: snapshot
//                                                                             .data!
//                                                                             .docs
//                                                                             .length,
//                                                                         itemBuilder:
//                                                                             (BuildContext context,
//                                                                                 int index) {
//                                                                           return Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.all(10.0),
//                                                                             child:
//                                                                                 GestureDetector(
//                                                                               onTap: () {
//                                                                                 // Navigator.push(
//                                                                                 //     context,
//                                                                                 //     MaterialPageRoute(
//                                                                                 //         builder: (context) =>
//                                                                                 //             DetailScreen(
//                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
//                                                                                 //             )));
//                                                                               },
//                                                                               child: Container(
//                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                                                                                 height: 142,
//                                                                                 child: Column(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                   children: [
//                                                                                     Container(
//                                                                                       height: 80,
//                                                                                       width: 150,
//                                                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       snapshot.data!.docs[index]['name'],
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                     Row(
                                                                                      
//                                                                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                       children: [
//                                                                                         Text(
//                                                                                           "Quantity : " + snapshot.data!.docs[index]['quanity'].toString(),
//                                                                                           style: GoogleFonts.nunitoSans(
//                                                                                             textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                           ),
//                                                                                         ),
//                                                                                         SizedBox(width: 30,)
// ,                                                                                         Text(
//                                                                                       "₹" + snapshot.data!.docs[index]['oprice'].toString(),
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                       ],
//                                                                                     ),
                                                                                   
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           );
//                                                                         }),
//                                                               );
//                                                             }
                                                          
                                                  
                                                
                                              
//                                             ////
                                        
                                      
                                
//                                 })),)
                    
//               ,      
            
            
//              Container(
//                                                     height: 250,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[200],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: SizedBox(
//                                                       height: 150,
//                                                       child: StreamBuilder<
//                                                               QuerySnapshot>(
//                                                           stream: FirebaseFirestore
//                                                               .instance
//                                                               .collection(
//                                                                   "orders")
//                                                               .doc(MRANDMRS
//                                                                   .sharedprefs!
//                                                                   .getString(
//                                                                       "uid"))
//                                                               .collection(
//                                                                   "items")
//                                                               .doc(snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                   index]["id"])
//                                                               .collection(
//                                                                   "items")
//                                                               .snapshots(),
//                                                           builder: (context,
//                                                               snapshot) {
//                                                             if (!snapshot
//                                                                 .hasData) {
//                                                               return Center(
//                                                                   child:
//                                                                       CircularProgressIndicator());
//                                                             } else {
//                                                               return Scrollbar(
//                                                                 //   isAlwaysShown: true,

//                                                                 child: ListView
//                                                                     .builder(
//                                                                         scrollDirection:
//                                                                             Axis
//                                                                                 .vertical,
//                                                                         //                     gridDelegate:
//                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

//                                                                         itemCount: snapshot
//                                                                             .data!
//                                                                             .docs
//                                                                             .length,
//                                                                         itemBuilder:
//                                                                             (BuildContext context,
//                                                                                 int index) {
//                                                                           return Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.all(10.0),
//                                                                             child:
//                                                                                 GestureDetector(
//                                                                               onTap: () {
//                                                                                 // Navigator.push(
//                                                                                 //     context,
//                                                                                 //     MaterialPageRoute(
//                                                                                 //         builder: (context) =>
//                                                                                 //             DetailScreen(
//                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
//                                                                                 //             )));
//                                                                               },
//                                                                               child: Container(
//                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                                                                                 height: 40,
//                                                                                 child: Row(
//                                                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                                                   children: [
//                                                                                     // Container(
//                                                                                     //   height: 80,
//                                                                                     //   width: 150,
//                                                                                     //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
//                                                                                     // ),
//                                                                                     SizedBox(width: 10,),
//                                                                                     Container(
//                                                                                       width: 100,
//                                                                                       child: Text(
//                                                                                         snapshot.data!.docs[index]['name'],
//                                                                                         style: GoogleFonts.nunitoSans(
//                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                         ),
//                                                                                       ),
//                                                                                     ),
//                                                                                     Spacer(),
                                                                                   
//                                                                                         Container(
//                                                                                           width: 60,
//                                                                                           child: Text(
//                                                                                             "Quantity : " + snapshot.data!.docs[index]['quanity'].toString(),
//                                                                                             style: GoogleFonts.nunitoSans(
//                                                                                               textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                             ),
//                                                                                           ),
//                                                                                         ),
//                                                                                         SizedBox(width: 20,)
// ,                                                                                         Container(
//   width: 60,
//   child:   Text("CGST : ${(snapshot.data!.docs[index]['cgst'] * snapshot.data!.docs[index]['quanity'])}",                       
  
//                                                                                         style: GoogleFonts.nunitoSans(
  
//                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
//                                                                                         ),
  
  
  
                                                                                        
  
                                                                                     
  
//                                                                                       ),
// ),
//                                                                                       SizedBox(width: 20,)
// ,                                                                                         Container(
//   width: 60,
//   child:   Text(
   
    
//     "SGST : ${(snapshot.data!.docs[index]['sgst'] * snapshot.data!.docs[index]['quanity'])}",           
  
//                                                                                         style: GoogleFonts.nunitoSans(
  
//                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
//                                                                                         ),
  
                                                                                        
  
                                                                                        
  
                                                                                     
  
//                                                                                       ),
// ),
//                                                                                      SizedBox(width: 30,)
// ,                                                                                         Container(
//   width: 60,
//   child:   Text("Total : ₹ ${(snapshot.data!.docs[index]['oprice'] * snapshot.data!.docs[index]['quanity'])}",
  
//                                                                                         style: GoogleFonts.nunitoSans(
  
//                                                                                           textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
  
//                                                                                         ),
  
                                                                                        
  
                                                                                     
  
//                                                                                       ),
// ),
//                                                                                    SizedBox(width: 0,)
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           );
//                                                                         }),
//                                                               );
//                                                             }
                                                          
                                                  
                                                
                                              
//                                             ////
                                        
                                      
                                
//                                 })),)
                    
                    
            
            
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             color: Colors.white,
//                                                             height: MediaQuery.of(
//                                                                         context)
//                                                                     .size
//                                                                     .width /
//                                                                 1.2,
//                                                             width: MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .width >
//                                                                     400
//                                                                 ? 500
//                                                                 : MediaQuery.of(
//                                                                             context)
//                                                                         .size
//                                                                         .width -
//                                                                     30,
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ));
                                                  
//                                                   },
//                                                   child: Container(
//                                                     height: 40,
//                                                     width: 150,
//                                                     decoration: BoxDecoration(
//                                                         color: Color.fromRGBO(
//                                                             242, 242, 239, 1),
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                                 20)),
//                                                     child: Center(
//                                                       child: Text(
//                                                         "View Order Details",
//                                                         style: GoogleFonts.nunitoSans(
//                                                           textStyle: TextStyle(
//                                                               fontWeight:
//                                                                   FontWeight.bold,
//                                                               color: Colors.black,
//                                                               fontSize: 12,
//                                                               letterSpacing: 0),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 20,
//                                                 )
//                                               ],
//                                             ),

//                                             Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.grey[200],
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             5)),
//                                                 height: 200,
//                                                 child: Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                           left: 1.0,
//                                                           right: 1.0),
//                                                   child: Container(
//                                                     height: 250,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.grey[200],
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: SizedBox(
//                                                       height: 150,
//                                                       child: StreamBuilder<
//                                                               QuerySnapshot>(
//                                                           stream: FirebaseFirestore
//                                                               .instance
//                                                               .collection(
//                                                                   "orders")
//                                                               .doc(MRANDMRS
//                                                                   .sharedprefs!
//                                                                   .getString(
//                                                                       "uid"))
//                                                               .collection(
//                                                                   "items")
//                                                               .doc(snapshot
//                                                                       .data!
//                                                                       .docs[
//                                                                   index]["id"])
//                                                               .collection(
//                                                                   "items")
//                                                               .snapshots(),
//                                                           builder: (context,
//                                                               snapshot) {
//                                                             if (!snapshot
//                                                                 .hasData) {
//                                                               return Center(
//                                                                   child:
//                                                                       CircularProgressIndicator());
//                                                             } else {
//                                                               return Scrollbar(
//                                                                 //   isAlwaysShown: true,

//                                                                 child: ListView
//                                                                     .builder(
//                                                                         scrollDirection:
//                                                                             Axis
//                                                                                 .horizontal,
//                                                                         //                     gridDelegate:
//                                                                         // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

//                                                                         itemCount: snapshot
//                                                                             .data!
//                                                                             .docs
//                                                                             .length,
//                                                                         itemBuilder:
//                                                                             (BuildContext context,
//                                                                                 int index) {
//                                                                           return Padding(
//                                                                             padding:
//                                                                                 const EdgeInsets.all(10.0),
//                                                                             child:
//                                                                                 GestureDetector(
//                                                                               onTap: () {
//                                                                                 // Navigator.push(
//                                                                                 //     context,
//                                                                                 //     MaterialPageRoute(
//                                                                                 //         builder: (context) =>
//                                                                                 //             DetailScreen(
//                                                                                 //               // queryDocumentSnapshot: snapshot.data.docs[index],
//                                                                                 //             )));
//                                                                               },
//                                                                               child: Container(
//                                                                                 decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
//                                                                                 height: 162,
//                                                                                 child: Column(
//                                                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                   children: [
//                                                                                     Container(
//                                                                                       height: 100,
//                                                                                       width: 200,
//                                                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.white, image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index]['mainimage']), fit: BoxFit.cover)),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       snapshot.data!.docs[index]['name'],
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       "QUANTITY : " + snapshot.data!.docs[index]['quanity'].toString(),
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                     Text(
//                                                                                       "₹" + snapshot.data!.docs[index]['oprice'].toString(),
//                                                                                       style: GoogleFonts.nunitoSans(
//                                                                                         textStyle: TextStyle(fontWeight: FontWeight.w700, color: Colors.black, fontSize: 10, letterSpacing: 0),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ],
//                                                                                 ),
//                                                                               ),
//                                                                             ),
//                                                                           );
//                                                                         }),
//                                                               );
//                                                             }
//                                                           }),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             ////
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }),
//                           ),
//                         );
//                       }
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
