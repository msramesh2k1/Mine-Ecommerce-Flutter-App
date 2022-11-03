// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import 'package:google_fonts/google_fonts.dart';

// import 'HomePage.dart';

// enum MobileVerificationState {
//   SHOW_MOBILE_FORM_STATE,
//   SHOW_OTP_FORM_STATE,
// }

// class MobileLoginScreen extends StatefulWidget {
//   @override
//   _MobileLoginScreenState createState() => _MobileLoginScreenState();
// }

// class _MobileLoginScreenState extends State<MobileLoginScreen> {
//   MobileVerificationState currentState =
//       MobileVerificationState.SHOW_MOBILE_FORM_STATE;

//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();
//   final aadharcontroller = TextEditingController();

//   FirebaseAuth _auth = FirebaseAuth.instance;

//   late String verificationId;

//   bool showLoading = false;

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     setState(() {
//       showLoading = true;
//     });

//     try {
//       final authCredential =
//           await _auth.signInWithCredential(phoneAuthCredential);

//       setState(() {
//         showLoading = false;
//       });

//       if (authCredential.user != null) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomeScreen()));
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });

//       _scaffoldKey.currentState!
//           .showSnackBar(SnackBar(content: Text(e.message.toString())));
//     }
//   }

//   getMobileFormWidget(context) {
//     return Column(
//       children: [
//         Spacer(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: 6,
//             ),
//             Text(
//               "Enter your Aadhar Number to get started , \nyou will receive an OTP on registered Phone Number",
//               style: GoogleFonts.nunitoSans(
//                   fontSize: 16, fontWeight: FontWeight.normal),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 0.0, right: 0),
//               child: Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width - 100,
//                 decoration: BoxDecoration(
//                     // border: Border.all(color: Colors.green.shade900),
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: TextField(
//                     controller: aadharcontroller,
//                     decoration: InputDecoration(
//                         hintText: "Aadhar Number",
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.transparent)),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.transparent))),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             GestureDetector(
//               onTap: () {
//                 verifyPhone("+91", "7010862331");
//                 // String phoneno = "";
//                 // FirebaseFirestore.instance
//                 //     .collection("users")
//                 //     .doc("123456789123")
//                 //     .get()
//                 //     .then((value) {
//                 //   print(value.data()!['no']);
//                 //   setState(() {
//                 //     phoneno = value.data()!['no'];
//                 //   });
//                 // }).then((value) => {
//                 //           verifyPhone("+91", phoneno).then(
//                 //             (value) {
//                 //               print("OTP SENT ");
//                               // Navigator.push(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (b) => OTPScreen(phoneno)));
//                             // },
//                           // )
//                         // });
//               },
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   color: Colors.green[900],
//                   shape: BoxShape.circle,
//                 ),
//                 child: Center(
//                     child: Icon(
//                   Icons.arrow_forward_ios,
//                   color: Colors.white,
//                   size: 14,
//                 )),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 30,
//         ),
//       ],
//     );
//   }

//   getOtpFormWidget(context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           //todo
//           SizedBox(
//             height: 50,
//           ),
//           Text(
//             "Enter OTP",
//             style: GoogleFonts.nunitoSans(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10)),
//             width: MediaQuery.of(context).size.width - 20,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 controller: otpController,
//                 decoration: InputDecoration(
//                   focusedBorder: InputBorder.none,
//                   enabledBorder: InputBorder.none,
//                   errorBorder: InputBorder.none,
//                   disabledBorder: InputBorder.none,
//                   hintText: "    OTP",
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 16,
//           ),

//           GestureDetector(
//             onTap: () {
//               PhoneAuthCredential? phoneAuthCredential =
//                   PhoneAuthProvider?.credential(
//                       verificationId: verificationId,
//                       smsCode: otpController.text) as PhoneAuthCredential?;

//               signInWithPhoneAuthCredential(phoneAuthCredential!);
//             },
//             child: CircleAvatar(
//               radius: 33,
//               child: Icon(
//                 Icons.arrow_forward_ios,
//                 color: Colors.white,
//               ),
//               backgroundColor: Colors.green[900],
//             ),
//           ),

//           Spacer(),
//         ],
//       ),
//     );
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         body: Container(
//           width: MediaQuery.of(context).size.width,
//           child: showLoading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
//                   ? getMobileFormWidget(context)
//                   : getOtpFormWidget(context),
//           padding: const EdgeInsets.all(16),
//         ));
//   }

//   verifyPhone(String s, String phoneno) async {
//     setState(() {
//       showLoading = true;
//     });
//     await _auth.verifyPhoneNumber(
//       phoneNumber: "+917010862331",
//       verificationCompleted: (phoneAuthCredential) async {
//         setState(() {
//           showLoading = false;
//         });
//         signInWithPhoneAuthCredential(phoneAuthCredential);
//       },
//       verificationFailed: (verificationFailed) async {
//         setState(() {
//           showLoading = false;
//         });
//         _scaffoldKey.currentState!.showSnackBar(
//             SnackBar(content: Text(verificationFailed.message.toString())));
//       },
//       codeSent: (verificationId, resendingToken) async {
//         setState(() {
//           showLoading = false;
//           currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
//           this.verificationId = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (verificationId) async {},
//     );
//   }
// }
