import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/users/views/Detailer.dart';
import 'package:mine/users/views/Stepper.dart';
import 'package:provider/provider.dart';

import '../controllers/cart_controller.dart';
import '../users/views/Helper.dart';
import '../users/views/detailproductscreen.dart';
import '../users/views/loginpage.dart';

GestureDetector cartmethod(BuildContext context) {
    return GestureDetector(
                      onTap: () {
                        MRANDMRS.sharedprefs!.getString("uid") == null
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()))
                            : Get.dialog(Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.width /1.2,
                
                    width:MediaQuery.of(context).size.width > 400 ? 500 : 
                    MediaQuery.of(context).size.width - 30,
                    child: Column(
                      children: [
                        Container(
                          child: Center(
                            child: 
                            Row(
                              children: [
                                Spacer(),

                                Text(
                                                                   "Cart"
                                                                            .toString(),
                                                                    style: GoogleFonts.nunitoSans(
                                                                      textStyle: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .bold,
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize: 18,
                                                                          letterSpacing: 0),
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  InkWell(
                                                                    
                                                                    onTap: (){
                                                                    Navigator.pop(context);
                                                                    },
                                                                    
                                                                    
                                                                    child: Icon(Icons.close,)),
                                                                  SizedBox(width: 20,)
                              ],
                            ),
                          ),
                          height: 50,
                        ),
                        Expanded(
                          child: StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(MRANDMRS.sharedprefs!.getString("uid"))
                                  .collection("cart")
                                  .snapshots(),
                              builder: (context, snapshot) {
                                 if (!snapshot.hasData) {
                                  return Center(child: CircularProgressIndicator());
                                }
                                if(snapshot.data!.docs.length == 0){
                                  return  Center(
                                    child: Text(
                                                             "No Items in Cart",
                                                              style:
                                                                  GoogleFonts.nunitoSans(
                                                                textStyle: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color:
                                                                        Colors.black,
                                                                    fontSize: 18,
                                                                    letterSpacing: 1),
                                                              ),
                                                            ),
                                  );
                                }
                                else {
                                  return Scrollbar(
                                    isAlwaysShown: true,
                        
                                    thickness: 10,
                        
                                    //  controller: _s`crollController,
                        
                                    child: ListView.builder(
                                        // physics:
                                        //     NeverScrollableScrollPhysics(),
                        
                                        // gridDelegate:
                        
                                        //     SliverGridDelegateWithFixedCrossAxisCount(
                        
                                        //         crossAxisCount: 1),
                        
                                        //   controller: _scrollController,
                        
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              print(          snapshot.data!
                                                                          .docs[
                                                                      index]);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                      // DetailProductScreens(queryDocumentSnapshot: queryDocumentSnapshot)
                                                          DetailProductScreens(
                                                              queryDocumentSnapshot:
                                                                  snapshot.data!
                                                                          .docs[
                                                                      index])));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  // color: Color.fromRGBO(
                        
                                                  //     230, 224, 215, 1),
                        
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                ),
                                                child: Row(

                                                  mainAxisAlignment:MediaQuery.of(context).size.width > 400 ? 
                                                      MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 1.0,
                                                              top: 15,
                                                              bottom: 15),
                                                      child: Container(
                                                        height:
                                                        
                                                        80,
                                                        width:
                                                        
                                                        80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(0),
                                                            color:
                                                                Colors.grey[200],
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    snapshot.data!
                                                                                .docs[
                                                                            index]
                                                                        [
                                                                        'mainimage']),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      width:145,






                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 16,
                                                          ),
                        
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]['name']
                                                                .toString(),
                                                            style:
                                                                GoogleFonts.nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 13,
                                                                  letterSpacing: 1),
                                                            ),
                                                          ),
                        
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                        
                                                          Text(
                                                            snapshot.data!
                                                                        .docs[index]
                                                                    ['length'] +
                                                                " * " +
                                                                snapshot.data!
                                                                        .docs[index]
                                                                    ['width'] +
                                                                "  CM",
                                                            style:
                                                                GoogleFonts.nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 12,
                                                                  letterSpacing: 0),
                                                            ),
                                                          ),
                        
                                                          SizedBox(
                                                            height: 4,
                                                          ),
                        
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Center(
                                                                  child: Text(
                                                                    "QUANTITY : ",
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      textStyle: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              10,
                                                                          letterSpacing:
                                                                              1),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                    child: Center(
                                                                      child: Text(
                                                                        snapshot
                                                                            .data!
                                                                            .docs[
                                                                                index]
                                                                                [
                                                                                'quanity']
                                                                            .toString(),
                                                                        style:
                                                                            GoogleFonts
                                                                                .lato(
                                                                          textStyle: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .w900,
                                                                              color: Colors
                                                                                  .black,
                                                                              fontSize:
                                                                                  12,
                                                                              letterSpacing:
                                                                                  1),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                                .grey[
                                                                            300],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                2)),
                                                                    height: 20,
                                                                    width: 20),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                 InkWell(
                                                                   onTap: (){
                                                                     FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString('uid')).collection("cart").doc(snapshot.data!.docs[index]['id']).delete();
                                                                      context.read<CartController>().cartvaluefinder();
                                                                 
                                                                  
                                                                   },
                                                                   child: Text(
                                                                      "REMOVE",
                                                                      style:
                                                                          GoogleFonts
                                                                              .nunitoSans(
                                                                        textStyle: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .bold,
                                                                            color: Colors
                                                                                .red[900],
                                                                            fontSize:
                                                                                10,
                                                                            letterSpacing:
                                                                                1),
                                                                      ),
                                                                    ),
                                                                 ),
                                                                
                                                          // Icon(Icons.delete_outline_rounded,color:Colors.red[900])
                                                              ],
                                                            ),
                                                            height: 30,
                                                            width: 150,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                          ),
                        
                                                          // SizedBox(
                        
                                                          //   height: 0,
                        
                                                          // ),
                        
                                                          // Padding(
                        
                                                          //   padding: const EdgeInsets
                        
                                                          //           .only(
                        
                                                          //       top: 8.0),
                        
                                                          //   child: Center(
                        
                                                          //     child: Text(
                        
                                                          //       "Wood : " +
                        
                                                          //           snapshot
                        
                                                          //               .data!
                        
                                                          //               .docs[index]['wood'],
                        
                                                          //       style: GoogleFonts
                        
                                                          //           .nunitoSans(
                        
                                                          //         textStyle: TextStyle(
                        
                                                          //             fontWeight: FontWeight
                        
                                                          //                 .w700,
                        
                                                          //             color: Colors
                        
                                                          //                 .black54,
                        
                                                          //             fontSize:
                        
                                                          //                 14,
                        
                                                          //             letterSpacing:
                        
                                                          //                 0),
                        
                                                          //       ),
                        
                                                          //     ),
                        
                                                          //   ),
                        
                                                          // ),
                        
                                                          // SizedBox(
                        
                                                          //   height: 10,
                        
                                                          // ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                     SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 10.0,
                                                                  top: 0),
                                                          child: Text(
                                                            "₹ " +
                                                                snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                        ['oprice']
                                                                    .toString(),
                                                            style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 15,
                                                                  letterSpacing: 0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                }
                              }),
                        ),
                          Consumer<CartController>(builder: ((context, value, child) {
                            return value.cartvalue == 0 ? SizedBox() :  Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                              Get.to(StepperCart());
                              },
                              child: Container(
                                
                                color: Colors.black,
                                             
                                child: Center(
                                  child: Text(
                                                                 "CHECKOUT"
                                                                          .toString(),
                                                                  style: GoogleFonts.lato(
                                                                    textStyle: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        color:
                                                                            Colors.white,
                                                                        fontSize: 14,
                                                                        letterSpacing: 2),
                                                                  ),
                                                                ),
                                ),
                              height: 40,
                                                      ),
                            ),
                          );
                          })),
                      ],
                    ),
                  )])));
                            
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (_) => StepperCart()));
                      },
                      child: Container(
                        height: 20,
                        width: 50,
                        child:Stack(
                          children: [
                             Icon(EvaIcons.shoppingBagOutline),
                             Positioned(
                               left:13,
                               child: CircleAvatar(
                                 radius: 8,
                                 child: Center(
                                   child: 
                                   
                                   
                                   
                                   
                                   
                                    Consumer<CartController>(
                                      builder: ((context, value, child) {
                                    return    Text(
                                                           value.cartvalue.toString(),
                                                              style: GoogleFonts.nunitoSans(
                                                                textStyle: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black,
                                                                    fontSize: 10,
                                                                    letterSpacing: 0),
                                                              ),
                                                            );
                                        
                                      }),
                                    
                                    ),
                                 ),
                                 backgroundColor: Colors.white
                               ),
                             )
                          ],
                        ),

                        
                      ));
  }