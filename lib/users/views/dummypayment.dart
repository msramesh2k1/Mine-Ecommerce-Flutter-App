// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// import 'HomePage.dart';

// class CartPage extends StatefulWidget {
//   const CartPage() : super();

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {



//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//    FirebaseFirestore.instance
//         .collection("users")
//         .doc("123456789123")
//         .collection("cart")
//         .get()
//         .then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           // Shared.sharedprefs!
//           //     .setInt(element.data()['id'], element.data()['quanity']);
//           totalamount = totalamount +
//               int.tryParse(element.data()["price"])! *
//                   int.tryParse(element.data()['quanity'])!;
//         });
//       });
//     });
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.green[800],
//         title: Text(
//           "CartPage",
//           style: GoogleFonts.nunitoSans(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             Container(
//               height: 50,
//               width: MediaQuery.of(context).size.width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "     Total : " + totalamount.toString(),
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               color: Colors.green[100],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     "Name",
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     "Quanity",
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Spacer(),
//                   Text(
//                     "Price",
//                     style: GoogleFonts.nunitoSans(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   )
//                 ],
//               ),
//               height: 30,
//             ),
//             Expanded(
//               child: Container(
//                 height: MediaQuery.of(context).size.height - 300,
//                 child: StreamBuilder<QuerySnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection("users")
//                         .doc("123456789123")
//                         .collection("cart")
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       return ListView.builder(
//                           itemCount: snapshot.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             if (!snapshot.hasData) {
//                               return SizedBox();
//                             }
//                             return Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: GestureDetector(
//                                 onTap: () {},
//                                 child: Container(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           SizedBox(
//                                             width: 15,
//                                           ),
//                                           Text(
//                                             snapshot.data!.docs[index]['name'],
//                                             style: GoogleFonts.nunitoSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           Spacer(),
//                                           Text(
//                                             snapshot.data!.docs[index]
//                                                 ['quanity'],
//                                             style: GoogleFonts.nunitoSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           Spacer(),
//                                           Text(
//                                             snapshot.data!.docs[index]['price'],
//                                             style: GoogleFonts.nunitoSans(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           SizedBox(
//                                             width: 15,
//                                           )
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   height: 100,
//                                   width: MediaQuery.of(context).size.width,
//                                   color: Colors.green[50],
//                                 ),
//                               ),
//                             );
//                           });
//                     }),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 openCheckout(); ////
//                 ///'
//                 /////
//                 ///
//                 ///
//                 ///

//                 // Navigator.push(
//                 //     context, MaterialPageRoute(builder: (_) => CartPage()));
//               },
//               child: Container(
//                 height: 60,
//                 child: Center(
//                   child: Text(
//                     "Checkout",
//                     style: GoogleFonts.nunitoSans(
//                         color: Colors.white,
//                         fontSize: 19,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.green[800],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
