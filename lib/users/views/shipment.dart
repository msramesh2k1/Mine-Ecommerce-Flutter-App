import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mine/getcontrolleradddress.dart';
import 'package:mine/helpers/responsive_widget.dart';
import 'package:mine/users/views/Detailer.dart';
import 'package:mine/users/views/detailproductscreen.dart';

import 'package:mine/users/views/dummy.dart';
// import '../../UiFake.dart' if (dart.library.html) 'dart:ui' as ui;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:mine/paymentpage.dart';
import 'package:provider/src/provider.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../Address.dart';
import 'Helper.dart';
import '../../Orders.dart';
import '../../controllers/cart_controller.dart';
import 'HomePage.dart';

class ShipmentPage extends StatefulWidget {
  @override
  _ShipmentPageState createState() => _ShipmentPageState();
}

class _ShipmentPageState extends State<ShipmentPage> {
  var currentStep = 0;
  num totalAmount = 0;
  int quanity = 1;
  int cartno = 0;
  int? addressid = 0;
  // Razorpay? _razorpay;
  // final razorpay = Razorpay();
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("address")
        .snapshots();
    // TODO: implement initState

    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("address")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        addressid = querySnapshot.docs.length;
      });
    });
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .snapshots();
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        cartno = querySnapshot.docs.length;
      });
    });

    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          MRANDMRS.sharedprefs!
              .setInt(element.data()['id'], element.data()['quanity']);
          totalAmount = totalAmount +
              element.data()["oprice"] * element.data()['quanity'];
        });
      });
    });
    // TODO: implement initState
    super.initState();
    // _razorpay = Razorpay();
    // _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .snapshots();
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        cartno = querySnapshot.docs.length;
      });
    });
    // FirebaseFirestore.instance
    //     .collection("users")
    //     .doc(MRANDMRS.sharedprefs!.getString("uid"))
    //     .collection("cart")
    //     .get()
    //     .then((value) {
    //   value.docs.forEach((element) {
    //     setState(() {
    //       MRANDMRS.sharedprefs!
    //           .setInt(element.data()['id'], element.data()['quanity']);
    //       totalAmount =
    //           totalAmount + element.data()["oprice"] * element.data()['quanity'];
    //     });
    //   });
    // });
  }

//   void paySuccess(PaymentSuccessResponse response) {
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//         .collection("cart")
//         .get()
//         .then((value) => value.docs.forEach((element) {
//               FirebaseFirestore.instance
//                   .collection("orders")
//                   .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                   .collection("items")
//                   .doc(response.paymentId.toString())
//                   .set({
//                 "id": response.paymentId.toString(),
//                 "status": "order Placed",
//                 "address": id,
//                 "payment": "PAID"
//               });
//               FirebaseFirestore.instance
//                   .collection("orders")
//                   .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                   .collection("items")
//                   .doc(response.paymentId.toString())
//                   .collection("items")
//                   .doc(element.data()['id'])
//                   .set({
//                 "height": element.data()['height'],
//                 'width': element.data()['width'],
//                 "depth": element.data()['depth'],
//                 "weight": element.data()['weight'],
//                 "warranty": element.data()['warranty'],
//                 "status": "orderPlaced, Yet to Deliver",
//                 "category": element.data()['category'],
//                 "name": element.data()["name"],
//                 "quanity": element.data()['quanity'],
//                 "wood": element.data()['wood'],
//                 "id": element.data()['id'],
//                 'mainimage': element.data()['mainimage'],
//                 "Description": element.data()['Description'],
//                 'price': element.data()['price'],
//                 'oprice': element.data()['oprice']

// // ********************//
//               });
//               FirebaseFirestore.instance
//                   .collection("users")
//                   .doc(MRANDMRS.sharedprefs!.getString("uid"))
//                   .collection("cart")
//                   .doc(element.data()['id'])
//                   .delete();
//             }));
//     FirebaseFirestore.instance
//         .collection("orders")
//         .doc(MRANDMRS.sharedprefs!.getString("uid"))
//         .set({
//       // "addressid": id,
//       // "amount": totalAmount,
// //"orderBy":EcommerceApp.sharedPreferences!.getStringList(EcommerceApp.userCartList),
//       //  "orderBy": MRANDMRS.sharedprefs!.getString("uid"),
// // EcommerceApp.productID:EcommerceApp.sharedPreferences!.getStringList(EcommerceApp.userCartList),
//       //"method": "Cash On Delievery",
//       "time": DateTime.now().millisecondsSinceEpoch.toString(),
//       // "paid": true,
//     }).then((value) => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (c) => Orders())));
//   }

