// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sizer/sizer.dart';
// import 'package:mrandmrs_ecom_webapp/helpers/mobilewidgets.dart';
// import 'package:mrandmrs_ecom_webapp/helpers/responsive_widget.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/Helper.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/loginpage.dart';
// import '../../../constants.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../HomeScreenWidgets/HomeWidgets.dart';
// import '../../Widgets/Custom_Widgets.dart';

// class DetailProductScreen extends StatefulWidget {
//   final QueryDocumentSnapshot queryDocumentSnapshot;
//   const DetailProductScreen({Key? key, required this.queryDocumentSnapshot})
//       : super(key: key);

//   @override
//   State<DetailProductScreen> createState() => _DetailProductScreenState();
// }

// class _DetailProductScreenState extends State<DetailProductScreen> {
//   double otherexpense = 0;
//   double itemsexpense = 0;
//   double reqexpense = 0;
//   List<String> reqwoodlist = [];
//   List<String> expense = [];
//   String? reqwoodtype;
//   String? expensetype;
//   int? imageno;
//   int? fileno;
//   int? videono;
//   int? reqno;
//   int? expno;
//   String? imgurl;
//   String woodtype = " ";
//   int quanityvalue = 1;
//   int woodhas = 0;
//   List _reqexpense = [];
//   int materials = 0;
//   int others = 0;
//   int salesprice = 0;
//   int link = 0;
//   int filelink = 0;
//   String? fileurl;
//   String? imagesurl;
//   // List _woodlist = [];
//   ScrollController? _controller;
//   ScrollController _imagecontroller = ScrollController();
//   TextEditingController tdimensioncontroller = new TextEditingController();
//   TextEditingController hdimensioncontroller = new TextEditingController();
//   TextEditingController wdimensioncontroller = new TextEditingController();
//   TextEditingController ddimensioncontroller = new TextEditingController();
//   TextEditingController serialcontroller = new TextEditingController();
//   TextEditingController expensecontroller = new TextEditingController();
//   TextEditingController itemcontroller = new TextEditingController();
//   TextEditingController commentscontroller = new TextEditingController();
//   TextEditingController qnocontroller = new TextEditingController();
//   TextEditingController litemdimensioncontroller = new TextEditingController();
//   TextEditingController witemdimensioncontroller = new TextEditingController();
//   TextEditingController categorycontroller = new TextEditingController();
//   TextEditingController productidcontroller = new TextEditingController();
//   TextEditingController ratecontroller = new TextEditingController();

//   @override
//   void initState() {
//     print(widget.queryDocumentSnapshot['id']);
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("Images")
//         .get()
//         .then((imagecount) {
//       setState(() {
//         imageno = imagecount.size;
//         print("IMAGE" + imagecount.size.toString());
//       });
//     });
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("files")
//         .get()
//         .then((imagecount) {
//       setState(() {
//         fileno = imagecount.size;
//         print("IMAGE" + imagecount.size.toString());
//       });
//     });
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("materials")
//         .get()
//         .then((imagecount) {
//       setState(() {
//         reqno = imagecount.size;
//         print("IMAGE" + imagecount.size.toString());
//       });
//     });
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("others")
//         .get()
//         .then((imagecount) {
//       setState(() {
//         expno = imagecount.size;
//       });
//     });
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("links")
//         .get()
//         .then((imagecount) {
//       setState(() {
//         videono = imagecount.size + 1;
//       });
//     });
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("WoodList")
//         .get()
//         .then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           reqwoodlist.add(element.data()['name']);
//           print(reqwoodlist);
//         });
//       });
//     });
//     FirebaseFirestore.instance.collection("Expense").get().then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           expense.add(element.data()['name']);
//         });
//       });
//     });

//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("materials")
//         .get()
//         .then((value) {
//       if (value.docs.length == 0) {
//         MRANDMRS.sharedprefs!
//             .setDouble("total+$widget.queryDocumentSnapshot['id']", 0);
//         print("Lenght of Others is Zero");
//       } else {
//         value.docs.forEach((element) {
//           setState(() {
//             _reqexpense.add((((element.data()['tvalue'] *
//                         element.data()['wvalue'] *
//                         element.data()['lvalue']) /
//                     1728 *
//                     element.data()['quantity']) *
//                 element.data()['rate']));
//           });
//         });
//         _reqexpense.forEach((value) {
//           reqexpense = reqexpense + value;
//           setState(() {
//             MRANDMRS.sharedprefs!.setDouble(
//                 "total+$widget.queryDocumentSnapshot['id']", reqexpense);
//           });
//         });
//       }
//     });

//     //     value.docs.forEach((element) {
//     //       setState(() {
//     //         ///(((((dex]['quantity']))) * snapshot.data.docs[index]['rate']).toStringAsFixed(2)
//     //         _reqexpense.add((((element.data()['tvalue'] *
//     //                     element.data()['wvalue'] *
//     //                     element.data()['lvalue']) /
//     //                 1728 *
//     //                 element.data()['quantity']) *
//     //             element.data()['rate']));
//     //         print(_reqexpense);
//     //       });
//     //     });

