// import 'dart:html';
// import 'dart:ui' as ui;
// //conditional import
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

// import 'users/views/Helper.dart';
// import 'Orders.dart';
// import 'UiFake.dart' if (dart.library.html) 'dart:ui' as ui;
// import 'package:flutter/material.dart';

// class RazorPayWeb extends StatelessWidget {
//   final int? id;
//   final num? price;

//   const RazorPayWeb({Key? key, required this.id, this.price}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //register view factory
//     ui.platformViewRegistry.registerViewFactory("rzp-html", (int viewId) {
//       IFrameElement element = IFrameElement()
//         //  final html.Element htmlElement = html.DivElement()
//         ..style.width = '100%'
//         ..style.height = '100%'
//         ..style.backgroundColor = "white";
//       // ..style.backgroundImage = url()
//       // ..allowFullscreen = true;
// //Event Listener
//       window.onMessage.forEach((element) {
//         // print(element);
//         print('Event Received in callback: ${element.data}');
//         if (element.data == 'MODAL_CLOSED') {
//           Navigator.pop(context);
//         }
//         //  else if (element.data == 'SUCCESS') {
//         //   print('PAYMENT SUCCESSFULL!!!!!!!');
//         //   Navigator.pop(context);
//         // }
//         else {
//           print("DONE DONE DONE");
//           // Navigator.pop(context);

//           String payid = element.data['razorpay_payment_id'];
//           print(payid);
//           print(MRANDMRS.sharedprefs!.getString("uid"));

//           //  print(element.data['razorpay_order_id']);
//           // print(element.data.razorpay_order_id);
//           // print(element.data.razorpay_signature);
//           FirebaseFirestore.instance
//               .collection("users")
//               .doc(MRANDMRS.sharedprefs!.getString("uid"))
//               .collection("cart")
//               .get()
//               .then((value) => value.docs.forEach((element) {
//                     FirebaseFirestore.instance
//                         .collection("orders")
//                         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                         .collection("items")
//                         .doc(payid)
//                         .set({
//                       "id": payid.toString(),
//                       "status": "order Placed",
//                       "address": id,
//                       "payment": "PAID"
//                     });
//                     FirebaseFirestore.instance
//                         .collection("orders")
//                         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                         .collection("items")
//                         .doc(payid)
//                         .collection("items")
//                         .doc(element.data()['id'])
//                         .set({
//                       "height": element.data()['height'],
//                       'width': element.data()['width'],
//                       "depth": element.data()['depth'],
//                       "weight": element.data()['weight'],
//                       "warranty": element.data()['warranty'],
//                       "status": "orderPlaced, Yet to Deliver",
//                       "category": element.data()['category'],
//                       "name": element.data()["name"],
//                       "quanity": element.data()['quanity'],
//                       "wood": element.data()['wood'],
//                       "id": element.data()['id'],
//                       'mainimage': element.data()['mainimage'],
//                       "Description": element.data()['Description'],
//                       'price': element.data()['price'],
//                       'oprice': element.data()['oprice']

// // ********************//
//                     });
//                     FirebaseFirestore.instance
//                         .collection("users")
//                         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                         .collection("cart")
//                         .doc(element.data()['id'])
//                         .delete();
//                   }));
//           FirebaseFirestore.instance
//               .collection("orders")
//               .doc(MRANDMRS.sharedprefs!.getString("uid"))
//               .set({
//             // "addressid": id,
//             // "amount": totalAmount,
// //"orderBy":EcommerceApp.sharedPreferences!.getStringList(EcommerceApp.userCartList),
//             //  "orderBy": MRANDMRS.sharedprefs!.getString("uid"),
// // EcommerceApp.productID:EcommerceApp.sharedPreferences!.getStringList(EcommerceApp.userCartList),
//             //"method": "Cash On Delievery",
//             "time": DateTime.now().millisecondsSinceEpoch.toString(),
//             // "paid": true,
//           }).then((value) => Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (c) => Orders())));
//         }
//       });

//       element.requestFullscreen();
//       element.allowFullscreen = true;
//       element.style.height = "100%";
//       element.style.width = "100%";
//       element.src = 'assets/html/payment.html';
//       // element.style.backgroundImage = "url('./dp.jpg')";
//       element.style.backgroundColor = "lightblue";
//       return element;
//     });
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Builder(builder: (BuildContext context) {
//           return Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: Colors.white,
//             child: HtmlElementView(viewType: 'rzp-html'),
//           );
//         }));
//   }
// }
