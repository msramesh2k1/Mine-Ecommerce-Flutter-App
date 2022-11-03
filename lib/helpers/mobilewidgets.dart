// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:mine/HomeScreenWidgets/aboutus.dart';
import 'package:mine/Orders.dart';
import 'package:mine/controllers/cart_controller.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/users/views/Search.dart';
import 'package:mine/Widgets/Custom_Widgets.dart';
import 'package:mine/users/views/Stepper.dart';
import 'package:mine/users/views/permium.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import 'package:searchfield/searchfield.dart';

import '../users/views/HomePage.dart';
import '../users/views/accountscree.dart';
import '../users/views/detailproductscreen.dart';
import '../users/views/loginpage.dart';
import '../users/views/allitemspage.dart';
import 'cartmethod.dart';

class TopMovileNotifyBlackBox extends StatelessWidget {
  const TopMovileNotifyBlackBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(204, 191, 171, 1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: TopText(),
        ),
      ),
    );
  }
}

class TopText extends StatelessWidget {
  const TopText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Shop Permium Quality Modern Furnitures",
      textAlign: TextAlign.center,
      style: GoogleFonts.nunitoSans(
        textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 15,
            letterSpacing: 1),
      ),
    );
  }
}

class MobileTitleWebBox extends StatelessWidget {
  const MobileTitleWebBox({
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
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Box(height: 0, width: 15),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/mr-and-mrs-93502.appspot.com/o/final.png?alt=media&token=e8359a2a-4eda-491f-8ccd-62e9840df409",
                  height: 90,
                ),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Text(
                //       "Mr & Mrs",
                //       style: GoogleFonts.novaSlim(
                //         textStyle: const TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: kBackgroundColor,
                //             fontSize: 25,
                //             letterSpacing: 0),
                //       ),
                //     ),
                //     Text(
                //       "Design Wood Works",
                //       style: GoogleFonts.openSans(
                //         textStyle: const TextStyle(
                //             fontWeight: FontWeight.normal,
                //             color: Colors.black,
                //             fontSize: 11,
                //             letterSpacing: 1),
                //       ),
                //     ),
                //   ],
                // ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    const Box(height: 0, width: 10),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Search()));
                        },
                        child: Icon(EvaIcons.searchOutline)),
                    const Box(height: 0, width: 10),
                    cartmethod(context),
                    const Box(height: 0, width: 5),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
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
                Box(height: 0, width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AllItemsScreen()));
                  },
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
                Box(height: 0, width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PermiumScreen()));
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
                Box(height: 0, width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Orders()));
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
                Box(height: 0, width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => AboutUs()));
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MobileSizeWidget extends StatefulWidget {
  final int seconds;
  final double height;
  final double width;
  final String url;

  const MobileSizeWidget(
      {required this.seconds,
      required this.height,
      required this.width,
      required this.url});

  @override
  _MobileSizeWidgetState createState() => _MobileSizeWidgetState();
}

class _MobileSizeWidgetState extends State<MobileSizeWidget>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _sizeAnimation;

  bool reverse = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.seconds))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController!.repeat(reverse: !reverse);
          reverse = !reverse;
        }
      });

    _sizeAnimation = Tween<double>(begin: widget.height, end: 615.0)
        .animate(_animationController!);
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation!,
      builder: (context, child) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FINE QUALITY | HAND MADE",
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 2),
              ),
            ),
            Box(height: 20, width: 0),
            Text(
              "PERMIUM MODERN & DESIGN FURNITURE WORKS",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 4),
              ),
            ),
            Box(height: 60, width: 0),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AllItemsScreen()));
              },
              child: Container(
                height: 45,
                width: 150,
                child: Center(
                  child: Text(
                    "EXPLORE",
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
                    border:
                        Border.all(color: Color.fromRGBO(204, 191, 171, 1))),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.url), fit: BoxFit.cover)),
        width: _sizeAnimation!.value * 5,
        height: _sizeAnimation!.value,
      ),
    );
  }
}

