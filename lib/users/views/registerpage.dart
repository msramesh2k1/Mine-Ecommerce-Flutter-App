// //completed

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/Helper.dart';
// import 'package:mrandmrs_ecom_webapp/HomeScreenWidgets/HomeWidgets.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/accountscree.dart';
// import 'package:mrandmrs_ecom_webapp/Widgets/Custom_Widgets.dart';
// import 'package:mrandmrs_ecom_webapp/helpers/mobilewidgets.dart';
// import 'package:mrandmrs_ecom_webapp/helpers/responsive_widget.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/HomePage.dart';
// import 'package:mrandmrs_ecom_webapp/users/views/loginpage.dart';

// import '../../constants.dart';
// import 'ErrorAlert.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   bool _password = true;
//   final TextEditingController emailcontroller = new TextEditingController();
//   final TextEditingController namecontroller = new TextEditingController();
//   final TextEditingController passwordcontroller = new TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     _password = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ResponsiveWidget(
//       mobile: SingleChildScrollView(
//         child: Container(
//             child: Column(
//               children: [
//                 TopMovileNotifyBlackBox(),
//                 MobileTitleWebBox(),
//                 Box(height: 40, width: 0),
//                 Text(
//                   "REGISTER",
//                   style: GoogleFonts.nunitoSans(
//                     textStyle: const TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 14,
//                         letterSpacing: 2),
//                   ),
//                 ),
//                 Box(height: 30, width: 0),
//                 Text(
//                   "Please fill in the information below:",
//                   style: GoogleFonts.nunitoSans(
//                     textStyle: const TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 14,
//                         letterSpacing: 0.5),
//                   ),
//                 ),
//                 Box(height: 30, width: 0),
//                 Container(
//                   height: 45,
//                   width: MediaQuery.of(context).size.width - 30,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextField(
//                       style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                       cursorColor: kBackgroundColor,
//                       controller: namecontroller,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         labelText: 'Name',
//                         labelStyle: TextStyle(
//                             fontFamily: 'lato',
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                 ),
//                 Box(height: 15, width: 0),
//                 Container(
//                   height: 45,
//                   width: MediaQuery.of(context).size.width - 30,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextField(
//                       style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                       cursorColor: kBackgroundColor,
//                       controller: emailcontroller,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         labelText: 'Email',
//                         labelStyle: TextStyle(
//                             fontFamily: 'lato',
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                 ),
//                 Box(height: 15, width: 0),
//                 Container(
//                   height: 45,
//                   width: MediaQuery.of(context).size.width - 30,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextField(
//                       style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                       cursorColor: kBackgroundColor,
//                       controller: passwordcontroller,
//                       obscureText: !_password,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                               _password
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: kBackgroundColor,
//                               size: 18),
//                           onPressed: () {
//                             setState(() {
//                               _password = !_password;
//                             });
//                           },
//                         ),
//                         labelText: 'Password',
//                         labelStyle: TextStyle(
//                             fontFamily: 'lato',
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                 ),
//                 Box(height: 10, width: 0),
//                 GestureDetector(
//                   onTap: () {
//                     emailcontroller.text.isNotEmpty &&
//                             passwordcontroller.text.isNotEmpty &&
//                             namecontroller.text.isNotEmpty
//                         ? _Registerform()
//                         : showDialog(
//                             context: context,
//                             builder: (c) {
//                               return ErrorAlertDialog(
//                                   message: "Fill Completely");
//                             });
//                   },
//                   child: Container(
//                     height: 45,
//                     width: MediaQuery.of(context).size.width - 30,
//                     child: Center(
//                       child: Text(
//                         "CREATE ACCOUNT",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.white,
//                               fontSize: 14,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(204, 191, 171, 1),
//                         border: Border.all(
//                             color: Color.fromRGBO(204, 191, 171, 1))),
//                   ),
//                 ),
//                 Box(height: 10, width: 0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Have an account ?",
//                       style: GoogleFonts.nunitoSans(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black45,
//                             fontSize: 14,
//                             letterSpacing: 0),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         " Login",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black,
//                               fontSize: 14,
//                               letterSpacing: 0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Box(height: 40, width: 0),
//                 MobileEndBox()
//               ],
//             ),
//             color: Colors.white),
//       ),
//       tab: Container(),
//       desktop: SingleChildScrollView(
//         child: Container(
//             child: Column(
//               children: [
//                 TopNotifyBlackBox(),
//                 TitleWebBox(),
//                 Box(height: 40, width: 0),
//                 Text(
//                   "REGISTER",
//                   style: GoogleFonts.nunitoSans(
//                     textStyle: const TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 14,
//                         letterSpacing: 2),
//                   ),
//                 ),
//                 Box(height: 30, width: 0),
//                 Text(
//                   "Please fill in the information below:",
//                   style: GoogleFonts.nunitoSans(
//                     textStyle: const TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 14,
//                         letterSpacing: 0.5),
//                   ),
//                 ),
//                 Box(height: 30, width: 0),
//                 Container(
//                   height: 45,
//                   width: 400,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextField(
//                       style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                       cursorColor: kBackgroundColor,
//                       controller: namecontroller,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         labelText: 'Name',
//                         labelStyle: TextStyle(
//                             fontFamily: 'lato',
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                 ),
//                 Box(height: 15, width: 0),
//                 Container(
//                   height: 45,
//                   width: 400,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextField(
//                       style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                       cursorColor: kBackgroundColor,
//                       controller: emailcontroller,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         labelText: 'Email',
//                         labelStyle: TextStyle(
//                             fontFamily: 'lato',
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                 ),
//                 Box(height: 15, width: 0),
//                 Container(
//                   height: 45,
//                   width: 400,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextField(
//                       style: TextStyle(color: kBackgroundColor, fontSize: 14),
//                       cursorColor: kBackgroundColor,
//                       controller: passwordcontroller,
//                       obscureText: !_password,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                               _password
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: kBackgroundColor,
//                               size: 18),
//                           onPressed: () {
//                             setState(() {
//                               _password = !_password;
//                             });
//                           },
//                         ),
//                         labelText: 'Password',
//                         labelStyle: TextStyle(
//                             fontFamily: 'lato',
//                             fontSize: 14,
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                 ),
//                 Box(height: 10, width: 0),
//                 GestureDetector(
//                   onTap: () {
//                     emailcontroller.text.isNotEmpty &&
//                             passwordcontroller.text.isNotEmpty &&
//                             namecontroller.text.isNotEmpty
//                         ? _Registerform()
//                         : showDialog(
//                             context: context,
//                             builder: (c) {
//                               return ErrorAlertDialog(
//                                   message: "Fill Completely");
//                             });
//                   },
//                   child: Container(
//                     height: 45,
//                     width: 400,
//                     child: Center(
//                       child: Text(
//                         "CREATE ACCOUNT",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.white,
//                               fontSize: 14,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(204, 191, 171, 1),
//                         border: Border.all(
//                             color: Color.fromRGBO(204, 191, 171, 1))),
//                   ),
//                 ),
//                 Box(height: 10, width: 0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Have an account ?",
//                       style: GoogleFonts.nunitoSans(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.normal,
//                             color: Colors.black45,
//                             fontSize: 14,
//                             letterSpacing: 0),
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (_) => LoginScreen()));
//                       },
//                       child: Text(
//                         " Login",
//                         style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.normal,
//                               color: Colors.black,
//                               fontSize: 14,
//                               letterSpacing: 0),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Box(height: 40, width: 0),
//                 EndBox()
//               ],
//             ),
//             color: Colors.white),
//       ),
//     ));
//   }

//   Future<void> _Registerform() async {
//     User firebaseUser;
//     await auth
//         .createUserWithEmailAndPassword(
//             email: emailcontroller.text, password: passwordcontroller.text)
//         .then((authUser) {
//       var snackBar = SnackBar(
//           backgroundColor: Colors.white,
//           content: Container(
//             height: 20,
//             child: Center(
//                 child: Text(
//               'Account Created Successfully',
//               style: TextStyle(color: Colors.black, letterSpacing: 1),
//             )),
//           ));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);

//       firebaseUser = authUser.user!;
//       FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
//         "uid": firebaseUser.uid,
//         "email": firebaseUser.email,
//         "name": namecontroller.text.trim(),
//       });
//       MRANDMRS.sharedprefs!.setString("uid", firebaseUser.uid);
//       MRANDMRS.sharedprefs!.setString("email", firebaseUser.email.toString());
//       MRANDMRS.sharedprefs!
//           .setString("name", namecontroller.text)
//           .then((value) {
//         Route route = MaterialPageRoute(builder: (context) => AccountScreen());
//         Navigator.pushReplacement(context, route);
//       });
//     });
//   }
// }
