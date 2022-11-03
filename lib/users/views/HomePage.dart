//completed

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/controllers/cart_controller.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/admin/Admin.dart';
import 'package:mine/users/views/allitemspage.dart';
import 'package:mine/users/views/animatedimage.dart';
import 'package:mine/users/views/categorylord.dart';
import 'package:mine/users/views/permium.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mine/users/views/detailproductscreen.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../HomeScreenWidgets/HomeWidgets.dart';
import '../../Widgets/Custom_Widgets.dart';
import '../../helpers/mobilewidgets.dart';
import '../../helpers/responsive_widget.dart';
import 'maincategory.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cartno = 0;
  @override
  void initState() {
    context.read<CartController>().cartvaluefinder();
    print("msr");
  int cartvalueno() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        cartno = querySnapshot.docs.length;
        print("cart no " + cartno.toString());
      });
    });
    return cartno;
   }

    
    // TODO: implement initState
    super.initState();
  }
  
 
  
  @override
  
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    
    double height = 300;
    var count = 3;
    if(MediaQuery.of(context).size.width < 700){
      count = 2;
    }
    return Scaffold(
        body: SafeArea(
            child: ResponsiveWidget(
                mobile: SingleChildScrollView(
                    child: SizedBox(
                        child: Column(children: [
                          Container(
                            height: 50,
                            child: Center(
                              child: Text(
      "mine",
      textAlign: TextAlign.center,
      style: GoogleFonts.nunitoSans(
        textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 15,
            letterSpacing: 0),
      ),
    ),
                            ),
                            color: Colors.white,
                          ),
 Container(
                            height: 50,
                            child: Center(
                              child: Container(
                                height: 45,
                                child: Row(
                                  children: [
                                    SizedBox(width: 10,),
                                    Icon(Icons.search),
                                    SizedBox(width: 6,),
                                    Text(
      " what you are looking for",
      textAlign: TextAlign.center,
      style: GoogleFonts.nunitoSans(
        textStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 15,
            letterSpacing: 0),
      ),
    ),


                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black87)
                                ),
                                width: MediaQuery.of(context).size.width - 20,
                              )
                            ),
                            color: Colors.white,
                          ),
                          Container(
                            height: 20,
                            color: Colors.white,
                          ),


                  // MobileTitleWebBox(),
                 Container(
                    
                    height:250,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Handcrafted Furniture \nfor all your rooms",
              style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 0),
              ),
            ),
            Box(height: 10, width: 0),
            Container(
              height: 2,
              color: Colors.white,
              width: 60,
            ),     Box(height: 10, width: 0),
             Row(
               children: [
                 Text(
                  "See our modern classic made \njust for your home . ",
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 17,
                          letterSpacing: 0),
                  ),
            
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(context,
            //           MaterialPageRoute(builder: (_) => AllItemsScreen()));
            //   },
            //   child: Container(
            //     height: 35,
            //     width: 100,
            //     child: Center(
            //       child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,size: 14,),
            //     ),
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //           color: Color.fromRGBO(204, 191, 171, 1),
            //           border:
            //               Border.all(color: Color.fromRGBO(204, 191, 171, 1))),
            //   ),
            // ),
               ],
             ),
           
            
          ],
        ),
                    ),
                    decoration:BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png"),fit: BoxFit.cover)

                    )
                  
                  ),
                  Box(height: 30, width: 0),
                   InkWell(
                        onTap: (){
                         print(MediaQuery.of(context).size.width/1.5);
                        },
                        child: Text(
                          "SHOP BY CATEGORY",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold
                                ,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 4),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                    
                      Container(
                    height:700,
// MediaQuery.of(context).size.width/1.5,

                  
                   // 880,
                    //
                     width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Category")
                          .snapshots(),
                      builder: (context, snapshots) {
                        return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                                itemCount: 6,
                                

                                //todoooo
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          mainAxisExtent: 220,
                                      childAspectRatio: (.2),
                                      ),
                                itemBuilder: (context, index) {
                                  
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return CategoryLord(
                                             category:
                                                  snapshots.data!.docs[index]['name'].toString().toUpperCase());
                                        }));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left:20.0,right:20,top:20,bottom:10),
                                              child: Image(
                                                image: NetworkImage(
                                                  snapshots.data!.docs[index]
                                                      ['image'],
                                                ),
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: MediaQuery.of(context).size.width / 2.9,
                                              ),
                                            ),
                                            
                                            SizedBox(height: 7,),
                                            Text(
                                       
                                                    snapshots.data!.docs[index]
                                                        ['name'].toString().toUpperCase() ,
                                                        textAlign: TextAlign.center,
                                              style: GoogleFonts.nunitoSans(
                                                
                                                textStyle: TextStyle(
                                                  
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    letterSpacing: 1),
                                              ),
                                            ),
                                            Spacer(),
                                            //  Container(
                                            //         height: 30,
                                            //         child:  Center(
                                            //           child: Text(
                                            //      "SHOP",
                                            //       style: GoogleFonts.nunitoSans(
                                            //           textStyle: TextStyle(
                                            //               fontWeight:
                                            //                   FontWeight.bold,
                                            //               color: Colors.black,
                                            //               fontSize: 14,
                                            //               letterSpacing: 2),
                                            //       ),
                                            //     ),
                                            //         ),
                                                  
                                            //         color: Colors.brown[50],
                                            //       ),
                                          ],
                                        ),
                                        // height:  MediaQuery.of(context).size.width / ,
                                        color: Colors.grey[100],
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),

 InkWell(
                    onTap: (){
                      Get.to(MainCategory());
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "EXPLORE ALL CATEGORY",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height:50
                  ),
//ala


                 
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => Admin()));
                      },
                      child: Text(
                        "LATEST ITEMS",
                        style: GoogleFonts.nunitoSans(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 4),
                        ),
                      ),
                    ),
                  ),
                  Box(height: 30, width: 0),
                  Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("SearchProducts")
                          .snapshots(),
                      builder: (context, snapshots) {
                         return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                               
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 5,
          crossAxisSpacing: 2,
          crossAxisCount: 2,
          mainAxisExtent: 220,
                                      childAspectRatio: (.2),
                                  ),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: (){
                                     Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return DetailProductScreen(
                                              queryDocumentSnapshot:
                                                  snapshots.data!.docs[index]);
                                        }));
                                  },
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                          // padding: const EdgeInsets.only(
                                          //     left: 10.0,
                                          //     top: 10,
                                          //     right: 10,
                                          //     bottom: 2),
                                          child: Image(
                                            image: NetworkImage(
                                              snapshots.data!.docs[index]
                                                  ['mainimage'],
                                            ),
                                            fit: BoxFit.cover,
                                            width: 300,
                                            height:  MediaQuery.of(context).size.width / 4.5,
                                          ),
                                        ),
                                        Box(height: 0, width: 0),
                                   Text(
                                               snapshots.data!.docs[index]
                                                   ['name'].toString().toLowerCase(),
                                                   textAlign: TextAlign.center,
                                               style: GoogleFonts.nunitoSans(
                                                 textStyle: TextStyle(
                                                     fontWeight:
                                                         FontWeight.bold,
                                                     color: Colors.black,
                                                     fontSize: 12,
                                                     letterSpacing: 0),
                                               ),
                                             ),
                                             Spacer()
