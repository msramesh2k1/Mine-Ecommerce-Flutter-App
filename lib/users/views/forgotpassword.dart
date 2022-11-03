// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:motion_toast/motion_toast.dart';
// import 'package:motion_toast/resources/arrays.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/ErrorAlert.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/Helper.dart';
// import 'package:mrandmrs_ecom_webapp/HomeScreenWidgets/HomeWidgets.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/accountscree.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/loginpage.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/registerpage.dart';
// import 'package:mrandmrs_ecom_webapp/Widgets/Custom_Widgets.dart';
// import '../../../constants.dart';


// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({Key? key}) : super(key: key);

//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   bool _password = true;
//   final TextEditingController emailcontroller = new TextEditingController();
//   final TextEditingController resetemailtexteditingcontroller =
//       new TextEditingController();
//   final TextEditingController passwordcontroller = new TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _password = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Container(
//           child: Column(
//             children: [
//               TopNotifyBlackBox(),
//               TitleWebBox(),
//               Box(height: 40, width: 0),
//               Text(
//                 "FORGOT PASSWORD",
//                 style: GoogleFonts.nunitoSans(
//                   textStyle: const TextStyle(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black,
//                       fontSize: 14,
//                       letterSpacing: 2),
//                 ),
//               ),
//               Box(height: 30, width: 0),
//               Text(
//                 "Please Enter Your e-mail",
//                 style: GoogleFonts.nunitoSans(
//                   textStyle: const TextStyle(
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black,
//                       fontSize: 14,
//                       letterSpacing: 0.5),
//                 ),
//               ),
//               Box(height: 30, width: 0),
//               Container(
//                 height: 45,
//                 width: 400,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   child: TextField(
//                     style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                     cursorColor: kBackgroundColor,
//                     controller: emailcontroller,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       labelText: 'Email',
//                       labelStyle: TextStyle(
//                           fontFamily: 'lato',
//                           fontSize: 14,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.black54),
//                     ),
//                   ),
//                 ),
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.black)),
//               ),
//               Box(height: 15, width: 0),
//               GestureDetector(
//                 onTap: () {
//                   emailcontroller.text.isNotEmpty
//                       ? _recoverform()
//                       : showDialog(
//                           context: context,
//                           builder: (c) {
//                             return ErrorAlertDialog(
//                                 message: "Provide Email and Password");
//                           });
//                 },
//                 child: Container(
//                   height: 45,
//                   width: 400,
//                   child: Center(
//                     child: Text(
//                       "RECOVER",
//                       style: GoogleFonts.nunitoSans(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.normal,
//                             color: Colors.white,
//                             fontSize: 14,
//                             letterSpacing: 2),
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       color: Color.fromRGBO(204, 191, 171, 1),
//                       border:
//                           Border.all(color: Color.fromRGBO(204, 191, 171, 1))),
//                 ),
//               ),
//               Box(height: 10, width: 0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Back to",
//                     style: GoogleFonts.nunitoSans(
//                       textStyle: const TextStyle(
//                           fontWeight: FontWeight.normal,
//                           color: Colors.black45,
//                           fontSize: 14,
//                           letterSpacing: 0),
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Route route = MaterialPageRoute(
//                           builder: (context) => LoginScreen());
//                       Navigator.pushReplacement(context, route);
//                     },
//                     child: Text(
//                       " LogIn",
//                       style: GoogleFonts.nunitoSans(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black,
//                             fontSize: 14,
//                             letterSpacing: 0),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Box(height: 40, width: 0),
//               EndBox()
//             ],
//           ),
//           color: Colors.white),
//     ));
//   }

//   Future<void> _recoverform() async {
//     final _auth = FirebaseAuth.instance;
//     final user = await _auth
//         .sendPasswordResetEmail(email: emailcontroller.text.toString())
//         .then((authUser) {
//       var snackBar = SnackBar(
//           backgroundColor: Colors.green[100],
//           content: Container(
//             height: 20,
//             child: Center(
//                 child: Text(
//               'An email has just been sent to you, Click the link provided to complete password reset',
//               style: TextStyle(color: Colors.black, letterSpacing: 0),
//             )),
//           ));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }).catchError((error) {
//       Navigator.pop(context);
//       showDialog(
//           context: context,
//           builder: (c) {
//             return ErrorAlertDialog(
//               message: error.message.toString(),
//             );
//           });
//     });
//   }
// }