//     // }).then((value) {
//     //   _reqexpense.forEach((value) {
//     //     reqexpense = reqexpense + value;
//     //     setState(() {
//     //       MrandMrs.sharedprefs.setDouble(
//     //           "total+$widget.queryDocumentSnapshot['id']", reqexpense);
//     //     });

//     //   });
//     // }).then((value) =>
//     //        print("ije" +
//     //             MrandMrs.sharedprefs
//     //                 .getDouble("total+$widget.queryDocumentSnapshot['id']")
//     //                 .toStringAsFixed(2)));

//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection("others")
//         .get()
//         .then((value) {
//       if (value.docs.length == 0) {
//         MRANDMRS.sharedprefs!
//             .setDouble("subtotal+$widget.queryDocumentSnapshot['id']", 0);
//         print("Lenght of Others is Zero");
//       } else {
//         value.docs.forEach((element) {
//           otherexpense = otherexpense + element.data()['rate'];
//           MRANDMRS.sharedprefs!.setDouble(
//               "subtotal+$widget.queryDocumentSnapshot['id']",
//               otherexpense.toDouble());
//           print("No Is Has Minimum one Items");
//         });
//       }
//     });

//     FirebaseFirestore.instance
//         .collection('SearchProducts')
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection('WoodList')
//         .get()
//         .then((value) {
//       print("no" + value.size.toString());
//       setState(() {
//         woodhas = value.size.toInt();
//       });
//     });

//     _reqexpense.forEach((element) {
//       print("hi");
//     });
//     FirebaseFirestore.instance
//         .collection('SearchProducts')
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection('links')
//         .get()
//         .then((value) {
//       print("no" + value.size.toString());
//       setState(() {
//         link = value.size.toInt();
//       });
//     });
//     FirebaseFirestore.instance
//         .collection('SearchProducts')
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection('files')
//         .get()
//         .then((value) {
//       print("no" + value.size.toString());
//       setState(() {
//         filelink = value.size.toInt();
//       });
//     });
//     FirebaseFirestore.instance
//         .collection('SearchProducts')
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection('materials')
//         .get()
//         .then((value) {
//       print("no" + value.size.toString());
//       setState(() {
//         materials = value.size.toInt();
//       });
//     });
//     FirebaseFirestore.instance
//         .collection('SearchProducts')
//         .doc(widget.queryDocumentSnapshot['id'])
//         .collection('others')
//         .get()
//         .then((value) {
//       print("no" + value.size.toString());
//       setState(() {
//         others = value.size.toInt();
//       });
//     });
//     // MrandMrs.sharedprefs.setDouble(
//     //     "finaltotal+$widget.queryDocumentSnapshot['id']",
//     //     MrandMrs.sharedprefs
//     //             .getDouble("total+$widget.queryDocumentSnapshot['id']") +
//     //         MrandMrs.sharedprefs
//     //             .getInt("subtotal+$widget.queryDocumentSnapshot['id']"));

//     String _imgurl = widget.queryDocumentSnapshot["mainimage"];
//     super.initState();
//     setState(() {
//       imgurl = _imgurl;
//     });
//   }