class MobileEndBox extends StatelessWidget {
  const MobileEndBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:800,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(242, 242, 239, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Box(height: 20, width: 0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Box(height: 40, width: 0),

                Column(
                  children: [
                    Container(
                      height: 275,
                      width: MediaQuery.of(context).size.width,
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  child: Image.network(
                                "https://d6xcmfyh68wv8.cloudfront.net/assets/payments/payment_method_cards.png",
                                height: 118,
                              )),
                              Box(height: 0, width: 50),
                              InkWell(
                                  child: Image.network(
                                "https://d6xcmfyh68wv8.cloudfront.net/assets/payments/cp_modes_wallets.png",
                                height: 118,
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Box(height: 20, width: 0),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  height: 5,
                                ),
                                Container(
                                  height: 3,
                                  width: 80,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                    ),  SizedBox(
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
                                  mainAxisAlignment: MainAxisAlignment.start,
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

                // Container(
                //   width: 500,
                //   height: 379,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "CONTACT US",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.bold,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 2),
                //         ),
                //       ),
                //       Box(height: 15, width: 0),
                //       Text(
                //         "Email : ",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Box(height: 5, width: 0),
                //       Text(
                //         "mrandmrsdesignwoodworks@gmail.com",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Box(height: 25, width: 0),
                //       Text(
                //         "Whatsapp",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Box(height: 5, width: 0),
                //       Text(
                //         "+917540032123",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Box(height: 25, width: 0),
                //       Text(
                //         "Address",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Box(height: 5, width: 0),
                //       Text(
                //         "1048/1 , Laxmi Building\nThoothukudi - Madurai National Highway (NH 38)\nMela Eral\nThoothukudi Dist, Tamil Nadu 628908",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Spacer(),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text(
                //             "© Copyright 2022  -  ",
                //             style: GoogleFonts.nunitoSans(
                //               textStyle: const TextStyle(
                //                   fontWeight: FontWeight.normal,
                //                   color: Colors.black,
                //                   fontSize: 14,
                //                   letterSpacing: 0.4),
                //             ),
                //           ),
                //           Text(
                //             "Mr & Mrs Design Wood Works.",
                //             style: GoogleFonts.nunitoSans(
                //               textStyle: const TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.black,
                //                   fontSize: 14,
                //                   letterSpacing: 1),
                //             ),
                //           ),
                //           Text(
                //             "  All Rights Reserved.",
                //             style: GoogleFonts.nunitoSans(
                //               textStyle: const TextStyle(
                //                   fontWeight: FontWeight.normal,
                //                   color: Colors.black,
                //                   fontSize: 14,
                //                   letterSpacing: 0.4),
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(
                //         height: 30,
                //       ),
                //       Container(
                //         height: 70,
                //         child: Center(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 "Follow us on : ",
                //                 style: GoogleFonts.nunitoSans(
                //                   textStyle: const TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       color: Colors.black,
                //                       fontSize: 14,
                //                       letterSpacing: 0.4),
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(20.0),
                //                 child: InkWell(
                //                     onTap: () async {
                //                       const url =
                //                           'https://www.facebook.com/mrandmrsdesignwoodworks';
                //                       if (await canLaunch(url)) {
                //                         await launch(url);
                //                       } else {
                //                         throw 'Could not launch $url';
                //                       }
                //                     },
                //                     child: Image.network(
                //                         "https://cdn-icons-png.flaticon.com/128/5968/5968764.png")),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.all(20.0),
                //                 child: InkWell(
                //                     onTap: () async {
                //                       const url =
                //                           'https://www.instagram.com/mrandmrsdesignwoodworks/';
                //                       if (await canLaunch(url)) {
                //                         await launch(url);
                //                       } else {
                //                         throw 'Could not launch $url';
                //                       }
                //                     },
                //                     child: Image.network(
                //                         "https://cdn-icons-png.flaticon.com/128/174/174855.png")),
                //               ),
                //             ],
                //           ),
                //         ),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(40)),
                //         width: MediaQuery.of(context).size.width - 40,
                //       ),
                //       Box(height: 10, width: 0),
                //     ],
                //   ),
                // ),
                // Container(
                //   width: 400,
                //   height: 200,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "CONNECT WITH US",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.bold,
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
                //   height: 192,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "ASSISTANCE",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.bold,
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
                //         "Exchange policy",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //       Box(height: 40, width: 0),
                //       Text(
                //         "© Mr and Mrs",
                //         style: GoogleFonts.nunitoSans(
                //           textStyle: const TextStyle(
                //               fontWeight: FontWeight.normal,
                //               color: Colors.black,
                //               fontSize: 14,
                //               letterSpacing: 0.4),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
