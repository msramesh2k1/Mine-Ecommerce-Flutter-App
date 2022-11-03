// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mine/HomeScreenWidgets/HomeWidgets.dart';
// import 'package:mine/admin/adminorders.dart';
// import 'package:mine/constants.dart';
// import 'package:mine/users/views/loginpage.dart';
// import 'package:mine/admin/uploader.dart';
// import 'package:url_launcher/url_launcher.dart';


// import '../Widgets/Custom_Widgets.dart';
// import '../users/views/Helper.dart';
// import '../users/views/accountscree.dart';
// import 'add_category.dart';
// import 'addwood.dart';

// class Admin extends StatefulWidget {
//   @override
//   _AdminState createState() => _AdminState();
// }

// class _AdminState extends State<Admin> {
//   String? selected = "Add Category";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: NetworkImage("https://static.vecteezy.com/system/resources/previews/004/493/292/original/light-brown-gradient-background-free-photo.jpg"),fit: BoxFit.cover)
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
              
              
//               Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Box(height: 0, width: 40),
//                 Spacer(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Mr & Mrs",
//                       style: GoogleFonts.novaSlim(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: kBackgroundColor,
//                             fontSize: 25,
//                             letterSpacing: 0),
//                       ),
//                     ),
//                     Text(
//                       "Design Wood Works",
//                       style: GoogleFonts.openSans(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black,
//                             fontSize: 11,
//                             letterSpacing: 1),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Spacer(),
               
//               ],
//             ),
//           ),
              
              
//               // TitleAdminWebBox(),
//               SizedBox(height: 30),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => addcategory()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20.0, right: 20),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   selected = "Add Category";
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   //shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 height: 40,
//                                 width: 200,
//                                 //  width:20,

//                                 child: Center(
//                                   child: Text(
//                                     "Add Category",
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.nunitoSans(
//                                       textStyle: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           letterSpacing: 0.5),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             selected == "Add Category"
//                                 ? Container(
//                                     height: 3,
//                                     decoration: BoxDecoration(
//                                         color: Colors.black54,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     width: 100,
//                                   )
//                                 : SizedBox()
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => addwood()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20.0, right: 20),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 print(selected);
//                                 setState(() {
//                                   selected = "Add Wood";
//                                 });
//                                 print(selected);
//                                 setState(() {});
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   //shape: BoxShape.circle,
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.white
//                                 ),
//                                 height: 40,
//                                 width: 200,
//                                 //  width:20,

//                                 child: Center(
//                                   child: Text(
//                                     "Add Wood",
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.nunitoSans(
//                                       textStyle: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           letterSpacing: 0.5),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             selected == "Add Wood"
//                                 ? Container(
//                                     height: 3,
//                                     decoration: BoxDecoration(
//                                         color: Colors.black54,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     width: 100,
//                                   )
//                                 : SizedBox()
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => AdminPanel()));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20.0, right: 20),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             //shape: BoxShape.circle,
//                             borderRadius: BorderRadius.circular(5),
//                         color: Colors.white
//                           ),
//                           height: 40,
//                           width: 200,
//                           //  width:20,

//                           child: Center(
//                             child: Text(
//                               "Add Items",
//                               textAlign: TextAlign.center,
//                               style: GoogleFonts.nunitoSans(
//                                 textStyle: TextStyle(
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.black,
//                                     fontSize: 14,
//                                     letterSpacing: 0.5),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
                       
                       
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20.0, right: 20),
//                         child: Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 print("cx");
//                                  Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => AdminOrders()));
                                

//                                 setState(() {
//                                   selected = "Orders";
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   //shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(5),
//                                 ),
//                                 height: 40,
//                                 width: 200,
//                                 //  width:20,

//                                 child: Center(
//                                   child: Text(
//                                     "Orders",
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.nunitoSans(
//                                       textStyle: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 14,
//                                           letterSpacing: 0.5),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             selected == "Orders"
//                                 ? Container(
//                                     height: 3,
//                                     decoration: BoxDecoration(
//                                         color: Colors.black54,
//                                         borderRadius:
//                                             BorderRadius.circular(20)),
//                                     width: 100,
//                                   )
//                                 : SizedBox()
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   height: 420,
//                   child: selected == "Add Category" ? addcategory() : addwood(),
//                   width: MediaQuery.of(context).size.width,
//                   // decoration:
//                   //     BoxDecoration(color: Color.fromRGBO(230, 224, 215, 1))
//                       )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
