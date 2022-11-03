import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:mine/admin/Admin.dart';
import 'package:mine/helpers/cartmethod.dart';
import 'package:mine/helpers/mobilewidgets.dart';
import 'package:mine/users/views/AddAddress.dart';
import 'package:mine/users/views/Detailer.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/HomeScreenWidgets/aboutus.dart';
import 'package:mine/Orders.dart';
import 'package:mine/users/views/HomePage.dart';
import 'package:mine/users/views/accountscree.dart';
import 'package:mine/users/views/cartpage.dart';
import 'package:mine/users/views/loginpage.dart';
import 'package:mine/users/views/Search.dart';
import 'package:mine/users/views/Stepper.dart';
import 'package:mine/users/views/allitemspage.dart';
import 'package:mine/users/views/permium.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/Custom_Widgets.dart';
import '../../constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../cart/CartPage.dart';
import '../controllers/cart_controller.dart';
import '../users/views/detailproductscreen.dart';

class TopNotifyBlackBox extends StatelessWidget {
  const TopNotifyBlackBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Color.fromRGBO(204, 191, 171, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IconButton(
          //     // Use the EvaIcons class for the IconData
          //     icon: Icon(EvaIcons.shoppingCartOutline),
          //     onPressed: () {

          //       // print("Eva Icon heart Pressed");
          //       //   Navigator.push(context,MaterialPageRoute(builder: (_) => Admin()));
          //     }),
          // const Box(height: 0, width: 10),
          TopText()
        ],
      ),
    );
  }
}

class TopMobileNotifyBlackBox extends StatelessWidget {
  const TopMobileNotifyBlackBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Box(height: 0, width: 10),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.delivery_dining_outlined,
                  color: Colors.white,
                ),
              ),
              const Box(height: 0, width: 10),
              Text(
                "Free Shipping",
                style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 0.5),
                ),
              ),
              const Box(height: 0, width: 10),
              const VerticalDivider(
                color: Colors.white,
                thickness: 0.5,
                width: 40,
                indent: 10,
                endIndent: 10,
              ),
              const Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
              const Box(height: 0, width: 20),
              Text(
                "EMI Options",
                style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 14,
                      letterSpacing: 0.5),
                ),
              ),
            ],
          ),
          const Box(height: 0, width: 10),
        ],
      ),
    );
  }
}

class TitleMobileBox extends StatelessWidget {
  const TitleMobileBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Mr & Mrs",
                      style: GoogleFonts.novaSlim(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                            fontSize: 25,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "Design Wood Works",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: const Center(
                      child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 20,
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                ),
                Box(height: 0, width: 10)
              ],
            ),
          ],
        ),
        Box(height: 10, width: 0),
        Container(
          child: Center(
            child: Row(
              children: [
                Box(height: 0, width: 10),
                Text(
                  "What are you looking for ?",
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 14,
                        letterSpacing: 0),
                  ),
                ),
                Spacer(),
                Icon(Icons.search),
                Box(height: 0, width: 10),
              ],
            ),
          ),
          height: 50,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        )
      ],
    );
  }
}