//   TextEditingController namecontroller = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ResponsiveWidget(
//       mobile: SingleChildScrollView(
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: Column(children: [
//                 //  TopNotifyBlackBox(),
//                 // MobileTitleWebBox(),
//                 DetailTitleWebBox(),
//                Box(height: 20, width: 0),
                
              
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                   //  height: 425,
//                    child: Column(
//                      children: [
//                       SizedBox(width: 20,),
                     
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           image: DecorationImage(
//                               image: NetworkImage(imgurl.toString()),
//                               fit: BoxFit.cover),
//                           color: Colors.white,
//                         ),
//                         height: 400,
//                         width: 400,
//                       ),
//                       SizedBox(
//                         width: 80,
//                       ),
//                        Container(
//                         width:MediaQuery.of(context).size.width,
//                         height:80,
//                         child: StreamBuilder<QuerySnapshot>(
//                             stream: FirebaseFirestore.instance
//                                 .collection("SearchProducts")
//                                 .doc(widget.queryDocumentSnapshot["id"]
//                                     .toString())
//                                 .collection("Images")
//                                 .snapshots(),
//                             builder: (context, snapshot) {
//                               if (!snapshot.hasData) {
//                                 return Center(child: CircularProgressIndicator());
//                               } else {
//                                 return Scrollbar(
                                  
//                                   child: ListView.builder(
//                                       controller: _imagecontroller,
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: snapshot.data!.docs.length,
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: GestureDetector(
//                                             onDoubleTap: () {
//                                                launch(snapshot.data!.docs[index]
//                                                   ['imgurl']);
//                                             },
                                            
//                                             onTap: () {
//                                               setState(() {
//                                                 imgurl = snapshot.data!
//                                                     .docs[index]['imgurl'];
//                                                 print(imgurl);
//                                               });
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                   width: 60,
//                                                   height: 60,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               2),
//                                                       color: imgurl ==   snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   ['imgurl'] ? Colors.white : Colors.grey[200],
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   ['imgurl']),
//                                                           fit: BoxFit.cover)),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       }),
//                                 );
//                               }
//                             }),
                   
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: Colors.white70,
//                         ),
//                       ),
//                                           ],
//                   ),
//                 ),
//                 Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Container(
//                               height: 390,
//                               width: 500,
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [

//                                     Row(

//                                       children: [
//                                          Text("SHOP  |  " +
//                                           widget.queryDocumentSnapshot['category']  + " | ".toString()
//                                               .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black45,
//                                                 fontSize: 15,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                         Text(
//                                           widget.queryDocumentSnapshot['name']
//                                               .toString()
//                                               .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black,
//                                                 fontSize: 15,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                       ],
//                                     ),

//                                     Box(height: 15, width: 0),
//                                    widget.queryDocumentSnapshot['permium'] ? 
//                                     Container(
//                                       height:25,
//                                       width : 80,
//                                       color:Colors.grey[200],
//                                       child:Center(
//                                         child: Text(
//                                            "PERMIUM",
//                                             style: GoogleFonts.nunitoSans(
//                                               textStyle: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 10,
//                                                   letterSpacing: 1.5),
//                                             ),
//                                           ),
//                                       ),

//                                     ) : SizedBox(),
//                                      Box(height: 10, width: 0),
//                                     Text(
                                    
//                                           widget.queryDocumentSnapshot['name']
//                                               .toString().toLowerCase()
//                                           ,
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 22,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),
//                                      Box(height: 10, width: 0),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "₹" +
//                                               widget.queryDocumentSnapshot['oprice']
//                                                   .toString()
//                                                   .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color.fromARGB(255, 68, 45, 40),
//                                                 fontSize: 20,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                         SizedBox(width: 10,),
//                                           Text(
//                                       "₹" +
//                                           widget.queryDocumentSnapshot['price']
//                                               .toString()
//                                               .toUpperCase(),
                                              
//                                       style: GoogleFonts.nunitoSans(
                                        
//                                         textStyle: const TextStyle(
//                                           decoration : TextDecoration.lineThrough,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color.fromARGB(255, 95, 79, 75),
//                                             fontSize: 15,
//                                             letterSpacing: 1.5),
//                                       ),
//                                     ),
//                                       ],
//                                     ),

//                                     // Box(height: 15, width: 0),
//                                     // Container(
//                                     //   height: 0.5,
//                                     //   color: Colors.black,
//                                     //   width: 300,
//                                     // ),
//                                     // //tod
//                                     Box(height: 8, width: 0),
//                                     Text(
//                                       widget
//                                           .queryDocumentSnapshot['Description']
//                                           .toString(),
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black45,
//                                             fontSize: 13,
//                                             height: 1.5,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),
//                                     Box(height: 13, width: 0),
//                                     Text(
//                                       "Material    :    " +
//                                           reqwoodlist
//                                               .toString()
//                                               .toLowerCase()
//                                               .replaceAll(",", "  | ")
//                                               .replaceAll("[", "")
//                                               .replaceAll("]", ""),
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),

//                                     Box(height: 10, width: 0),

//                                     Container(
//                                       height: 60,
//                                       // width: 100,
//                                       child: StreamBuilder<QuerySnapshot>(
//                                           stream: FirebaseFirestore.instance
//                                               .collection("SearchProducts")
//                                               .doc(widget
//                                                   .queryDocumentSnapshot["id"]
//                                                   .toString())
//                                               .collection("WoodList")
//                                               .snapshots(),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.data == null) {
//                                               return Center(
//                                                 child: CircularProgressIndicator()
//                                               );
//                                             } else {
//                                               return Scrollbar(
//                                                 child: ListView.builder(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     itemCount: snapshot
//                                                         .data!.docs.length,
//                                                     itemBuilder:
//                                                         (BuildContext context,
//                                                             int index) {
//                                                       return Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(10.0),
//                                                         child: GestureDetector(
//                                                           onTap: () {
//                                                             // setState(() {
//                                                             //   woodtype = snapshot
//                                                             //       .data.docs[index]['name'];
//                                                             // });
//                                                             print(woodtype);
//                                                           },
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 color: Colors
//                                                                     .transparent,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0)),
//                                                             height: 50,
//                                                             width: 50,
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Container(
//                                                                   decoration: BoxDecoration(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       image: DecorationImage(
//                                                                           image: NetworkImage(snapshot.data!.docs[index]
//                                                                               [
//                                                                               'image']),
//                                                                           fit: BoxFit
//                                                                               .cover),
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               0)),
//                                                                   height: 40,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       );
//                                                     }),
//                                               );
//                                             }
//                                           }),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(0)),
//                                     ),
//                                     Container(
//                   child: Center(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "QUANTITY : ",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 15,
//                               letterSpacing: 0),
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               quanityvalue++;
//                             });
//                           },
//                           icon: Icon(Icons.add_circle_outline)),
//                       Container(
//                           child: Center(
//                             child: Text(
//                               quanityvalue.toString(),
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.w900,
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     letterSpacing: 1),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(2)),
//                           height: 30,
//                           width: 30),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (quanityvalue >= 2) {
//                                 quanityvalue--;
//                               }
//                             });
//                           },
//                           icon: Icon(Icons.remove_circle_outline)),
                      
                      
//                     ],
//                   )),
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//                 SizedBox(height: 10,),
//                 GestureDetector(
//                         onTap: () {