//   void payError(PaymentFailureResponse response) {
//     print(response.message! + response.code.toString());
//   }

//   void externalWallet(ExternalWalletResponse response) {
//     print(response.walletName);
//   }

//   getPayment() {
//     var options = {
//       'key': 'rzp_test_NNbwJ9tmM0fbxj',
//       'amount': (totalAmount.toDouble() * 100),
//       'name': 'Ramesh M S',
//       'description': 'E - Ration Payment portal',
//       'prefill': {'contact': '9344768931', 'email': 'msramesh2k1@gmail.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//   }

  int cartvalueno() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        cartno = querySnapshot.docs.length;
      });
    });
    return cartno;
  }

  int? addressvalueno() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("address")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        addressid = querySnapshot.docs.length;
      });
    });
    return addressid;
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _razorpay!.clear();
  // }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_NNbwJ9tmM0fbxj',
      'amount': (totalAmount * 100),
      'name': 'Ramesh M S',
      'description': 'E - Ration Payment portal',
      'prefill': {'contact': '9344768931', 'email': 'msramesh2k1@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    // try {
    //   _razorpay!.open(options);
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   print(response.orderId);
  //   print(response.paymentId);
  //   print(response.signature);
  //   Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId.toString());
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (BuildContext context) {
  //     return HomeScreen();
  //   }));
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   Fluttertoast.showToast(
  //     msg: "ERROR: " +
  //         response.code.toString() +
  //         " - " +
  //         response.message.toString(),
  //   );
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   Fluttertoast.showToast(
  //       msg: "EXTERNAL_WALLET: " + response.walletName.toString());
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    List<Step> steps = [
      Step(
          title: Text("cart"),
          content: Address(),
          state: StepState.indexed,
          isActive: true),
      Step(
          title: Text("Address"),
          content: Address(),
          state: StepState.indexed,
          isActive: true),
      // Step(
      //     title: Text("Place Order"),
      //     content: PaymentPage(
      //       addressId: id,
      //       totalAmount: totalAmount.toDouble(),
      //       key: null,
      //     ),
      //     state: StepState.indexed,
      //     isActive: true)
    ];
    return Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back_ios_sharp,
        //           color: kBackgroundColor, size: 12)),
        //   leadingWidth: 25,
        //   title: Text(
        //     "Place Order",
        //     style: GoogleFonts.nunitoSans(
        //       textStyle: TextStyle(
        //           fontWeight: FontWeight.w700,
        //           color: kBackgroundColor,
        //           fontSize: 20,
        //           letterSpacing: 0),
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: ResponsiveWidget(
      mobile: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",
                      ),
                      fit: BoxFit.cover)),
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Mr & Mrs",
                      style: GoogleFonts.novaSlim(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "Design Wood Works",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 40),
              child: Row(
                children: [
                  Text(
                    "CART",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 3),
                    ),
                  ),
                  Text(
                    "   >   ",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "SHIPPING",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    "   >   ",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "PAYMENT",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        if (addressid!.bitLength.toString() == "1") {
                          final snackBar = SnackBar(
                              backgroundColor: Colors.brown[200],
                              width: 300,
                              behavior: SnackBarBehavior.floating,
                              dismissDirection: DismissDirection.startToEnd,
                              content: Text('Please Select Address'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

//todonow

                        }
                        final store = Get.put(AddressChangerController());
                        setState(() {
                          addressid = int.parse(store.addressid.toString());
                        });

                        //  print(addressid);
                        print(addressid!.bitLength.toString());
                        // print(totalAmount);

                        Get.off(DummyPay(totalamount: totalAmount));
                      },
                      child: Container(
                        height: 35,
                        width: 120,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "CHECKOUT",
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 5),
              child: Row(
                children: [
                  Container(
                    height: 85,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: Colors.grey[50]),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "User Details",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "Name : ",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      MRANDMRS.sharedprefs!
                                          .getString("name")
                                          .toString(),
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              MRANDMRS.sharedprefs!
                                          .getString("email")
                                          .toString() ==
                                      ""
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "Phone No : ",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            MRANDMRS.sharedprefs!
                                                .getString("phno")
                                                .toString(),
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Email : ",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                MRANDMRS.sharedprefs!
                                                    .getString("email")
                                                    .toString(),
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Phone No : ",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                MRANDMRS.sharedprefs!
                                                    .getString("phno")
                                                    .toString(),
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 270,
                    width: MediaQuery.of(context).size.width - 30,
                    child: SingleChildScrollView(child: Address()),
                    color: Colors.brown[50],
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 20.0, top: 0),
            ),
          ],
        ),
      ),
      tab: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",
                      ),
                      fit: BoxFit.cover)),
              height: 90,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Mr & Mrs",
                      style: GoogleFonts.novaSlim(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "Design Wood Works",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 40),
              child: Row(
                children: [
                  Text(
                    "CART",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 3),
                    ),
                  ),
                  Text(
                    "   >   ",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "SHIPPING",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    "   >   ",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "PAYMENT",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        if (addressid!.bitLength.toString() == "1") {
                          final snackBar = SnackBar(
                              backgroundColor: Colors.brown[200],
                              width: 300,
                              behavior: SnackBarBehavior.floating,
                              dismissDirection: DismissDirection.startToEnd,
                              content: Text('Please Select Address'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

//todonow

                        }
                        final store = Get.put(AddressChangerController());
                        setState(() {
                          addressid = int.parse(store.addressid.toString());
                        });

                        //  print(addressid);
                        print(addressid!.bitLength.toString());
                        // print(totalAmount);

                        Get.off(DummyPay(totalamount: totalAmount));
                      },
                      child: Container(
                        height: 35,
                        width: 140,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "CHECKOUT",
                            style: GoogleFonts.nunitoSans(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 5),
              child: Row(
                children: [
                  Container(
                    height: 85,
                    width: 600,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: Colors.grey[50]),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 580,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "User Details",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      "Name : ",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      MRANDMRS.sharedprefs!
                                          .getString("name")
                                          .toString(),
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 12,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              MRANDMRS.sharedprefs!
                                          .getString("email")
                                          .toString() ==
                                      ""
                                  ? Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "Phone No : ",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            MRANDMRS.sharedprefs!
                                                .getString("phno")
                                                .toString(),
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Email : ",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                MRANDMRS.sharedprefs!
                                                    .getString("email")
                                                    .toString(),
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Phone No : ",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                MRANDMRS.sharedprefs!
                                                    .getString("phno")
                                                    .toString(),
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      letterSpacing: 0),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 245,
                        width: 600,
                        child: SingleChildScrollView(child: Address()),
                        color: Colors.brown[50],
                      ),
                    ],
                  ),
                ],
              ),
              padding: const EdgeInsets.only(left: 20.0, top: 5),
            )),
          ],
        ),
      ),

      desktop: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",
                      ),
                      fit: BoxFit.cover)),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Mr & Mrs",
                      style: GoogleFonts.novaSlim(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "Design Wood Works",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 11,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Row(
                children: [
                  Text(
                    "CART",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    "   >   ",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "SHIPPING",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: 2),
                    ),
                  ),
                  Text(
                    "   >   ",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "PAYMENT",
                    style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 11,
                          letterSpacing: 2),
                    ),
                  ),
                ],
              ),
            ),