class EndBox extends StatelessWidget {
  const EndBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 573,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(242, 242, 239, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Box(height: 50, width: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                height: 510,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //    children: [
                    //      Text(
                    //           "General",
                    //           style: GoogleFonts.nunitoSans(
                    //             textStyle: const TextStyle(
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black,
                    //                 fontSize: 14,
                    //                 letterSpacing: 0.4),
                    //           ),
                    //         ),
                    //    ],
                    //  ),

                    //  Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Padding(
                    //             padding: const EdgeInsets.all(10.0),
                    //             child: InkWell(

                    //               child:  Text(
                    //           "Terms of Services",
                    //           style: GoogleFonts.nunitoSans(
                    //             textStyle: const TextStyle(
                    //                 fontWeight: FontWeight.normal,
                    //                 color: Colors.black,
                    //                 fontSize: 14,
                    //                 letterSpacing: 0.4),
                    //           ),),)),

                    //            Padding(
                    //             padding: const EdgeInsets.all(10.0),
                    //             child: InkWell(

                    //               child: Text(
                    //           "Privacy Policy",
                    //           style: GoogleFonts.nunitoSans(
                    //             textStyle: const TextStyle(
                    //                 fontWeight: FontWeight.normal,
                    //                 color: Colors.black,
                    //                 fontSize: 14,
                    //                 letterSpacing: 0.4),
                    //           ),),),
                    //           ),

                    //   ],
                    //  ),

                    Box(height: 40, width: 0),

                    Row(
                      children: [
                        Container(
                          height: 190,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We Accept",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 0.4),
                                    ),
                                  ),
                                ],
                              ),
                              Box(height: 20, width: 0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      child: Image.network(
                                    "https://d6xcmfyh68wv8.cloudfront.net/assets/payments/payment_method_cards.png",
                                    height: 100,
                                  )),
                                  Box(height: 0, width: 50),
                                  InkWell(
                                      child: Image.network(
                                    "https://d6xcmfyh68wv8.cloudfront.net/assets/payments/cp_modes_wallets.png",
                                    height: 100,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              width: 320,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "HELP",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 14,
                                            letterSpacing: 2),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      height: 3,
                                      width: 30,
                                      color: Colors.black,
                                    ),
                                    
                                     SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                         Text(
                                          "Contact us at",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                                letterSpacing: 0.4),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "+91 - 7540032123",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 12,
                                                letterSpacing: 0.4),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "We are here to help you every day between\n9.30 AM to 6.00 PM",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 12,
                                                letterSpacing: 0.4),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                      SizedBox(
                                      height: 3,
                                    ),
                                   
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Registered Office, Manufacturer & Packer",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                                letterSpacing: 0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "1048/1 , Laxmi Building\nThoothukudi - Madurai National Highway (NH 38)\nMela Eral - 628908\nThoothukudi Dist - Tamil Nadu",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 12,
                                                letterSpacing: 0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Email :",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 14,
                                                letterSpacing: 0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "mrandmrsdesignwoodworks@gmail.com",
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 12,
                                                letterSpacing: 0.4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Box(height: 40, width: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Follow Us",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0.4),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                              onTap: () async {
                                const url =
                                    'https://www.facebook.com/mrandmrsdesignwoodworks';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Image.network(
                                "https://cdn-icons-png.flaticon.com/128/5968/5968764.png",
                                height: 30,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                              onTap: () async {
                                const url =
                                    'https://www.instagram.com/mrandmrsdesignwoodworks/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Image.network(
                                "https://cdn-icons-png.flaticon.com/128/174/174855.png",
                                height: 30,
                              )),
                        ),
                      ],
                    ),

                    //               Center(
                    //                 child: Container(
                    //                     height: 70,
                    //                     child: Center(
                    //                       child: Row(
                    //                         mainAxisAlignment: MainAxisAlignment.center,
                    //                         children: [
                    //

                    //                                 //                         ],
                    //                       ),
                    //                     ),
                    //                   decoration: BoxDecoration(
                    //                     color: Colors.white,
                    //                     borderRadius:BorderRadius.circular(40)
                    //                   ),
                    //                     width: 400,

                    //                   ),
                    //               )
                    // ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "© Copyright 2022  -  ",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0.4),
                          ),
                        ),
                        Text(
                          "Mr & Mrs Design Wood Works.",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 1),
                          ),
                        ),
                        Text(
                          "  All Rights Reserved.",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0.4),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 20,)
                  ],
                ),
              ),

              // Container(
              //   width: 400,
              //   height: 400,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "CONNECT WITH US",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 2),
              //         ),
              //       ),
              //       Box(height: 15, width: 0),
              //       Text(
              //         "Subscribe to our newsletter and be among the first to hear about new arrivals, sale, events and special offers.",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 0.4),
              //         ),
              //       ),
              //       Box(height: 12, width: 0),
              //       Container(
              //         height: 40,
              //         child: Row(
              //           children: [
              //             Text(
              //               "    Enter your E-mail Address",
              //               style: GoogleFonts.nunitoSans(
              //                 textStyle: const TextStyle(
              //                     fontWeight: FontWeight.normal,
              //                     color: Colors.black45,
              //                     fontSize: 14,
              //                     letterSpacing: 0.4),
              //               ),
              //             ),
              //           ],
              //         ),
              //         width: 300,
              //         decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black)),
              //       ),
              //       Box(height: 10, width: 0),
              //       Container(
              //         height: 40,
              //         width: 200,
              //         child: Center(
              //           child: Text(
              //             "SUBSCRIBE",
              //             style: GoogleFonts.nunitoSans(
              //               textStyle: const TextStyle(
              //                   fontWeight: FontWeight.normal,
              //                   color: Colors.white,
              //                   fontSize: 14,
              //                   letterSpacing: 2),
              //             ),
              //           ),
              //         ),
              //         decoration: BoxDecoration(
              //             color: Color.fromRGBO(204, 191, 171, 1),
              //             border: Border.all(
              //                 color: Color.fromRGBO(204, 191, 171, 1))),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   width: 140,
              //   height: 400,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "ASSISTANCE",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 2),
              //         ),
              //       ),
              //       Box(height: 15, width: 0),

              //       Text(
              //         "Privacy Policy",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 0.4),
              //         ),
              //       ),
              //       Box(height: 8, width: 0),
              //       Text(
              //         "Shipping Policy",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 0.4),
              //         ),
              //       ),
              //       Box(height: 8, width: 0),
              //       Text(
              //         "Track your order",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 0.4),
              //         ),
              //       ),
              //       Box(height: 8, width: 0),
              //       Text(
              //         "Exchange policy",
              //         style: GoogleFonts.nunitoSans(
              //           textStyle: const TextStyle(
              //               fontWeight: FontWeight.normal,
              //               color: Colors.black,
              //               fontSize: 14,
              //               letterSpacing: 0.4),
              //         ),
              //       ),
              //       Box(height: 8, width: 0),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class TitleWebBox extends StatelessWidget {
  const TitleWebBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  context.read<CartController>().cartvaluefinder();
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(230, 224, 215, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 130,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Box(height: 0, width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Box(height: 10, width: 0),
                    Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/mr-and-mrs-93502.appspot.com/o/final.png?alt=media&token=e8359a2a-4eda-491f-8ccd-62e9840df409",
                      height: 120,
                    ),
                    // Text(
                    //   "Mr & Mrs",
                    //   style: GoogleFonts.novaSlim(
                    //     textStyle: const TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         color: kBackgroundColor,
                    //         fontSize: 25,
                    //         letterSpacing: 0),
                    //   ),
                    // ),
                    // Text(
                    //   "Design Wood Works",
                    //   style: GoogleFonts.openSans(
                    //     textStyle: const TextStyle(
                    //         fontWeight: FontWeight.normal,
                    //         color: Colors.black,
                    //         fontSize: 11,
                    //         letterSpacing: 1),
                    //   ),
                    // ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          MRANDMRS.sharedprefs!.getString("uid") == null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AccountScreen()));
                        },
                        child: Icon(EvaIcons.personOutline)),
                    const Box(height: 0, width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Search();
                          }));
                        },
                        child: Icon(EvaIcons.searchOutline)),
                    const Box(height: 0, width: 20),
                    //     GestureDetector(
                    //         onTap: () {
                    //           MRANDMRS.sharedprefs!.getString("uid") == null
                    //               ? Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (_) => LoginScreen()))
                    //               : Get.dialog(Padding(
                    // padding: const EdgeInsets.all(20.0),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Container(
                    //       color: Colors.white,
                    //       height: MediaQuery.of(context).size.width /3.5,

                    //       width: 500,
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             child: Center(
                    //               child:
                    //               Text(
                    //                                                  "Cart"
                    //                                                           .toString(),
                    //                                                   style: GoogleFonts.nunitoSans(
                    //                                                     textStyle: TextStyle(
                    //                                                         fontWeight:
                    //                                                             FontWeight
                    //                                                                 .bold,
                    //                                                         color:
                    //                                                             Colors.black,
                    //                                                         fontSize: 18,
                    //                                                         letterSpacing: 0),
                    //                                                   ),
                    //                                                 ),
                    //             ),
                    //             height: 50,
                    //           ),
                    //           Expanded(
                    //             child: StreamBuilder<QuerySnapshot>(
                    //                 stream: FirebaseFirestore.instance
                    //                     .collection("users")
                    //                     .doc(MRANDMRS.sharedprefs!.getString("uid"))
                    //                     .collection("cart")
                    //                     .snapshots(),
                    //                 builder: (context, snapshot) {
                    //                   if (!snapshot.hasData) {
                    //                     return Center(child: CircularProgressIndicator());
                    //                   } else {
                    //                     return Scrollbar(
                    //                       isAlwaysShown: true,

                    //                       thickness: 10,

                    //                       //  controller: _s`crollController,

                    //                       child: ListView.builder(
                    //                           // physics:
                    //                           //     NeverScrollableScrollPhysics(),

                    //                           // gridDelegate:

                    //                           //     SliverGridDelegateWithFixedCrossAxisCount(

                    //                           //         crossAxisCount: 1),

                    //                           //   controller: _scrollController,

                    //                           itemCount: snapshot.data!.docs.length,
                    //                           itemBuilder:
                    //                               (BuildContext context, int index) {
                    //                             return GestureDetector(
                    //                               onTap: () {
                    //                                 print(snapshot.data!.docs[index]['name']);
                    //                                      print(snapshot.data!.docs[index]['category']);
                    //                                           print(snapshot.data!.docs[index]['permium']);
                    //                                                print(snapshot.data!.docs[index]['oprice']);
                    //                                                     print(snapshot.data!.docs[index]['id']);
                    //                                                          print(snapshot.data!.docs[index]['Description']);
                    //                                 Navigator.push(
                    //                                     context,
                    //                                     MaterialPageRoute(
                    //                                         builder: (context) =>
                    //                                         // DetailProductScreens(queryDocumentSnapshot: queryDocumentSnapshot)
                    //                                             DetailProductScreen(
                    //                                                 queryDocumentSnapshot:
                    //                                                     snapshot.data!
                    //                                                             .docs[
                    //                                                         index])));
                    //                               },
                    //                               child: Padding(
                    //                                 padding: const EdgeInsets.all(10.0),
                    //                                 child: Container(
                    //                                   height: 120,
                    //                                   decoration: BoxDecoration(
                    //                                     // color: Color.fromRGBO(

                    //                                     //     230, 224, 215, 1),

                    //                                     border: Border.all(
                    //                                         color: Colors.black12),
                    //                                   ),
                    //                                   child: Row(
                    //                                     mainAxisAlignment:
                    //                                         MainAxisAlignment.spaceEvenly,
                    //                                     crossAxisAlignment:
                    //                                         CrossAxisAlignment.start,
                    //                                     children: [
                    //                                       Padding(
                    //                                         padding:
                    //                                             const EdgeInsets.only(
                    //                                                 left: 15.0,
                    //                                                 top: 15,
                    //                                                 bottom: 15),
                    //                                         child: Expanded(
                    //                                           child: Container(
                    //                                             height: 100,
                    //                                             width: 100,
                    //                                             decoration: BoxDecoration(
                    //                                                 borderRadius:
                    //                                                     BorderRadius
                    //                                                         .circular(0),
                    //                                                 color:
                    //                                                     Colors.grey[200],
                    //                                                 image: DecorationImage(
                    //                                                     image: NetworkImage(
                    //                                                         snapshot.data!
                    //                                                                     .docs[
                    //                                                                 index]
                    //                                                             [
                    //                                                             'mainimage']),
                    //                                                     fit: BoxFit
                    //                                                         .cover)),
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                       SizedBox(
                    //                                         width: 30,
                    //                                       ),
                    //                                       Container(
                    //                                         width: 210,
                    //                                         child: Column(
                    //                                           crossAxisAlignment:
                    //                                               CrossAxisAlignment
                    //                                                   .start,
                    //                                           mainAxisAlignment:
                    //                                               MainAxisAlignment
                    //                                                   .center,
                    //                                           children: [
                    //                                             SizedBox(
                    //                                               height: 16,
                    //                                             ),

                    //                                             Text(
                    //                                               snapshot.data!
                    //                                                   .docs[index]['name']
                    //                                                   .toString(),
                    //                                               style:
                    //                                                   GoogleFonts.nunitoSans(
                    //                                                 textStyle: TextStyle(
                    //                                                     fontWeight:
                    //                                                         FontWeight
                    //                                                             .w500,
                    //                                                     color:
                    //                                                         Colors.black,
                    //                                                     fontSize: 13,
                    //                                                     letterSpacing: 1),
                    //                                               ),
                    //                                             ),

                    //                                             SizedBox(
                    //                                               height: 4,
                    //                                             ),

                    //                                             Text(
                    //                                               snapshot.data!
                    //                                                           .docs[index]
                    //                                                       ['length'] +
                    //                                                   " * " +
                    //                                                   snapshot.data!
                    //                                                           .docs[index]
                    //                                                       ['width'] +
                    //                                                   "  CM",
                    //                                               style:
                    //                                                   GoogleFonts.nunitoSans(
                    //                                                 textStyle: TextStyle(
                    //                                                     fontWeight:
                    //                                                         FontWeight
                    //                                                             .w400,
                    //                                                     color:
                    //                                                         Colors.black,
                    //                                                     fontSize: 12,
                    //                                                     letterSpacing: 0),
                    //                                               ),
                    //                                             ),

                    //                                             SizedBox(
                    //                                               height: 4,
                    //                                             ),

                    //                                             Container(
                    //                                               child: Row(
                    //                                                 mainAxisAlignment:
                    //                                                     MainAxisAlignment
                    //                                                         .spaceEvenly,
                    //                                                 children: [
                    //                                                   Center(
                    //                                                     child: Text(
                    //                                                       "QUANTITY : ",
                    //                                                       style:
                    //                                                           GoogleFonts
                    //                                                               .lato(
                    //                                                         textStyle: TextStyle(
                    //                                                             fontWeight:
                    //                                                                 FontWeight
                    //                                                                     .w700,
                    //                                                             color: Colors
                    //                                                                 .black54,
                    //                                                             fontSize:
                    //                                                                 10,
                    //                                                             letterSpacing:
                    //                                                                 1),
                    //                                                       ),
                    //                                                     ),
                    //                                                   ),
                    //                                                   SizedBox(
                    //                                                     height: 5,
                    //                                                   ),
                    //                                                   Container(
                    //                                                       child: Center(
                    //                                                         child: Text(
                    //                                                           snapshot
                    //                                                               .data!
                    //                                                               .docs[
                    //                                                                   index]
                    //                                                                   [
                    //                                                                   'quanity']
                    //                                                               .toString(),
                    //                                                           style:
                    //                                                               GoogleFonts
                    //                                                                   .lato(
                    //                                                             textStyle: TextStyle(
                    //                                                                 fontWeight: FontWeight
                    //                                                                     .w900,
                    //                                                                 color: Colors
                    //                                                                     .black,
                    //                                                                 fontSize:
                    //                                                                     12,
                    //                                                                 letterSpacing:
                    //                                                                     1),
                    //                                                           ),
                    //                                                         ),
                    //                                                       ),
                    //                                                       decoration: BoxDecoration(
                    //                                                           color: Colors
                    //                                                                   .grey[
                    //                                                               300],
                    //                                                           borderRadius:
                    //                                                               BorderRadius.circular(
                    //                                                                   2)),
                    //                                                       height: 20,
                    //                                                       width: 20),
                    //                                                   SizedBox(
                    //                                                     width: 8,
                    //                                                   ),
                    //                                                    InkWell(
                    //                                                      onTap: (){
                    //                                                        FirebaseFirestore.instance.collection("users").doc(MRANDMRS.sharedprefs!.getString('uid')).collection("cart").doc(snapshot.data!.docs[index]['id']).delete();
                    //                                                     context.read<CartController>().cartvaluefinder();

                    //                                                      },
                    //                                                      child: Text(
                    //                                                         "REMOVE",
                    //                                                         style:
                    //                                                             GoogleFonts
                    //                                                                 .nunitoSans(
                    //                                                           textStyle: TextStyle(
                    //                                                               fontWeight:
                    //                                                                   FontWeight
                    //                                                                       .bold,
                    //                                                               color: Colors
                    //                                                                   .red[900],
                    //                                                               fontSize:
                    //                                                                   10,
                    //                                                               letterSpacing:
                    //                                                                   1),
                    //                                                         ),
                    //                                                       ),
                    //                                                    ),

                    //                                             // Icon(Icons.delete_outline_rounded,color:Colors.red[900])
                    //                                                 ],
                    //                                               ),
                    //                                               height: 30,
                    //                                               width: 150,
                    //                                               decoration: BoxDecoration(
                    //                                                   color: Colors.white,
                    //                                                   borderRadius:
                    //                                                       BorderRadius
                    //                                                           .circular(
                    //                                                               5)),
                    //                                             ),

                    //                                             // SizedBox(

                    //                                             //   height: 0,

                    //                                             // ),

                    //                                             // Padding(

                    //                                             //   padding: const EdgeInsets

                    //                                             //           .only(

                    //                                             //       top: 8.0),

                    //                                             //   child: Center(

                    //                                             //     child: Text(

                    //                                             //       "Wood : " +

                    //                                             //           snapshot

                    //                                             //               .data!

                    //                                             //               .docs[index]['wood'],

                    //                                             //       style: GoogleFonts

                    //                                             //           .nunitoSans(

                    //                                             //         textStyle: TextStyle(

                    //                                             //             fontWeight: FontWeight

                    //                                             //                 .w700,

                    //                                             //             color: Colors

                    //                                             //                 .black54,

                    //                                             //             fontSize:

                    //                                             //                 14,

                    //                                             //             letterSpacing:

                    //                                             //                 0),

                    //                                             //       ),

                    //                                             //     ),

                    //                                             //   ),

                    //                                             // ),

                    //                                             // SizedBox(

                    //                                             //   height: 10,

                    //                                             // ),
                    //                                           ],
                    //                                         ),
                    //                                       ),
                    //                                       Spacer(),
                    //                                       Column(
                    //                                         mainAxisAlignment:
                    //                                             MainAxisAlignment.center,
                    //                                         children: [
                    //                                           Padding(
                    //                                             padding:
                    //                                                 const EdgeInsets.only(
                    //                                                     right: 10.0,
                    //                                                     top: 0),
                    //                                             child: Text(
                    //                                               "₹ " +
                    //                                                   snapshot
                    //                                                       .data!
                    //                                                       .docs[index]
                    //                                                           ['oprice']
                    //                                                       .toString(),
                    //                                               style: GoogleFonts.lato(
                    //                                                 textStyle: TextStyle(
                    //                                                     fontWeight:
                    //                                                         FontWeight
                    //                                                             .w700,
                    //                                                     color:
                    //                                                         Colors.black,
                    //                                                     fontSize: 15,
                    //                                                     letterSpacing: 0),
                    //                                               ),
                    //                                             ),
                    //                                           ),
                    //                                         ],
                    //                                       ),
                    //                                       SizedBox(
                    //                                         width: 30,
                    //                                       )
                    //                                     ],
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             );
                    //                           }),
                    //                     );
                    //                   }
                    //                 }),
                    //           ),
                    //             Padding(
                    //               padding: const EdgeInsets.all(10.0),
                    //               child: InkWell(
                    //                 onTap: (){
                    //                 Get.to(StepperCart());
                    //                 },
                    //                 child: Container(

                    //                   color: Colors.black,

                    //                   child: Center(
                    //                     child: Text(
                    //                                                    "CHECKOUT"
                    //                                                             .toString(),
                    //                                                     style: GoogleFonts.lato(
                    //                                                       textStyle: TextStyle(
                    //                                                           fontWeight:
                    //                                                               FontWeight
                    //                                                                   .w700,
                    //                                                           color:
                    //                                                               Colors.white,
                    //                                                           fontSize: 14,
                    //                                                           letterSpacing: 2),
                    //                                                     ),
                    //                                                   ),
                    //                   ),
                    //                 height: 40,
                    //                                         ),
                    //               ),
                    //             ),
                    //         ],
                    //       ),
                    //     )])));

                    //               // Navigator.push(
                    //               //     context,
                    //               //     MaterialPageRoute(
                    //               //         builder: (_) => StepperCart()));
                    //         },
                    //         child: Container(
                    //           height: 20,
                    //           width: 50,
                    //           child:Stack(
                    //             children: [
                    //                Icon(EvaIcons.shoppingBagOutline),
                    //                Positioned(
                    //                  left:13,
                    //                  child: CircleAvatar(
                    //                    radius: 8,
                    //                    child: Center(
                    //                      child:

                    //                  Consumer<CartController>(
                    //                         builder: ((context, value, child) {return
                    //                       Text(
                    //                                                 value.cartvalue.toString(),
                    //                                                 style: GoogleFonts.nunitoSans(
                    //                                                   textStyle: const TextStyle(
                    //                                                       fontWeight: FontWeight.bold,
                    //                                                       color: Colors.black,
                    //                                                       fontSize: 10,
                    //                                                       letterSpacing: 0),
                    //                                                 ),
                    //                     ); })),

                    //                    ),
                    //                    backgroundColor: Colors.white
                    //                  ),
                    //                )
                    //             ],
                    //           ),

                    //         )),
                    cartmethod(context),
                    const Box(height: 0, width: 40),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Home",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Home",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AllItemsScreen()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Shop",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {},
                    child: Text(
                      "Shop",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PermiumScreen()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Premium",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Permium",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Orders()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Orders",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Orders",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AboutUs()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "About us",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "About us",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

int cartvalueno() {
  int cartno = 0;
  FirebaseFirestore.instance
      .collection("users")
      .doc(MRANDMRS.sharedprefs!.getString("uid"))
      .collection("cart")
      .get()
      .then((QuerySnapshot querySnapshot) {
    // setState(() {
    cartno = querySnapshot.docs.length;
    //   print("cart no " + cartno.toString());
    // });
  });
  return cartno;
}

class DetailTitleWebBox extends StatelessWidget {
  const DetailTitleWebBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(230, 224, 215, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Box(height: 0, width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Mr & Mrs",
                      style: GoogleFonts.novaSlim(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                            fontSize: 25,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "Design Wood Works",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          MRANDMRS.sharedprefs!.getString("uid") == null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AccountScreen()));
                        },
                        child: Icon(EvaIcons.personOutline)),
                    const Box(height: 0, width: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return Search();
                          }));
                        },
                        child: Icon(EvaIcons.searchOutline)),
                    const Box(height: 0, width: 20),
                    cartmethod(context),
                    const Box(height: 0, width: 40),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Home",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Home",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AllItemsScreen()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Shop",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {},
                    child: Text(
                      "Shop",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PermiumScreen()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Premium",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Permium",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Orders()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Orders",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Orders",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AboutUs()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "About us",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "About us",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleAdminWebBox extends StatelessWidget {
  const TitleAdminWebBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(230, 224, 215, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Box(height: 0, width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Mr & Mrs",
                      style: GoogleFonts.novaSlim(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBackgroundColor,
                            fontSize: 25,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "Design Wood Works",
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Box(height: 0, width: 20),
                    GestureDetector(
                        onTap: () {
                          MRANDMRS.sharedprefs!.getString("uid") == null
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LoginScreen()))
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AccountScreen()));
                        },
                        child: Icon(EvaIcons.personOutline)),
                    const Box(height: 0, width: 20),
                    GestureDetector(
                        onTap: () {
                          // MRANDMRS.sharedprefs!.getString("uid") == ""
                          //     ? Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (_) => LoginScreen()))
                          //     : Navigator.push(context,
                          //         MaterialPageRoute(builder: (_) => cart()));
                        },
                        child: Icon(EvaIcons.shoppingBagOutline)),
                    const Box(height: 0, width: 40),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (_) => Admin()));
                  },
                  child: HoverWidget(
                    hoverChild: Column(
                      children: [
                        Text(
                          "Add Items",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black45,
                                fontSize: 14,
                                letterSpacing: 0.8),
                          ),
                        ),
                        Box(height: 4, width: 0),
                        AnimatedContainer(
                          duration: Duration(seconds: 3),
                          height: 1.5,
                          color: Colors.black,
                          width: 50,
                        )
                      ],
                    ),
                    onHover: (PointerEnterEvent event) {
                      print("HELLO");
                    },
                    child: Text(
                      "Add Items",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 14,
                            letterSpacing: 0.8),
                      ),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                HoverWidget(
                  hoverChild: Column(
                    children: [
                      Text(
                        "Track Your Orders",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                              letterSpacing: 0.8),
                        ),
                      ),
                      Box(height: 4, width: 0),
                      AnimatedContainer(
                        duration: Duration(seconds: 3),
                        height: 1.5,
                        color: Colors.black,
                        width: 50,
                      )
                    ],
                  ),
                  onHover: (PointerEnterEvent event) {
                    print("HELLO");
                  },
                  child: Text(
                    "Track your Orders",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 0.8),
                    ),
                  ),
                ),
                Box(height: 0, width: 30),
                HoverWidget(
                  hoverChild: Column(
                    children: [
                      Text(
                        "Users",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black45,
                              fontSize: 14,
                              letterSpacing: 0.8),
                        ),
                      ),
                      Box(height: 4, width: 0),
                      AnimatedContainer(
                        duration: Duration(seconds: 3),
                        height: 1.5,
                        color: Colors.black,
                        width: 50,
                      )
                    ],
                  ),
                  onHover: (PointerEnterEvent event) {
                    print("HELLO");
                  },
                  child: Text(
                    "Users",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 0.8),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