//                          MRANDMRS.sharedprefs!.getString('uid') == null ? Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())):


//                           FirebaseFirestore.instance
//                               .collection("users")
//                               .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                               .collection("cart")
//                               .doc(widget.queryDocumentSnapshot["id"])
//                               .set({
//                             "Description":
//                                 widget.queryDocumentSnapshot["Description"],
//                             // "price": widget.queryDocumentSnapshot["price"],
//                             "oprice": widget.queryDocumentSnapshot["oprice"],
//                             "category":
//                                 widget.queryDocumentSnapshot["category"],
//                             "name": widget.queryDocumentSnapshot["name"],
//                             "permium" : widget.queryDocumentSnapshot['permium'],
//                             "id": widget.queryDocumentSnapshot["id"],
//                             "mainimage":
//                                 widget.queryDocumentSnapshot["mainimage"],
//                             "quanity": quanityvalue,
//                             "wood": woodtype,
//                              "permium" : widget.queryDocumentSnapshot['permium'],
//                             'length': widget.queryDocumentSnapshot['lenght'],
//                             'lenght': widget.queryDocumentSnapshot['lenght'],

//                             "width": widget.queryDocumentSnapshot['width'],
//                             "weight": widget.queryDocumentSnapshot['weight'],
//                             'height': widget.queryDocumentSnapshot['height']
//                           });
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 200,
//                           child: Center(
//                             child: Text(
//                               "ADD TO CART",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     fontSize: 13,
//                                     letterSpacing: 4),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                               border: Border.all(color: Colors.black)),
//                         ),
//                       ),
//                                   ])))
// ,
               
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  
//                   Padding(
//                       padding: const EdgeInsets.only(
//                         top: 0,
//                       ),
//                       child: Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 0,
//                             ),
//                             Text(
//                               "PRODUCT DETAILS",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     letterSpacing: 0),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Table(
//                                 textDirection: TextDirection.ltr,
//                                 defaultVerticalAlignment:
//                                     TableCellVerticalAlignment.middle,
//                                 border: TableBorder.all(
//                                     width: 0.5, color: lettercolor),
//                                 children: [
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(
//                                                 "BRAND",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(
//                                                 "MR AND MRS",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 onTap: () {},
//                                                 child: Text(
//                                                   "DIMENSIONS",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {
                                                
//                                               },
//                                               child: Text(
//                                                 " H " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'height'],
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
                                               
                                                  
//                                               },
//                                               child: Text(
//                                                 " * W " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'width'],
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
                                               
//                                               },
//                                               child: Text(
//                                                 " * L " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'lenght'] +
//                                                     " (In Inches)",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ]),
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 child: Text(
//                                                   "WEIGHT",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 onTap: () {
                                                  
//                                                 },
//                                                 child: Text(
//                                                   widget.queryDocumentSnapshot[
//                                                           'weight'] +
//                                                       " kg",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                             ),

                           
                           
//                           ],
//                         ),

//                            )),
                 
//                  MobileEndBox()
//               ])])),
//     ),
//       tab:  SingleChildScrollView(
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
               
//                 //  TopNotifyBlackBox(),
//                 // MobileTitleWebBox(),
//                 DetailTitleWebBox(),
//                Box(height: 20, width: 0),
                
              
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                   //  height: 425,
//                    child: Column(
//                      children: [
//                       SizedBox(width: 20,),
                     
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           image: DecorationImage(
//                               image: NetworkImage(imgurl.toString()),
//                               fit: BoxFit.cover),
//                           color: Colors.white,
//                         ),
//                         height: 400,
//                         width: 400,
//                       ),
//                       SizedBox(
//                         width: 80,
//                       ),
//                        Container(
//                         width:MediaQuery.of(context).size.width,
//                         height:80,
//                         child: StreamBuilder<QuerySnapshot>(
//                             stream: FirebaseFirestore.instance
//                                 .collection("SearchProducts")
//                                 .doc(widget.queryDocumentSnapshot["id"]
//                                     .toString())
//                                 .collection("Images")
//                                 .snapshots(),
//                             builder: (context, snapshot) {
//                               if (!snapshot.hasData) {
//                                 return Center(child: CircularProgressIndicator());
//                               } else {
//                                 return Scrollbar(
                                  
//                                   child: ListView.builder(
//                                       controller: _imagecontroller,
//                                       scrollDirection: Axis.horizontal,
//                                       itemCount: snapshot.data!.docs.length,
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: GestureDetector(
//                                             onDoubleTap: () {
//                                                launch(snapshot.data!.docs[index]
//                                                   ['imgurl']);
//                                             },
                                            
//                                             onTap: () {
//                                               setState(() {
//                                                 imgurl = snapshot.data!
//                                                     .docs[index]['imgurl'];
//                                                 print(imgurl);
//                                               });
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                   width: 60,
//                                                   height: 60,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               2),
//                                                       color: imgurl ==   snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   ['imgurl'] ? Colors.white : Colors.grey[200],
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   ['imgurl']),
//                                                           fit: BoxFit.cover)),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       }),
//                                 );
//                               }
//                             }),
                   
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: Colors.white70,
//                         ),
//                       ),
//                                           ],
//                   ),
//                 ),
//                 Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Container(
//                               height: 390,
//                               width: 500,
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [

//                                     Row(

//                                       children: [
//                                          Text("SHOP  |  " +
//                                           widget.queryDocumentSnapshot['category']  + " | ".toString()
//                                               .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black45,
//                                                 fontSize: 15,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                         Text(
//                                           widget.queryDocumentSnapshot['name']
//                                               .toString()
//                                               .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black,
//                                                 fontSize: 15,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                       ],
//                                     ),

//                                     Box(height: 15, width: 0),
//                                    widget.queryDocumentSnapshot['permium'] ? 
//                                     Container(
//                                       height:25,
//                                       width : 80,
//                                       color:Colors.grey[200],
//                                       child:Center(
//                                         child: Text(
//                                            "PERMIUM",
//                                             style: GoogleFonts.nunitoSans(
//                                               textStyle: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 10,
//                                                   letterSpacing: 1.5),
//                                             ),
//                                           ),
//                                       ),

//                                     ) : SizedBox(),
//                                      Box(height: 10, width: 0),
//                                     Text(
                                    
//                                           widget.queryDocumentSnapshot['name']
//                                               .toString().toLowerCase()
//                                           ,
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 22,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),
//                                      Box(height: 10, width: 0),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "₹" +
//                                               widget.queryDocumentSnapshot['oprice']
//                                                   .toString()
//                                                   .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color.fromARGB(255, 68, 45, 40),
//                                                 fontSize: 20,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                         SizedBox(width: 10,),
//                                           Text(
//                                       "₹" +
//                                           widget.queryDocumentSnapshot['price']
//                                               .toString()
//                                               .toUpperCase(),
                                              
//                                       style: GoogleFonts.nunitoSans(
                                        
//                                         textStyle: const TextStyle(
//                                           decoration : TextDecoration.lineThrough,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color.fromARGB(255, 95, 79, 75),
//                                             fontSize: 15,
//                                             letterSpacing: 1.5),
//                                       ),
//                                     ),
//                                       ],
//                                     ),

//                                     // Box(height: 15, width: 0),
//                                     // Container(
//                                     //   height: 0.5,
//                                     //   color: Colors.black,
//                                     //   width: 300,
//                                     // ),
//                                     // //tod
//                                     Box(height: 8, width: 0),
//                                     Text(
//                                       widget
//                                           .queryDocumentSnapshot['Description']
//                                           .toString(),
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black45,
//                                             fontSize: 13,
//                                             height: 1.5,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),
//                                     Box(height: 13, width: 0),
//                                     Text(
//                                       "Material    :    " +
//                                           reqwoodlist
//                                               .toString()
//                                               .toLowerCase()
//                                               .replaceAll(",", "  | ")
//                                               .replaceAll("[", "")
//                                               .replaceAll("]", ""),
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),

//                                     Box(height: 10, width: 0),

//                                     Container(
//                                       height: 60,
//                                       // width: 100,
//                                       child: StreamBuilder<QuerySnapshot>(
//                                           stream: FirebaseFirestore.instance
//                                               .collection("SearchProducts")
//                                               .doc(widget
//                                                   .queryDocumentSnapshot["id"]
//                                                   .toString())
//                                               .collection("WoodList")
//                                               .snapshots(),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.data == null) {
//                                               return Center(
//                                                 child: CircularProgressIndicator()
//                                               );
//                                             } else {
//                                               return Scrollbar(
//                                                 child: ListView.builder(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     itemCount: snapshot
//                                                         .data!.docs.length,
//                                                     itemBuilder:
//                                                         (BuildContext context,
//                                                             int index) {
//                                                       return Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(10.0),
//                                                         child: GestureDetector(
//                                                           onTap: () {
//                                                             // setState(() {
//                                                             //   woodtype = snapshot
//                                                             //       .data.docs[index]['name'];
//                                                             // });
//                                                             print(woodtype);
//                                                           },
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 color: Colors
//                                                                     .transparent,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0)),
//                                                             height: 50,
//                                                             width: 50,
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Container(
//                                                                   decoration: BoxDecoration(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       image: DecorationImage(
//                                                                           image: NetworkImage(snapshot.data!.docs[index]
//                                                                               [
//                                                                               'image']),
//                                                                           fit: BoxFit
//                                                                               .cover),
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               0)),
//                                                                   height: 40,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       );
//                                                     }),
//                                               );
//                                             }
//                                           }),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(0)),
//                                     ),
//                                     Container(
//                   child: Center(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "QUANTITY : ",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 15,
//                               letterSpacing: 0),
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               quanityvalue++;
//                             });
//                           },
//                           icon: Icon(Icons.add_circle_outline)),
//                       Container(
//                           child: Center(
//                             child: Text(
//                               quanityvalue.toString(),
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.w900,
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     letterSpacing: 1),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(2)),
//                           height: 30,
//                           width: 30),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (quanityvalue >= 2) {
//                                 quanityvalue--;
//                               }
//                             });
//                           },
//                           icon: Icon(Icons.remove_circle_outline)),
                      
                      
//                     ],
//                   )),
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//                 SizedBox(height: 10,),
//                 GestureDetector(
//                         onTap: () {