//cart come

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.width / 3.5,
                      width: 500,
                      child: SingleChildScrollView(child: Address()),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.width / 3.5,
                    // height: 369,
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        color: Colors.grey[50]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "User Details",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              fontSize: 16,
                                              letterSpacing: 0.5),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        MRANDMRS.sharedprefs!
                                            .getString("name")
                                            .toString(),
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                              fontSize: 15,
                                              letterSpacing: 0.5),
                                        ),
                                      ),

                                      MRANDMRS.sharedprefs!
                                                  .getString("email")
                                                  .toString() ==
                                              ""
                                          ? Container(
                                              color: Colors.transparent,
                                              height: 30,
                                              width: 200,
                                              child: Row(
                                                children: [
                                                  
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0),
                                                    child: Text(
                                                      "Phone No : ",
                                                      style: GoogleFonts
                                                          .nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            letterSpacing: 0),
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Text(
                                                      MRANDMRS.sharedprefs!
                                                          .getString("phno")
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            letterSpacing: 0),
                                                      ),
                                                    ),
                                                  ),
                                                 
                                                ],
                                              ),
                                            )
                                          : Container(
                                              height: 42,
                                              width: 200,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Email : ",
                                                          style: GoogleFonts
                                                              .nunitoSans(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                letterSpacing:
                                                                    0),
                                                          ),
                                                        ),Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.0),
                                                          child: Text(
                                                            MRANDMRS
                                                                .sharedprefs!
                                                                .getString(
                                                                    "email")
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                  letterSpacing:
                                                                      0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                
                                                
                                                  Row(
                                                    children: [
                                                     
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Text(
                                                          "Phone No : ",
                                                          style: GoogleFonts
                                                              .nunitoSans(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                letterSpacing:
                                                                    0),
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Text(
                                                          MRANDMRS.sharedprefs!
                                                              .getString("phno")
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .nunitoSans(
                                                            textStyle: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                letterSpacing:
                                                                    0),
                                                          ),
                                                        ),
                                                      ),
                                                      
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                      // MRANDMRS.sharedprefs!.getString("email").toString() == "" ?
                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 20,
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(5.0),
                                      //       child: Text(
                                      //         "Phone No : ",
                                      //         style: GoogleFonts.nunitoSans(
                                      //           textStyle: TextStyle(
                                      //               fontWeight: FontWeight.normal,
                                      //               color: Colors.black,
                                      //               fontSize: 12,
                                      //               letterSpacing: 0),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Spacer(),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(5.0),
                                      //       child: Text(
                                      //         MRANDMRS.sharedprefs!
                                      //             .getString("phno")
                                      //             .toString(),
                                      //         style: GoogleFonts.nunitoSans(
                                      //           textStyle: TextStyle(
                                      //               fontWeight: FontWeight.bold,
                                      //               color: Colors.black,
                                      //               fontSize: 12,
                                      //               letterSpacing: 0),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: 20,
                                      //     ),
                                      //   ],
                                      // ):
                                      // Container(
                                      //   height: 500,
                                      //   width: 500,
                                      //   child:
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left:20.0,right:20,bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              if (addressid!.bitLength.toString() == "1") {
                                final snackBar = SnackBar(
                                    backgroundColor: Colors.brown[200],
                                    width: 300,
                                    behavior: SnackBarBehavior.floating,
                                    dismissDirection:
                                        DismissDirection.startToEnd,
                                    content: Text('Please Select Address'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              final store = Get.put(AddressChangerController());
                              setState(() {
                                addressid =
                                    int.parse(store.addressid.toString());
                              });

                              //  print(addressid);
                              print(addressid!.bitLength.toString());
                              // print(totalAmount);

                              Get.off(DummyPay(totalamount: totalAmount));
                            },
                            child: Container(
                              height: 35,
                              width: 300,
                              color: Colors.black,
                              child: Center(
                                child: Text(
                                  "CHECKOUT",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        )
                      ],
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ],
        ),
      ),
      //  desktop: Container(
      //   height : MediaQuery.of(context).size.height,
      //   child: Column(
      //     children: [
      //       Container(
      //         child: Center(
      //           child: Column(
      //              mainAxisAlignment: MainAxisAlignment.center,
      //                  crossAxisAlignment: CrossAxisAlignment.center,

      //             children: [
      //                Text(
      //                     "Mr & Mrs",
      //                     style: GoogleFonts.novaSlim(
      //                       textStyle: const TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.white,
      //                           fontSize: 25,
      //                           letterSpacing: 0),
      //                     ),
      //                   ),
      //                   Text(
      //                     "Design Wood Works",
      //                     style: GoogleFonts.nunitoSans(
      //                       textStyle: const TextStyle(
      //                           fontWeight: FontWeight.normal,
      //                           color: Colors.white,
      //                           fontSize: 11,
      //                           letterSpacing: 1),
      //                     ),
      //                   ),

      //             ],
      //           ),
      //         ),
      //          decoration: BoxDecoration(
      //                 image: DecorationImage(
      //                     image: NetworkImage(
      //                       "https://i.ibb.co/RYSwJQn/Untitled-1920-900-px.png",
      //                     ),
      //                     fit: BoxFit.cover)),
      //             height: 130,
      //             width: MediaQuery.of(context).size.width,

      //       ),
      //       Padding(padding: const EdgeInsets.only(top: 20.0, left: 20),
      //       child: Row(
      //               children: [
      //                 Text(
      //                   "CART",
      //                   style: GoogleFonts.nunitoSans(
      //                     textStyle: const TextStyle(
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.black,
      //                         fontSize: 11,
      //                         letterSpacing: 2),
      //                   ),
      //                 ),
      //                 Text(
      //                   "   >   ",
      //                   style: GoogleFonts.nunitoSans(
      //                     textStyle: const TextStyle(
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.black,
      //                         fontSize: 11,
      //                         letterSpacing: 0),
      //                   ),
      //                 ),
      //                 Text(
      //                   "SHIPPING",
      //                   style: GoogleFonts.nunitoSans(
      //                     textStyle: const TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.black,
      //                         fontSize: 13,
      //                         letterSpacing: 2),
      //                   ),
      //                 ),
      //                 Text(
      //                   "   >   ",
      //                   style: GoogleFonts.nunitoSans(
      //                     textStyle: const TextStyle(
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.black,
      //                         fontSize: 11,
      //                         letterSpacing: 0),
      //                   ),
      //                 ),
      //                 Text(
      //                   "PAYMENT",
      //                   style: GoogleFonts.nunitoSans(
      //                     textStyle: const TextStyle(
      //                         fontWeight: FontWeight.normal,
      //                         color: Colors.black,
      //                         fontSize: 11,
      //                         letterSpacing: 2),
      //                   ),
      //                 ),
      //               ],
      //             ),

      //        ),

      //        Padding(padding: const EdgeInsets.all(20.0),
      //        child: Row(
      //         children: [
      //           SingleChildScrollView(
      //             child: Container(
      //                 height: MediaQuery.of(context).size.width / 3.5,
      //                     width: 500,
      //                     child: SingleChildScrollView(child: Address()),
      //             ),
      //           ), SizedBox(
      //                   width: 20,
      //                 ),

      //                 Container(
      //                   height: 200,
      //                   width: 250,
      //                     decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.black12),
      //                       color: Colors.grey[50]),
      //                       child: Column(
      //                         children: [
      //                            Spacer(),
      //                           Column(
      //                             children: [
      //                               Padding(
      //                             padding: const EdgeInsets.all(20),
      //                             child: Row(
      //                               children: [
      //                                 Column(
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [
      //                                     Text(
      //                                       "User Details",
      //                                       style: GoogleFonts.nunitoSans(
      //                                         textStyle: const TextStyle(
      //                                             fontWeight: FontWeight.bold,
      //                                             color: Colors.black54,
      //                                             fontSize: 16,
      //                                             letterSpacing: 0.5),
      //                                       ),
      //                                     ),
      //                                     SizedBox(
      //                                       height: 20,
      //                                     ),
      //                                     Text(
      //                                       MRANDMRS.sharedprefs!
      //                                           .getString("name")
      //                                           .toString(),
      //                                       style: GoogleFonts.nunitoSans(
      //                                         textStyle: const TextStyle(
      //                                             fontWeight: FontWeight.normal,
      //                                             color: Colors.black,
      //                                             fontSize: 15,
      //                                             letterSpacing: 0.5),
      //                                       ),
      //                                     ),

      //                             // MRANDMRS.sharedprefs!.getString("email").toString() == "" ?
      //                             // Row(
      //                             //   children: [
      //                             //     SizedBox(
      //                             //       width: 20,
      //                             //     ),
      //                             //     // Padding(
      //                             //     //   padding: const EdgeInsets.all(5.0),
      //                             //     //   child: Text(
      //                             //     //     "Phone No : ",
      //                             //     //     style: GoogleFonts.nunitoSans(
      //                             //     //       textStyle: TextStyle(
      //                             //     //           fontWeight: FontWeight.normal,
      //                             //     //           color: Colors.black,
      //                             //     //           fontSize: 12,
      //                             //     //           letterSpacing: 0),
      //                             //     //     ),
      //                             //     //   ),
      //                             //     // ),
      //                             //     Spacer(),
      //                             //     // Padding(
      //                             //     //   padding: const EdgeInsets.all(5.0),
      //                             //     //   child: Text(
      //                             //     //     MRANDMRS.sharedprefs!
      //                             //     //         .getString("phno")
      //                             //     //         .toString(),
      //                             //     //     style: GoogleFonts.nunitoSans(
      //                             //     //       textStyle: TextStyle(
      //                             //     //           fontWeight: FontWeight.bold,
      //                             //     //           color: Colors.black,
      //                             //     //           fontSize: 12,
      //                             //     //           letterSpacing: 0),
      //                             //     //     ),
      //                             //     //   ),
      //                             //     // ),
      //                             //     SizedBox(
      //                             //       width: 20,
      //                             //     ),
      //                             //   ],
      //                             // ):
      //                             // Column(
      //                             //   children: [
      //                             //     Row(
      //                             //       children: [
      //                             //         SizedBox(
      //                             //           width: 20,
      //                             //         ),
      //                             //         Padding(
      //                             //           padding: const EdgeInsets.all(5.0),
      //                             //           child: Text(
      //                             //             "Email : ",
      //                             //             style: GoogleFonts.nunitoSans(
      //                             //               textStyle: TextStyle(
      //                             //                   fontWeight: FontWeight.normal,
      //                             //                   color: Colors.black,
      //                             //                   fontSize: 12,
      //                             //                   letterSpacing: 0),
      //                             //             ),
      //                             //           ),
      //                             //         ),
      //                             //         Spacer(),
      //                             //         // Padding(
      //                             //         //   padding: const EdgeInsets.all(5.0),
      //                             //         //   child: Text(
      //                             //         //     MRANDMRS.sharedprefs!
      //                             //         //         .getString("email")
      //                             //         //         .toString(),
      //                             //         //     style: GoogleFonts.nunitoSans(
      //                             //         //       textStyle: TextStyle(
      //                             //         //           fontWeight: FontWeight.bold,
      //                             //         //           color: Colors.black,
      //                             //         //           fontSize: 12,
      //                             //         //           letterSpacing: 0),
      //                             //         //     ),
      //                             //         //   ),
      //                             //         // ),
      //                             //         SizedBox(
      //                             //           width: 20,
      //                             //         ),
      //                             //       ],
      //                             //     ),
      //                             //     Row(
      //                             //       children: [
      //                             //         SizedBox(
      //                             //           width: 20,
      //                             //         ),
      //                             //         // Padding(
      //                             //         //   padding: const EdgeInsets.all(5.0),
      //                             //         //   child: Text(
      //                             //         //     "Phone No : ",
      //                             //         //     style: GoogleFonts.nunitoSans(
      //                             //         //       textStyle: TextStyle(
      //                             //         //           fontWeight: FontWeight.normal,
      //                             //         //           color: Colors.black,
      //                             //         //           fontSize: 12,
      //                             //         //           letterSpacing: 0),
      //                             //         //     ),
      //                             //         //   ),
      //                             //         // ),
      //                             //       //  Spacer(),
      //                             //         // Padding(
      //                             //         //   padding: const EdgeInsets.all(5.0),
      //                             //         //   child: Text(
      //                             //         //     MRANDMRS.sharedprefs!
      //                             //         //         .getString("phno")
      //                             //         //         .toString(),
      //                             //         //     style: GoogleFonts.nunitoSans(
      //                             //         //       textStyle: TextStyle(
      //                             //         //           fontWeight: FontWeight.bold,
      //                             //         //           color: Colors.black,
      //                             //         //           fontSize: 12,
      //                             //         //           letterSpacing: 0),
      //                             //         //     ),
      //                             //         //   ),
      //                             //         // ),
      //                             //         SizedBox(
      //                             //           width: 20,
      //                             //         ),
      //                             //       ],
      //                             //     ),
      //                             //   ],
      //                             // ),
      //                                   ],
      //                                 ),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      // ]))]))]))
    ));
  }
}