// ,                                             Container(
//                                                     height: 30,
//                                                     child:  Center(
//                                                       child: Text(
//                                                  "BUY",
//                                                   style: GoogleFonts.nunitoSans(
//                                                       textStyle: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           color: Colors.black,
//                                                           fontSize: 14,
//                                                           letterSpacing: 2),
//                                                   ),
//                                                 ),
//                                                     ),
                                                  
//                                                     color: Colors.brown[50],
//                                                   ),
                                      ],
                                    ),
                                    height: 400,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            });
                      },
                    ),
                  ),

                  // Container(
                  //     height: 700,
                  //     width: MediaQuery.of(context).size.width,
                  //     color: Colors.red,
                  //     child: StreamBuilder<QuerySnapshot>(
                  //         stream: FirebaseFirestore.instance
                  //             .collection("category")
                  //             .snapshots(),
                  //         builder: (context, snapshot) {
                  //           return GridView.builder(
                  //               itemCount: 3,
                  //               gridDelegate:
                  //                   SliverGridDelegateWithMaxCrossAxisExtent(
                  //                       maxCrossAxisExtent: 3),
                  //               itemBuilder: (context, index) {
                  //                 return Container(
                  //                   height: 500,
                  //                   width: 400,
                  //                   color: Colors.red,
                  //                 );
                  //               });
                  //         })),

                  
                //finalcode  
                  // Center(
                  //   child: Text(
                  //     "SHOP BY CATEGORY",
                  //     style: GoogleFonts.nunitoSans(
                  //       textStyle: TextStyle(
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           letterSpacing: 2),
                  //     ),
                  //   ),
                  // ),
                  // Box(height: 40, width: 0),

                  // Container(
                  //     height: 800,
                  //     width: MediaQuery.of(context).size.width,
                  //     color: Colors.white,
                  //     child: StreamBuilder<QuerySnapshot>(
                  //         stream: FirebaseFirestore.instance
                  //             .collection("category")
                  //             .limit(4)
                  //             .snapshots(),
                  //         builder: (context, snapshot) {
                  //            return !snapshot.hasData
                  //           ? Center(
                  //               child: CircularProgressIndicator(),
                  //             )
                  //           : 
                  //     ListView.builder(
                  //               physics: NeverScrollableScrollPhysics(),
                  //               itemBuilder: ((context, index) {
                  //                 return Container(
                  //                   height: 200,
                  //                   child: index % 2 == 0
                  //                       ? Row(children: [
                  //                           Container(
                  //                             height: 400,
                  //                             width: MediaQuery.of(context)
                  //                                     .size
                  //                                     .width /
                  //                                 2,
                  //                             child: Center(
                  //                               child: Column(
                  //                                 mainAxisAlignment:
                  //                                     MainAxisAlignment.center,
                  //                                 children: [
                  //                                   Text(
                  //                                     "Explore high quality " +
                  //                                         snapshot.data!
                  //                                                 .docs[index]
                  //                                             ['name'] +
                  //                                         " Items",
                  //                                     textAlign:
                  //                                         TextAlign.center,
                  //                                     style: GoogleFonts.nunitoSans(
                  //                                       textStyle: TextStyle(
                  //                                           fontWeight:
                  //                                               FontWeight
                  //                                                   .normal,
                  //                                           color: Colors.black,
                  //                                           fontSize: 20,
                  //                                           letterSpacing: 0.5),
                  //                                     ),
                  //                                   ),
                  //                                   Box(height: 20, width: 0),
                  //                                   Container(
                  //                                     height: 40,
                  //                                     width: 200,
                  //                                     color: Colors.black,
                  //                                     child: Center(
                  //                                       child: Text(
                  //                                         "EXPLORE NOW",
                  //                                         textAlign:
                  //                                             TextAlign.center,
                  //                                         style: GoogleFonts
                  //                                             .nunitoSans(
                  //                                           textStyle: TextStyle(
                  //                                               fontWeight:
                  //                                                   FontWeight
                  //                                                       .normal,
                  //                                               color: Colors
                  //                                                   .white,
                  //                                               fontSize: 15,
                  //                                               letterSpacing:
                  //                                                   0.5),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                   )
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                             color: Colors.white,
                  //                           ),
                  //                           Expanded(
                  //                               child: Container(
                  //                             decoration: BoxDecoration(
                  //                                 color: Colors.grey[100],
                  //                                 image: DecorationImage(
                  //                                     image: NetworkImage(
                  //                                       snapshot.data!
                  //                                               .docs[index]
                  //                                           ['image'],
                  //                                     ),
                  //                                     fit: BoxFit.cover)),
                  //                             height: 400,
                  //                             width: MediaQuery.of(context)
                  //                                     .size
                  //                                     .width /
                  //                                 2,
                  //                           ))
                  //                         ])
                  //                       : Row(children: [
                  //                           Container(
                  //                             height: 400,
                  //                             decoration: BoxDecoration(
                  //                                 color: Colors.grey[100],
                  //                                 image: DecorationImage(
                  //                                     image: NetworkImage(
                  //                                       snapshot.data!
                  //                                               .docs[index]
                  //                                           ['image'],
                  //                                     ),
                  //                                     fit: BoxFit.cover)),
                  //                             width: MediaQuery.of(context)
                  //                                     .size
                  //                                     .width /
                  //                                 2,
                  //                           ),
                  //                           Expanded(
                  //                               child: Container(
                  //                                   height: 400,
                  //                                   color: Colors.white,
                  //                                   width:
                  //                                       MediaQuery.of(context)
                  //                                               .size
                  //                                               .width /
                  //                                           2,
                  //                                   child: Center(
                  //                                       child: Column(
                  //                                           mainAxisAlignment:
                  //                                               MainAxisAlignment
                  //                                                   .center,
                  //                                           children: [
                  //                                         Text(
                  //                                           "Explore high quality " +
                  //                                               snapshot.data!
                  //                                                           .docs[
                  //                                                       index]
                  //                                                   ['name'] +
                  //                                               " Items",
                  //                                           textAlign: TextAlign
                  //                                               .center,
                  //                                           style: GoogleFonts
                  //                                               .nunitoSans(
                  //                                             textStyle: TextStyle(
                  //                                                 fontWeight:
                  //                                                     FontWeight
                  //                                                         .normal,
                  //                                                 color: Colors
                  //                                                     .black,
                  //                                                 fontSize: 20,
                  //                                                 letterSpacing:
                  //                                                     0.5),
                  //                                           ),
                  //                                         ),
                  //                                         Box(
                  //                                             height: 20,
                  //                                             width: 0),
                  //                                         Container(
                  //                                             height: 40,
                  //                                             width: 200,
                  //                                             color:
                  //                                                 Colors.black,
                  //                                             child: Center(
                  //                                               child: Text(
                  //                                                 "EXPLORE NOW",
                  //                                                 textAlign:
                  //                                                     TextAlign
                  //                                                         .center,
                  //                                                 style:
                  //                                                     GoogleFonts
                  //                                                         .nunitoSans(
                  //                                                   textStyle: TextStyle(
                  //                                                       fontWeight:
                  //                                                           FontWeight
                  //                                                               .normal,
                  //                                                       color: Colors
                  //                                                           .white,
                  //                                                       fontSize:
                  //                                                           15,
                  //                                                       letterSpacing:
                  //                                                           0.5),
                  //                                                 ),
                  //                                               ),
                  //                                             ))
                  //                                       ]))))
                  //                         ]),
                  //                   width: MediaQuery.of(context).size.width,
                  //                   color: Colors.black,
                  //                 );
                  //               }));
                  //         })),
                  Box(height: 0, width: 0),
                GestureDetector(
                  onTap: (){
                    Get.to(AllItemsScreen());
                  },
                    child: Container(
                      height: 40,
                      width: 200,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "EXPLORE ALL",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Box(height: 40, width: 0),

                  // Text(
                  //   "TRENDING PRODUCT OF THE WEEK",
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.nunitoSans(
                  //     textStyle: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         letterSpacing: 2),
                  //   ),
                  // ),
                  // Box(height: 30, width: 0),
                  // Container(
                  //     height: 800,
                  //     child: StreamBuilder<QuerySnapshot>(
                  //         stream: FirebaseFirestore.instance
                  //             .collection("category")
                  //             .limit(1)
                  //             .snapshots(),
                  //         builder: (context, snapshot) {
                  //         return !snapshot.hasData
                  //           ? Center(
                  //               child: CircularProgressIndicator(),
                  //             )
                  //           :  Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.all(30.0),
                  //                 child: Container(
                  //                     child: Image.network(
                  //                   snapshot.data!.docs[0]['image'],
                  //                   fit: BoxFit.cover,
                  //                 )),
                  //               ),
                  //               Box(height: 30, width: 0),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   Text(
                  //                     "Mr and Mrs Design Wood Works",
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Container(height: 2,color: Colors.black,width: 90,),
                  //                   Box(height: 40,width: 0,),
                  //                   Text(
                  //                     snapshot.data!.docs[0]['name'],
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     snapshot.data!.docs[0]['detailedname']
                  //                         .toString()
                  //                         .toUpperCase(),
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 19,
                  //                           letterSpacing: 2),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     "RS " + snapshot.data!.docs[0]['price'],
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Container(
                  //                     height: 40,
                  //                     width: 200,
                  //                     child: Center(
                  //                       child: Text(
                  //                         "VIEW PRODUCT",
                  //                         textAlign: TextAlign.center,
                  //                         style: GoogleFonts.nunitoSans(
                  //                           textStyle: TextStyle(
                  //                               fontWeight: FontWeight.bold,
                  //                               color: Colors.white,
                  //                               fontSize: 15,
                  //                               letterSpacing: 2),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.black,
                  //                         border:
                  //                             Border.all(color: Colors.black)),
                  //                   )
                  //                 ],
                  //               )
                  //             ],
                  //           );
                  //         })),
                  // Box(height: 60, width: 0),

                  // Container(
                  //   height: 316,
                  //   child: ResponsiveGridCol(
                  //     xs: 6,
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             height: 300,
                  //             width: MediaQuery.of(context).size.width,
                  //             child: GridviewImage(
                  //                 url:
                  //                     "https://images.pexels.com/photos/6707628/pexels-photo-6707628.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 316,
                  //   child: ResponsiveGridCol(
                  //     xs: 6,
                  //     child: Column(
                  //       children: [
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Container(
                  //             height: 300,
                  //             width: MediaQuery.of(context).size.width,
                  //             child: GridviewImage(
                  //                 url:
                  //                     "https://images.pexels.com/photos/2440471/pexels-photo-2440471.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Box(height: 20, width: 0),

                  // Container(
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Color.fromRGBO(242, 242, 239, 1),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Brands that believe our Furnitures",
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.nunitoSans(
                  //           textStyle: TextStyle(
                  //               fontWeight: FontWeight.normal,
                  //               color: Colors.black,
                  //               fontSize: 20,
                  //               letterSpacing: 0.5),
                  //         ),
                  //       ),
                  //       Box(height: 60, width: 0),
                  //       SingleChildScrollView(
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Image.network(
                  //               "https://i.ibb.co/NV97bn3/925721471s.png",
                  //               height: 100,
                  //             ),
                  //             Box(height: 0, width: 40),
                  //             Image.network(
                  //               "https://i.ibb.co/mhFNLKD/011020125946-Casa-logo.jpg",
                  //               height: 100,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 40, bottom: 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/913/913241.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Packaged with love\nafter proper sanitazation",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/1332/1332646.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Pay with\nsecure payment",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, top: 40, bottom: 0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/128/411/411763.png",
                                    height: 100,
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Free Shipping \nwithin india",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/5881/5881616.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Superior\nCraftmanship",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "FURNITURES ARE MADE IN FINE QUALITY HAND PICKED WOODS",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                        Box(height: 30, width: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           
                     
                            InkWell(
                              onTap: (){
                                Get.to(AllItemsScreen());
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "SHOP US",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/5089175/pexels-photo-5089175.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  MobileEndBox()
                ]))),
                tab: SingleChildScrollView(
                    child: SizedBox(
                        child: Column(children: [
                  TopNotifyBlackBox(),
                  TitleWebBox(),
                 Container(
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FINE QUALITY | HAND MADE",
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                    letterSpacing: 4),
              ),
            ),
            Box(height: 20, width: 0),
            Text(
              "PERMIUM MODERN & DESIGN FURNITURE WORKS",
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 23,
                    letterSpacing: 4),
              ),
            ),
            Box(height: 60, width: 0),
            GestureDetector(
              onTap: (){
                Get.to(AllItemsScreen());
              },
              child: Container(
                height: 45,
                width: 150,
                child: Center(
                  child: Text(
                    "SHOP ITEMS",
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
                    border: Border.all(color: Color.fromRGBO(204, 191, 171, 1))),
              ),
            ),
          ],
        ),
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                      
                      image: DecorationImage(image: NetworkImage("https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",),fit: BoxFit.cover)),
                  ),
                  Box(height: 60, width: 0),
                  InkWell(
                        onTap: (){
                         print(MediaQuery.of(context).size.width/1.5);
                        },
                        child: Text(
                          "SHOP BY CATEGORY",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold
                                ,
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 4),
                          ),
                        ),
                      ),
                      SizedBox(height: 60,),
                    
                      Container(
                    height:700,
// MediaQuery.of(context).size.width/1.5,

                  
                   // 880,
                    //
                     width: MediaQuery.of(context).size.width - 100,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Category")
                          .snapshots(),
                      builder: (context, snapshots) {
                        return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                itemCount: 6,
                                

                                //todoooo
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          mainAxisExtent: 320,
                                      childAspectRatio: (.2),
                                      ),
                                itemBuilder: (context, index) {
                                  
                                  return Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print(snapshots.data!.docs[index]['name']);
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return CategoryLord(category: snapshots.data!.docs[index]['name'].toString().toUpperCase(),);
                                              // queryDocumentSnapshot:
                                              //     snapshots.data!.docs[index]);
                                        }));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Image(
                                                image: NetworkImage(
                                                  snapshots.data!.docs[index]
                                                      ['image'],
                                                ),
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: MediaQuery.of(context).size.width / 7,
                                              ),
                                            ),
                                            Box(height: 0, width: 0),
                                            Text(
                                            
                                                    snapshots.data!.docs[index]
                                                        ['name'].toString().toUpperCase() ,
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    letterSpacing: 0),
                                              ),
                                            ),
                                              Spacer(),
                                          // SizedBox(height: 10,),
                                          //    Container(
                                          //       height: 40,
                                          //       child:  Center(
                                          //         child: Text(
                                          //    "SHOP",
                                          //     style: GoogleFonts.nunitoSans(
                                          //         textStyle: TextStyle(
                                          //             fontWeight:
                                          //                 FontWeight.bold,
                                          //             color: Colors.black,
                                          //             fontSize: 14,
                                          //             letterSpacing: 2),
                                          //     ),
                                          //   ),
                                          //       ),
                                          //       // width: 200,
                                          //       color: Colors.brown[50],
                                          //     ),
                                              Spacer()
                                          
                                            
                                          ],
                                        ),
                                        height:  MediaQuery.of(context).size.width / 6,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),
                   InkWell(
                    onTap: (){
                      Get.to(MainCategory());
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "EXPLORE ALL CATEGORY",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 60,),




                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => Admin()));
                      },
                      child: InkWell(
                        onTap: (){
                         print(MediaQuery.of(context).size.width/1.5);
                        },
                        child: Text(
                          "LATEST ITEMS",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold
                                ,
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Box(height: 60, width: 0),
                  
                  Container(
                    height:880,
// MediaQuery.of(context).size.width/1.5,

                  
                   // 880,
                    //
                    // width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("SearchProducts")
                          .snapshots(),
                      builder: (context, snapshots) {
                        return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                itemCount: 6,
                                

                                //todoooo
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: count,
          mainAxisExtent: 420,
                                      childAspectRatio: (.7),
                                      ),
                                itemBuilder: (context, index) {
                                  
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return DetailProductScreen(
                                              queryDocumentSnapshot:
                                                  snapshots.data!.docs[index]);
                                        }));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Image(
                                                image: NetworkImage(
                                                  snapshots.data!.docs[index]
                                                      ['mainimage'],
                                                ),
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: 300,
                                              ),
                                            ),
                                            Box(height: 0, width: 0),
                                            Text(
                                              snapshots.data!.docs[index]
                                                  ['name'],
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    letterSpacing: 0),
                                              ),
                                            ),
                                             
                                           Spacer(),
                                          SizedBox(height: 10,),
                                            //  Container(
                                            //     height: 40,
                                            //     child:  Center(
                                            //       child: Text(
                                            //  "BUY",
                                            //   style: GoogleFonts.nunitoSans(
                                            //       textStyle: TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           color: Colors.black,
                                            //           fontSize: 14,
                                            //           letterSpacing: 2),
                                            //   ),
                                            // ),
                                            //     ),
                                            //     width: 200,
                                            //     color: Colors.brown[50],
                                            //   ),
                                              Spacer()
                                          ],
                                        ),
                                        height: 400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),

                  Box(height: 40, width: 0),
                  InkWell(
                    onTap: (){
                      Get.to(AllItemsScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "EXPLORE ALL",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Box(height: 60, width: 0),

                  // Text(
                  //   "TRENDING PRODUCT OF THE WEEK",
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.nunitoSans(
                  //     textStyle: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         letterSpacing: 2),
                  //   ),
                  // ),
                  // Box(height: 30, width: 0),
                  // Container(
                  //     height: 500,
                  //     child: StreamBuilder<QuerySnapshot>(
                  //         stream: FirebaseFirestore.instance
                  //             .collection("category")
                  //             .limit(1)
                  //             .snapshots(),
                  //         builder: (context, snapshot) {
                  //            return !snapshot.hasData
                  //           ? Center(
                  //               child: CircularProgressIndicator(),
                  //             )
                  //           : 
                  //        Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Image.network(snapshot.data!.docs[0]['image']),
                  //               Box(height: 0, width: 40),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   Text(
                  //                     "Mr and Mrs Design Wood Works",
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                     Box(height: 20, width: 0),
                  //                   Container(
                  //                     height: 3,
                  //                     color: Colors.black,
                  //                     width: 200,
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     snapshot.data!.docs[0]['name'],
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     snapshot.data!.docs[0]['detailedname']
                  //                         .toString()
                  //                         .toUpperCase(),
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.normal,
                  //                           color: Colors.black,
                  //                           fontSize: 19,
                  //                           letterSpacing: 2),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     "RS " + snapshot.data!.docs[0]['price'],
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.normal,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Container(
                  //                     height: 40,
                  //                     width: 200,
                  //                     child: Center(
                  //                       child: Text(
                  //                         "VIEW PRODUCT",
                  //                         textAlign: TextAlign.center,
                  //                         style: GoogleFonts.nunitoSans(
                  //                           textStyle: TextStyle(
                  //                               fontWeight: FontWeight.normal,
                  //                               color: Colors.white,
                  //                               fontSize: 15,
                  //                               letterSpacing: 0.5),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.black,
                  //                         border:
                  //                             Border.all(color: Colors.black)),
                  //                   )
                  //                 ],
                  //               )
                  //             ],
                  //           );
                  //         })),
                  Box(height: 60, width: 0),
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xs: 6,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: GridviewImage(
                                  url:
                                      "https://images.pexels.com/photos/6707628/pexels-photo-6707628.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: GridviewImage(
                                  url:
                                      "https://images.pexels.com/photos/2440471/pexels-photo-2440471.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Box(height: 20, width: 0),

                  Box(height: 30, width: 0),
                  // Container(
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Color.fromRGBO(242, 242, 239, 1),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Brands that believe our Furnitures",
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.nunitoSans(
                  //           textStyle: TextStyle(
                  //               fontWeight: FontWeight.normal,
                  //               color: Colors.black,
                  //               fontSize: 20,
                  //               letterSpacing: 0.5),
                  //         ),
                  //       ),
                  //       Box(height: 20, width: 0),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Image.network(
                  //             "https://i.ibb.co/NV97bn3/925721471s.png",
                  //             height: 150,
                  //           ),
                  //           Box(height: 0, width: 40),
                  //           Image.network(
                  //             "https://i.ibb.co/mhFNLKD/011020125946-Casa-logo.jpg",
                  //             height: 150,
                  //           )
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/128/411/411763.png",
                                    height: 100,
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Free Shipping \nwithin india",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/913/913241.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Packaged with love\nafter proper sanitazation",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/1332/1332646.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Pay with\nsecure payment",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/5881/5881616.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Superior\nCraftmanship",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "FURNITURES ARE MADE IN FINE QUALITY HAND PICKED WOODS",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                        Box(height: 30, width: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(AllItemsScreen());
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "SHOP US",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/5089175/pexels-photo-5089175.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  MobileEndBox()
                ]))),
                desktop: SingleChildScrollView(
                    child: SizedBox(
                        child: Column(children: [
                   TopNotifyBlackBox(),
                  TitleWebBox(),
                  Container(
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FINE QUALITY | HAND MADE",
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                    letterSpacing: 4),
              ),
            ),
            Box(height: 20, width: 0),
            Text(
              "PERMIUM MODERN & DESIGN FURNITURE WORKS",
              style: GoogleFonts.ubuntu(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontSize: 23,
                    letterSpacing: 4),
              ),
            ),
            Box(height: 60, width: 0),
            GestureDetector(
              onTap: (){
                Get.to(AllItemsScreen());
              },
              child: Container(
                height: 45,
                width: 150,
                child: Center(
                  child: Text(
                    "SHOP ITEMS",
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
                    border: Border.all(color: Color.fromRGBO(204, 191, 171, 1))),
              ),
            ),
          ],
        ),
                    
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                      
                      image: DecorationImage(image: NetworkImage("https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",),fit: BoxFit.cover)),
                  ),
                  // SizeWidget(
                  //   seconds: 1,
                  //   height: 320,
                  //   width: width,
                  //   url: "https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",
                  // ),
                  Box(height: 20, width: 0),
                  InkWell(
                        onTap: (){
                         print(MediaQuery.of(context).size.width/1.5);
                        },
                        child: Text(
                          "SHOP BY CATEGORY",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold
                                ,
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 4),
                          ),
                        ),
                      ),
                      SizedBox(height: 60,),
                    
                      Container(
                    height:700,
// MediaQuery.of(context).size.width/1.5,

                  
                   // 880,
                    //
                     width: MediaQuery.of(context).size.width - 300,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("Category")
                          .snapshots(),
                      builder: (context, snapshots) {
                        return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                itemCount: 6,                           

                                //todoooo
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          mainAxisExtent: 320,
                                      childAspectRatio: (.2),
                                      ),
                                itemBuilder: (context, index) {
                                  
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print(snapshots.data!.docs[index]['name']);
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return CategoryLord(category: snapshots.data!.docs[index]['name'].toString().toUpperCase(),);
                                              // queryDocumentSnapshot:
                                              //     snapshots.data!.docs[index]);
                                        }));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Image(
                                                
                                                image: NetworkImage(
                                                  snapshots.data!.docs[index]
                                                      ['image'],
                                                ),
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: MediaQuery.of(context).size.width / 7,
                                              ),
                                            ),
                                            Box(height: 0, width: 0),
                                            
                                            Center(
                                              child: Text(
                                                snapshots.data!.docs[index]
                                                    ['name'].toString().toUpperCase(),
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      letterSpacing: 2),
                                                ),
                                              ),
                                            ),
                                             Spacer(),
                                          SizedBox(height: 10,),
                                            //  Container(
                                            //     height: 40,
                                            //     child:  Center(
                                            //       child: Text(
                                            //  "SHOP",
                                            //   style: GoogleFonts.nunitoSans(
                                            //       textStyle: TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           color: Colors.black,
                                            //           fontSize: 14,
                                            //           letterSpacing: 2),
                                            //   ),
                                            // ),
                                            //     ),
                                            //     // width: 200,
                                            //     color: Colors.brown[50],
                                            //   ),
                                              Spacer()
                                          
                                            
                                          ],
                                        ),
                                        height:  MediaQuery.of(context).size.width / 6,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),
                   InkWell(
                    onTap: (){
                      Get.to(MainCategory());
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "EXPLORE ALL CATEGORY",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 60,),




                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => Admin()));
                      },
                      child: InkWell(
                        onTap: (){
                         print(MediaQuery.of(context).size.width/1.5);
                        },
                        child: Text(
                          "LATEST ITEMS",
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold
                                ,
                                color: Colors.black,
                                fontSize: 17,
                                letterSpacing: 4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Box(height: 60, width: 0),
                  
                  Container(
                    height:880,
// MediaQuery.of(context).size.width/1.5,

                  
                   // 880,
                    //
                    // width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("SearchProducts")
                          .snapshots(),
                      builder: (context, snapshots) {
                        return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                                itemCount: 6,
                                

                                //todoooo
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: count,
          mainAxisExtent: 420,
                                      childAspectRatio: (.7),
                                      ),
                                itemBuilder: (context, index) {
                                  
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return DetailProductScreen(
                                              queryDocumentSnapshot:
                                                  snapshots.data!.docs[index]);
                                        }));
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Image(
                                                image: NetworkImage(
                                                  snapshots.data!.docs[index]
                                                      ['mainimage'],
                                                ),
                                                fit: BoxFit.cover,
                                                width: 300,
                                                height: 300,
                                              ),
                                            ),
                                            Box(height: 0, width: 0),
                                            Text(
                                              snapshots.data!.docs[index]
                                                  ['name'],
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    letterSpacing: 0),
                                              ),
                                            ),
                                            Spacer(),
                                          SizedBox(height: 10,),
                                            //  Container(
                                            //     height: 40,
                                            //     child:  Center(
                                            //       child: Text(
                                            //  "BUY",
                                            //   style: GoogleFonts.nunitoSans(
                                            //       textStyle: TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           color: Colors.black,
                                            //           fontSize: 14,
                                            //           letterSpacing: 2),
                                            //   ),
                                            // ),
                                            //     ),
                                            //     width: 200,
                                            //     color: Colors.brown[50],
                                            //   ),
                                              Spacer()
                                          ],
                                        ),
                                        height: 400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                });
                      },
                    ),
                  ),

                  Box(height: 40, width: 0),
                  InkWell(
                    onTap: (){
                      Get.to(AllItemsScreen());
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          "EXPLORE ALL",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Box(height: 60, width: 0),

                  // Text(
                  //   "TRENDING PRODUCT OF THE WEEK",
                  //   textAlign: TextAlign.center,
                  //   style: GoogleFonts.nunitoSans(
                  //     textStyle: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black,
                  //         fontSize: 18,
                  //         letterSpacing: 2),
                  //   ),
                  // ),
                  // Box(height: 30, width: 0),
                  // Container(
                  //     height: 500,
                  //     child: StreamBuilder<QuerySnapshot>(
                  //         stream: FirebaseFirestore.instance
                  //             .collection("category")
                  //             .limit(1)
                  //             .snapshots(),
                  //         builder: (context, snapshot) {
                  //            return !snapshot.hasData
                  //           ? Center(
                  //               child: CircularProgressIndicator(),
                  //             )
                  //           : 
                  //        Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Image.network(snapshot.data!.docs[0]['image']),
                  //               Box(height: 0, width: 40),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   Text(
                  //                     "Mr and Mrs Design Wood Works",
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                     Box(height: 20, width: 0),
                  //                   Container(
                  //                     height: 3,
                  //                     color: Colors.black,
                  //                     width: 200,
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     snapshot.data!.docs[0]['name'],
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.bold,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     snapshot.data!.docs[0]['detailedname']
                  //                         .toString()
                  //                         .toUpperCase(),
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.normal,
                  //                           color: Colors.black,
                  //                           fontSize: 19,
                  //                           letterSpacing: 2),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Text(
                  //                     "RS " + snapshot.data!.docs[0]['price'],
                  //                     textAlign: TextAlign.center,
                  //                     style: GoogleFonts.nunitoSans(
                  //                       textStyle: TextStyle(
                  //                           fontWeight: FontWeight.normal,
                  //                           color: Colors.black,
                  //                           fontSize: 20,
                  //                           letterSpacing: 0.5),
                  //                     ),
                  //                   ),
                  //                   Box(height: 20, width: 0),
                  //                   Container(
                  //                     height: 40,
                  //                     width: 200,
                  //                     child: Center(
                  //                       child: Text(
                  //                         "VIEW PRODUCT",
                  //                         textAlign: TextAlign.center,
                  //                         style: GoogleFonts.nunitoSans(
                  //                           textStyle: TextStyle(
                  //                               fontWeight: FontWeight.normal,
                  //                               color: Colors.white,
                  //                               fontSize: 15,
                  //                               letterSpacing: 0.5),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     decoration: BoxDecoration(
                  //                         color: Colors.black,
                  //                         border:
                  //                             Border.all(color: Colors.black)),
                  //                   )
                  //                 ],
                  //               )
                  //             ],
                  //           );
                  //         })),
                  Box(height: 60, width: 0),
                  ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xs: 6,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: GridviewImage(
                                  url:
                                      "https://images.pexels.com/photos/6707628/pexels-photo-6707628.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 6,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: GridviewImage(
                                  url:
                                      "https://images.pexels.com/photos/2440471/pexels-photo-2440471.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Box(height: 20, width: 0),

                  Box(height: 30, width: 0),
                  // Container(
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Color.fromRGBO(242, 242, 239, 1),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "Brands that believe our Furnitures",
                  //         textAlign: TextAlign.center,
                  //         style: GoogleFonts.nunitoSans(
                  //           textStyle: TextStyle(
                  //               fontWeight: FontWeight.normal,
                  //               color: Colors.black,
                  //               fontSize: 20,
                  //               letterSpacing: 0.5),
                  //         ),
                  //       ),
                  //       Box(height: 20, width: 0),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Image.network(
                  //             "https://i.ibb.co/NV97bn3/925721471s.png",
                  //             height: 150,
                  //           ),
                  //           Box(height: 0, width: 40),
                  //           Image.network(
                  //             "https://i.ibb.co/mhFNLKD/011020125946-Casa-logo.jpg",
                  //             height: 150,
                  //           )
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/128/411/411763.png",
                                    height: 100,
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Free Shipping \nwithin india",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/913/913241.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Packaged with love\nafter proper sanitazation",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/1332/1332646.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Pay with\nsecure payment",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: 100, color: Colors.black, width: 2),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.network(
                                      "https://cdn-icons-png.flaticon.com/128/5881/5881616.png",
                                      height: 60,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Box(height: 20, width: 0),
                                Text(
                                  "Superior\nCraftmanship",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 12,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "FURNITURES ARE MADE IN FINE QUALITY HAND PICKED WOODS",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                        ),
                        Box(height: 30, width: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(AllItemsScreen());
                              },
                              child: Container(
                                height: 45,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    "SHOP US",
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/5089175/pexels-photo-5089175.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  EndBox()
                ]))))));
  }
}

class GridviewImage extends StatelessWidget {
  final String? url;
  const GridviewImage({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url.toString(),
      fit: BoxFit.cover,
    );
  }
}

class GridViewText extends StatelessWidget {
  final String? name;
  const GridViewText({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name.toString(),
      style: GoogleFonts.nunitoSans(
        textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
            letterSpacing: 0.5),
      ),
    );
  }
}

class GridViewSubText extends StatelessWidget {
  final String? name;
  const GridViewSubText({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name.toString(),
      style: GoogleFonts.nunitoSans(
        textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
            letterSpacing: 0.5),
      ),
    );
  }
}