//                          MRANDMRS.sharedprefs!.getString('uid') == null ? Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())):


//                           FirebaseFirestore.instance
//                               .collection("users")
//                               .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                               .collection("cart")
//                               .doc(widget.queryDocumentSnapshot["id"])
//                               .set({
//                             "Description":
//                                 widget.queryDocumentSnapshot["Description"],
//                             // "price": widget.queryDocumentSnapshot["price"],
//                             "oprice": widget.queryDocumentSnapshot["oprice"],
//                             "category":
//                                 widget.queryDocumentSnapshot["category"],
//                             "name": widget.queryDocumentSnapshot["name"],
//                             "permium" : widget.queryDocumentSnapshot['permium'],
//                             "id": widget.queryDocumentSnapshot["id"],
//                             "mainimage":
//                                 widget.queryDocumentSnapshot["mainimage"],
//                             "quanity": quanityvalue,
//                             "wood": woodtype,
//                              "permium" : widget.queryDocumentSnapshot['permium'],
//                             'length': widget.queryDocumentSnapshot['lenght'],
//                             'lenght': widget.queryDocumentSnapshot['lenght'],

//                             "width": widget.queryDocumentSnapshot['width'],
//                             "weight": widget.queryDocumentSnapshot['weight'],
//                             'height': widget.queryDocumentSnapshot['height']
//                           });
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 200,
//                           child: Center(
//                             child: Text(
//                               "ADD TO CART",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     fontSize: 13,
//                                     letterSpacing: 4),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                               border: Border.all(color: Colors.black)),
//                         ),
//                       ),
//                                   ])))
// ,
               
//                 Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  
//                   Padding(
//                       padding: const EdgeInsets.only(
//                         top: 0,
//                       ),
//                       child: Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 0,
//                             ),
//                             Text(
//                               "PRODUCT DETAILS",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     letterSpacing: 0),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Table(
//                                 textDirection: TextDirection.ltr,
//                                 defaultVerticalAlignment:
//                                     TableCellVerticalAlignment.middle,
//                                 border: TableBorder.all(
//                                     width: 0.5, color: lettercolor),
//                                 children: [
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(
//                                                 "BRAND",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(
//                                                 "MR AND MRS",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 onTap: () {},
//                                                 child: Text(
//                                                   "DIMENSIONS",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {
                                                
//                                               },
//                                               child: Text(
//                                                 " H " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'height'],
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
                                               
                                                  
//                                               },
//                                               child: Text(
//                                                 " * W " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'width'],
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
                                               
//                                               },
//                                               child: Text(
//                                                 " * L " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'lenght'] +
//                                                     " (In Inches)",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ]),
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 child: Text(
//                                                   "WEIGHT",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 onTap: () {
                                                  
//                                                 },
//                                                 child: Text(
//                                                   widget.queryDocumentSnapshot[
//                                                           'weight'] +
//                                                       " kg",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                             ),

                           
                           
//                           ],
//                         ),

//                            )),
                 
//                  MobileEndBox()
//               ])])),
//     ),
//       desktop: SingleChildScrollView(
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: Column(children: [
//                 //  TopNotifyBlackBox(),
//                 DetailTitleWebBox(),
//                Box(height: 20, width: 0),
                
              
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                   //  height: 425,
//                    child: Row(
//                      children: [
//                       SizedBox(width: 20,),
//                       Container(
//                         width: 80,
//                         child: StreamBuilder<QuerySnapshot>(
//                             stream: FirebaseFirestore.instance
//                                 .collection("SearchProducts")
//                                 .doc(widget.queryDocumentSnapshot["id"]
//                                     .toString())
//                                 .collection("Images")
//                                 .snapshots(),
//                             builder: (context, snapshot) {
//                               if (!snapshot.hasData) {
//                                 return Center(child: CircularProgressIndicator());
//                               } else {
//                                 return Scrollbar(
                                  
//                                   child: ListView.builder(
//                                       controller: _imagecontroller,
//                                       scrollDirection: Axis.vertical,
//                                       itemCount: snapshot.data!.docs.length,
//                                       itemBuilder:
//                                           (BuildContext context, int index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(10.0),
//                                           child: GestureDetector(
//                                             onDoubleTap: () {
//                                                launch(snapshot.data!.docs[index]
//                                                   ['imgurl']);
//                                             },
                                            
//                                             onTap: () {
//                                               setState(() {
//                                                 imgurl = snapshot.data!
//                                                     .docs[index]['imgurl'];
//                                                 print(imgurl);
//                                               });
//                                             },
//                                             child: Column(
//                                               children: [
//                                                 Container(
//                                                   width: 60,
//                                                   height: 60,
//                                                   decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               2),
//                                                       color: imgurl ==   snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   ['imgurl'] ? Colors.white : Colors.grey[200],
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               snapshot.data!
//                                                                           .docs[
//                                                                       index]
//                                                                   ['imgurl']),
//                                                           fit: BoxFit.cover)),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         );
//                                       }),
//                                 );
//                               }
//                             }),
//                         height: 500,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           color: Colors.white70,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(4),
//                           image: DecorationImage(
//                               image: NetworkImage(imgurl.toString()),
//                               fit: BoxFit.cover),
//                           color: Colors.white,
//                         ),
//                         height: 400,
//                         width: 400,
//                       ),
//                       SizedBox(
//                         width: 80,
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Container(
//                               height: 500,
//                               width: 500,
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [

//                                     Row(

//                                       children: [
//                                          Text("SHOP  |  " +
//                                           widget.queryDocumentSnapshot['category']  + " | ".toString()
//                                               .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black45,
//                                                 fontSize: 15,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                         Text(
//                                           widget.queryDocumentSnapshot['name']
//                                               .toString()
//                                               .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black,
//                                                 fontSize: 15,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                       ],
//                                     ),

//                                     Box(height: 15, width: 0),
//                                    widget.queryDocumentSnapshot['permium'] ? 
//                                     Container(
//                                       height:25,
//                                       width : 80,
//                                       color:Colors.grey[200],
//                                       child:Center(
//                                         child: Text(
//                                            "PERMIUM",
//                                             style: GoogleFonts.nunitoSans(
//                                               textStyle: const TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black,
//                                                   fontSize: 10,
//                                                   letterSpacing: 1.5),
//                                             ),
//                                           ),
//                                       ),

//                                     ) : SizedBox(),
//                                      Box(height: 10, width: 0),
//                                     Text(
                                    
//                                           widget.queryDocumentSnapshot['name']
//                                               .toString().toLowerCase()
//                                           ,
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 22,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),
//                                      Box(height: 10, width: 0),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           "₹" +
//                                               widget.queryDocumentSnapshot['oprice']
//                                                   .toString()
//                                                   .toUpperCase(),
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Color.fromARGB(255, 68, 45, 40),
//                                                 fontSize: 20,
//                                                 letterSpacing: 1.5),
//                                           ),
//                                         ),
//                                         SizedBox(width: 10,),
//                                           Text(
//                                       "₹" +
//                                           widget.queryDocumentSnapshot['price']
//                                               .toString()
//                                               .toUpperCase(),
                                              
//                                       style: GoogleFonts.nunitoSans(
                                        
//                                         textStyle: const TextStyle(
//                                           decoration : TextDecoration.lineThrough,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color.fromARGB(255, 95, 79, 75),
//                                             fontSize: 15,
//                                             letterSpacing: 1.5),
//                                       ),
//                                     ),
//                                       ],
//                                     ),

//                                     // Box(height: 15, width: 0),
//                                     // Container(
//                                     //   height: 0.5,
//                                     //   color: Colors.black,
//                                     //   width: 300,
//                                     // ),
//                                     // //tod
//                                     Box(height: 8, width: 0),
//                                     Text(
//                                       widget
//                                           .queryDocumentSnapshot['Description']
//                                           .toString(),
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black45,
//                                             fontSize: 13,
//                                             height: 1.5,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),
//                                     Box(height: 13, width: 0),
//                                     Text(
//                                       "Material    :    " +
//                                           reqwoodlist
//                                               .toString()
//                                               .toLowerCase()
//                                               .replaceAll(",", "  | ")
//                                               .replaceAll("[", "")
//                                               .replaceAll("]", ""),
//                                       style: GoogleFonts.nunitoSans(
//                                         textStyle: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                             letterSpacing: 0),
//                                       ),
//                                     ),

//                                     Box(height: 10, width: 0),

//                                     Container(
//                                       height: 60,
//                                       // width: 100,
//                                       child: StreamBuilder<QuerySnapshot>(
//                                           stream: FirebaseFirestore.instance
//                                               .collection("SearchProducts")
//                                               .doc(widget
//                                                   .queryDocumentSnapshot["id"]
//                                                   .toString())
//                                               .collection("WoodList")
//                                               .snapshots(),
//                                           builder: (context, snapshot) {
//                                             if (snapshot.data == null) {
//                                               return Center(
//                                                 child: CircularProgressIndicator()
//                                               );
//                                             } else {
//                                               return Scrollbar(
//                                                 child: ListView.builder(
//                                                     scrollDirection:
//                                                         Axis.horizontal,
//                                                     itemCount: snapshot
//                                                         .data!.docs.length,
//                                                     itemBuilder:
//                                                         (BuildContext context,
//                                                             int index) {
//                                                       return Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(10.0),
//                                                         child: GestureDetector(
//                                                           onTap: () {
//                                                             // setState(() {
//                                                             //   woodtype = snapshot
//                                                             //       .data.docs[index]['name'];
//                                                             // });
//                                                             print(woodtype);
//                                                           },
//                                                           child: Container(
//                                                             decoration: BoxDecoration(
//                                                                 color: Colors
//                                                                     .transparent,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             0)),
//                                                             height: 50,
//                                                             width: 50,
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Container(
//                                                                   decoration: BoxDecoration(
//                                                                       color: Colors
//                                                                           .black,
//                                                                       image: DecorationImage(
//                                                                           image: NetworkImage(snapshot.data!.docs[index]
//                                                                               [
//                                                                               'image']),
//                                                                           fit: BoxFit
//                                                                               .cover),
//                                                                       borderRadius:
//                                                                           BorderRadius.circular(
//                                                                               0)),
//                                                                   height: 40,
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       );
//                                                     }),
//                                               );
//                                             }
//                                           }),
//                                       decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius:
//                                               BorderRadius.circular(0)),
//                                     ),
//                                     Container(
//                   child: Center(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "QUANTITY : ",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 15,
//                               letterSpacing: 0),
//                         ),
//                       ),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               quanityvalue++;
//                             });
//                           },
//                           icon: Icon(Icons.add_circle_outline)),
//                       Container(
//                           child: Center(
//                             child: Text(
//                               quanityvalue.toString(),
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.w900,
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     letterSpacing: 1),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(2)),
//                           height: 30,
//                           width: 30),
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               if (quanityvalue >= 2) {
//                                 quanityvalue--;
//                               }
//                             });
//                           },
//                           icon: Icon(Icons.remove_circle_outline)),
                      
                      
//                     ],
//                   )),
//                   height: 50,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(5)),
//                 ),
//                 SizedBox(height: 10,),
//                 GestureDetector(
//                         onTap: () {

//                          MRANDMRS.sharedprefs!.getString('uid') == null ? Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())):


//                           FirebaseFirestore.instance
//                               .collection("users")
//                               .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                               .collection("cart")
//                               .doc(widget.queryDocumentSnapshot["id"])
//                               .set({
//                             "Description":
//                                 widget.queryDocumentSnapshot["Description"],
//                             // "price": widget.queryDocumentSnapshot["price"],
//                             "oprice": widget.queryDocumentSnapshot["oprice"],
//                             "category":
//                                 widget.queryDocumentSnapshot["category"],
//                             "name": widget.queryDocumentSnapshot["name"],
//                             "permium" : widget.queryDocumentSnapshot['permium'],
//                             "id": widget.queryDocumentSnapshot["id"],
//                             "mainimage":
//                                 widget.queryDocumentSnapshot["mainimage"],
//                             "quanity": quanityvalue,
//                             "wood": woodtype,
//                              "permium" : widget.queryDocumentSnapshot['permium'],
//                             'length': widget.queryDocumentSnapshot['lenght'],
//                             'lenght': widget.queryDocumentSnapshot['lenght'],

//                             "width": widget.queryDocumentSnapshot['width'],
//                             "weight": widget.queryDocumentSnapshot['weight'],
//                             'height': widget.queryDocumentSnapshot['height']
//                           });
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 200,
//                           child: Center(
//                             child: Text(
//                               "ADD TO CART",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                     fontSize: 13,
//                                     letterSpacing: 4),
//                               ),
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.black,
//                               border: Border.all(color: Colors.black)),
//                         ),
//                       ),
//                                   ])))
//                     ],
//                   ),
//                 ),
               
//                 Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  
//                   Padding(
//                       padding: const EdgeInsets.only(
//                         top: 0,
//                       ),
//                       child: Container(
//                         height: 300,
//                         width: MediaQuery.of(context).size.width,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: 0,
//                             ),
//                             Text(
//                               "PRODUCT DETAILS",
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                     fontSize: 16,
//                                     letterSpacing: 0),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Padding(
//                               padding: const EdgeInsets.all(40.0),
//                               child: Table(
//                                 textDirection: TextDirection.ltr,
//                                 defaultVerticalAlignment:
//                                     TableCellVerticalAlignment.middle,
//                                 border: TableBorder.all(
//                                     width: 0.5, color: lettercolor),
//                                 children: [
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(
//                                                 "BRAND",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(
//                                                 "MR AND MRS",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 onTap: () {},
//                                                 child: Text(
//                                                   "DIMENSIONS",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Row(
//                                           children: [
//                                             GestureDetector(
//                                               onTap: () {
                                                
//                                               },
//                                               child: Text(
//                                                 " H " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'height'],
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
                                               
                                                  
//                                               },
//                                               child: Text(
//                                                 " * W " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'width'],
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
                                               
//                                               },
//                                               child: Text(
//                                                 " * L " +
//                                                     widget.queryDocumentSnapshot[
//                                                         'lenght'] +
//                                                     " (In Inches)",
//                                                 style: GoogleFonts.nunitoSans(
//                                                   textStyle: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: lettercolor,
//                                                       fontSize: 12,
//                                                       letterSpacing: 1),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ]),
//                                   TableRow(children: [
//                                     Container(
//                                       height: 40,
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 child: Text(
//                                                   "WEIGHT",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       child: Row(
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: GestureDetector(
//                                                 onTap: () {
                                                  
//                                                 },
//                                                 child: Text(
//                                                   widget.queryDocumentSnapshot[
//                                                           'weight'] +
//                                                       " kg",
//                                                   style:
//                                                       GoogleFonts.nunitoSans(
//                                                     textStyle: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: lettercolor,
//                                                         fontSize: 12,
//                                                         letterSpacing: 1),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                             ),

                           
                           
//                           ],
//                         ),

//                            )),
                 
//                  EndBox()
//               ])])),
//     )));
//   }
// }
