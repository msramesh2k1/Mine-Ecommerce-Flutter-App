import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mine/helpers/responsive_widget.dart';
import 'package:mine/users/views/Detailer.dart';
import 'package:mine/users/views/detailproductscreen.dart';
// import 'package:mine/razorpay.dart';
import 'package:mine/users/views/dummy.dart';
import 'package:mine/users/views/shipment.dart';

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

class StepperCart extends StatefulWidget {
  @override
  _StepperCartState createState() => _StepperCartState();
}

class _StepperCartState extends State<StepperCart> {
  var currentStep = 0;
  num totalAmount = 0;
  int quanity = 1;
  int cartno = 0;
  int? addressid;
 
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

  // void payError(PaymentFailureResponse response) {
  //   print(response.message! + response.code.toString());
  // }

  // void externalWallet(ExternalWalletResponse response) {
  //   print(response.walletName);
  // }

  // getPayment() {
  //   var options = {
  //     'key': 'rzp_test_NNbwJ9tmM0fbxj',
  //     'amount': (totalAmount.toDouble() * 100),
  //     'name': 'Ramesh M S',
  //     'description': 'E - Ration Payment portal',
  //     'prefill': {'contact': '9344768931', 'email': 'msramesh2k1@gmail.com'},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };
  // }

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

  // int? addressvalueno() {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(MRANDMRS.sharedprefs!.getString("uid"))
  //       .collection("address")
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     setState(() {
  //       addressid = querySnapshot.docs.length;
  //     });
  //   });
  //   return addressid;
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _razorpay!.clear();
  // }

  // void openCheckout() async {
  //   var options = {
  //     'key': 'rzp_test_NNbwJ9tmM0fbxj',
  //     'amount': (totalAmount * 100),
  //     'name': 'Ramesh M S',
  //     'description': 'E - Ration Payment portal',
  //     'prefill': {'contact': '9344768931', 'email': 'msramesh2k1@gmail.com'},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };

  //   try {
  //     _razorpay!.open(options);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

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
                            fontSize: 13,
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
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ShipmentPage()));

                                   
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 106,
                                    color: Colors.black,
                                    child: Center(
                                      child: Text(
                                        "PLACE ORDER",
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 12,
                                              letterSpacing: 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                  ],
                ),
              ),
              SizedBox(height: 0,),
              Padding(
                padding: const EdgeInsets.only(left:30.0,bottom: 5),
                child: Row(
                  children: [
                    Container(
                         
                            height: 130,
                            width:   MediaQuery.of(context).size.width - 51,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.grey[50]),
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width - 53,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                     Spacer(),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "Order Summary",
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
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
                                              "Price",
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
                                              "₹ " + totalAmount.toString(),
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

                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 20,
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(5.0),
                                      //       child: Text(
                                      //         "Shipping",
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
                                      //         "₹ " + totalAmount.toString(),
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
                                      // ),

                                      
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 0.5,
                                          width: 478,
                                          color: Colors.black,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "Total",
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              "₹ " + totalAmount.toString(),
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

                                   
                         
                                      
                                      SizedBox(
                                        height: 0,
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
                  padding: const EdgeInsets.only(left:20.0,top: 0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                             height: MediaQuery.of(context).size.height - 305,
                            
                    
                            width: MediaQuery.of(context).size.width - 20,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("users")
                                    //
                                    //MRANDMRS.sharedprefs!.getString("uid")
                                    .doc(MRANDMRS.sharedprefs!.getString("uid"))
                                    .collection("cart")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(child: CircularProgressIndicator());
                                  } else {
                                    return ListView.builder(
                                        
              
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailProductScreen(
                                                              queryDocumentSnapshot:
                                                                  snapshot.data!
                                                                          .docs[
                                                                      index])));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  // color: Color.fromRGBO(
              
                                                  //     230, 224, 215, 1),
              
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              top: 15,
                                                              bottom: 15),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(0),
                                                            color:
                                                                Colors.grey[200],
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    snapshot.data!
                                                                                .docs[
                                                                            index]
                                                                        [
                                                                        'mainimage']),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      width: 90,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 16,
                                                          ),
              
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]['name']
                                                                .toString(),
                                                            style:
                                                                GoogleFonts.nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 13,
                                                                  letterSpacing: 1),
                                                            ),
                                                          ),
              
                                                          SizedBox(
                                                            height: 4,
                                                          ),
              
                                                          Text(
                                                            snapshot.data!
                                                                        .docs[index]
                                                                    ['length'] +
                                                                " * " +
                                                                snapshot.data!
                                                                        .docs[index]
                                                                    ['width'] +
                                                                "  CM",
                                                            style:
                                                                GoogleFonts.nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 12,
                                                                  letterSpacing: 0),
                                                            ),
                                                          ),
              
                                                          SizedBox(
                                                            height: 4,
                                                          ),
              
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Center(
                                                                  child: Text(
                                                                    "QUANTITY : ",
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      textStyle: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              10,
                                                                          letterSpacing:
                                                                              1),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                    child: Center(
                                                                      child: Text(
                                                                        snapshot
                                                                            .data!
                                                                            .docs[
                                                                                index]
                                                                                [
                                                                                'quanity']
                                                                            .toString(),
                                                                        style:
                                                                            GoogleFonts
                                                                                .lato(
                                                                          textStyle: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .w900,
                                                                              color: Colors
                                                                                  .black,
                                                                              fontSize:
                                                                                  12,
                                                                              letterSpacing:
                                                                                  1),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                                .grey[
                                                                            300],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                2)),
                                                                    height: 20,
                                                                    width: 20),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                ],
                                                            ),
                                                            height: 30,
                                                            width: 150,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                          ),
              
                                                        ],
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 10.0,
                                                                  top: 0),
                                                          child: Text(
                                                            "₹ " +
                                                                snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                        ['oprice']
                                                                    .toString(),
                                                            style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 15,
                                                                  letterSpacing: 0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                }),
                          ),
                        ],
                      ),
                    
                     
                    ],
                    // crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
               
            ],
          ),
        ),tab: Container(
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
                            fontSize: 13,
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
                                padding: const EdgeInsets.all(20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ShipmentPage()));

                                   
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 140,
                                    color: Colors.black,
                                    child: Center(
                                      child: Text(
                                        "PLACE ORDER",
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
              SizedBox(height: 0,),
              Padding(
                padding: const EdgeInsets.only(left:30.0,bottom: 5),
                child: Row(
                  children: [
                    Container(
                         
                            height: 130,
                            width: 480,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                color: Colors.grey[50]),
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 478,
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
                                              "Order Summary",
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black54,
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
                                              "Price",
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
                                              "₹ " + totalAmount.toString(),
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

                                      // Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 20,
                                      //     ),
                                      //     Padding(
                                      //       padding: const EdgeInsets.all(5.0),
                                      //       child: Text(
                                      //         "Shipping",
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
                                      //         "₹ " + totalAmount.toString(),
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
                                      // ),

                                      
                                      Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Container(
                                          height: 0.5,
                                          width: 478,
                                          color: Colors.black,
                                        ),
                                      ),

                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "Total",
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
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
                                              "₹ " + totalAmount.toString(),
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
                  padding: const EdgeInsets.only(left:20.0,top: 5),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height - 310,
                            
                    
                            width: 500,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(MRANDMRS.sharedprefs!.getString("uid"))
                                    .collection("cart")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(child: CircularProgressIndicator());
                                  } else {
                                    return ListView.builder(
                                        
              
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailProductScreen(
                                                              queryDocumentSnapshot:
                                                                  snapshot.data!
                                                                          .docs[
                                                                      index])));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                height: 120,
                                                decoration: BoxDecoration(
                                                  // color: Color.fromRGBO(
              
                                                  //     230, 224, 215, 1),
              
                                                  border: Border.all(
                                                      color: Colors.black12),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15.0,
                                                              top: 15,
                                                              bottom: 15),
                                                      child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(0),
                                                            color:
                                                                Colors.grey[200],
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    snapshot.data!
                                                                                .docs[
                                                                            index]
                                                                        [
                                                                        'mainimage']),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      width: 210,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 16,
                                                          ),
              
                                                          Text(
                                                            snapshot.data!
                                                                .docs[index]['name']
                                                                .toString(),
                                                            style:
                                                                GoogleFonts.nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 13,
                                                                  letterSpacing: 1),
                                                            ),
                                                          ),
              
                                                          SizedBox(
                                                            height: 4,
                                                          ),
              
                                                          Text(
                                                            snapshot.data!
                                                                        .docs[index]
                                                                    ['length'] +
                                                                " * " +
                                                                snapshot.data!
                                                                        .docs[index]
                                                                    ['width'] +
                                                                "  CM",
                                                            style:
                                                                GoogleFonts.nunitoSans(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 12,
                                                                  letterSpacing: 0),
                                                            ),
                                                          ),
              
                                                          SizedBox(
                                                            height: 4,
                                                          ),
              
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Center(
                                                                  child: Text(
                                                                    "QUANTITY : ",
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      textStyle: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w700,
                                                                          color: Colors
                                                                              .black54,
                                                                          fontSize:
                                                                              10,
                                                                          letterSpacing:
                                                                              1),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                    child: Center(
                                                                      child: Text(
                                                                        snapshot
                                                                            .data!
                                                                            .docs[
                                                                                index]
                                                                                [
                                                                                'quanity']
                                                                            .toString(),
                                                                        style:
                                                                            GoogleFonts
                                                                                .lato(
                                                                          textStyle: TextStyle(
                                                                              fontWeight: FontWeight
                                                                                  .w900,
                                                                              color: Colors
                                                                                  .black,
                                                                              fontSize:
                                                                                  12,
                                                                              letterSpacing:
                                                                                  1),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                                .grey[
                                                                            300],
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                2)),
                                                                    height: 20,
                                                                    width: 20),
                                                                SizedBox(
                                                                  width: 8,
                                                                ),
                                                                ],
                                                            ),
                                                            height: 30,
                                                            width: 150,
                                                            decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                          ),
              
                                                        ],
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 10.0,
                                                                  top: 0),
                                                          child: Text(
                                                            "₹ " +
                                                                snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                        ['oprice']
                                                                    .toString(),
                                                            style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      Colors.black,
                                                                  fontSize: 15,
                                                                  letterSpacing: 0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 30,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  }
                                }),
                          ),
                        ],
                      ),
                    
                     
                    ],
                    // crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
               
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
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 3),
                      ),
                    ),
                    Text(
                      "   >   ",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 13,
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
                            fontSize: 13,
                            letterSpacing: 0),
                      ),
                    ),
                    Text(
                      "PAYMENT",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 13,
                            letterSpacing: 2),
                      ),
                    ),
                  ],
                ),
              ),



              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width /3.5,
                  
                      width: 500,
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(MRANDMRS.sharedprefs!.getString("uid"))
                              .collection("cart")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(
                                  

                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailProductScreen(
                                                        queryDocumentSnapshot:
                                                            snapshot.data!
                                                                    .docs[
                                                                index])));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 120,
                                          decoration: BoxDecoration(
                                            // color: Color.fromRGBO(

                                            //     230, 224, 215, 1),

                                            border: Border.all(
                                                color: Colors.black12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(
                                                        left: 15.0,
                                                        top: 15,
                                                        bottom: 15),
                                                child: Container(
                                                  height: 100,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(0),
                                                      color:
                                                          Colors.grey[200],
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  [
                                                                  'mainimage']),
                                                          fit: BoxFit
                                                              .cover)),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 210,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    SizedBox(
                                                      height: 16,
                                                    ),

                                                    Text(
                                                      snapshot.data!
                                                          .docs[index]['name']
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                            color:
                                                                Colors.black,
                                                            fontSize: 13,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 4,
                                                    ),

                                                    Text(
                                                      snapshot.data!
                                                                  .docs[index]
                                                              ['length'] +
                                                          " * " +
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['width'] +
                                                          "  CM",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                            color:
                                                                Colors.black,
                                                            fontSize: 12,
                                                            letterSpacing: 0),
                                                      ),
                                                    ),

                                                    SizedBox(
                                                      height: 4,
                                                    ),

                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              "QUANTITY : ",
                                                              style:
                                                                  GoogleFonts
                                                                      .lato(
                                                                textStyle: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: Colors
                                                                        .black54,
                                                                    fontSize:
                                                                        10,
                                                                    letterSpacing:
                                                                        1),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                              child: Center(
                                                                child: Text(
                                                                  snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                          [
                                                                          'quanity']
                                                                      .toString(),
                                                                  style:
                                                                      GoogleFonts
                                                                          .lato(
                                                                    textStyle: TextStyle(
                                                                        fontWeight: FontWeight
                                                                            .w900,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12,
                                                                        letterSpacing:
                                                                            1),
                                                                  ),
                                                                ),
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                          .grey[
                                                                      300],
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          2)),
                                                              height: 20,
                                                              width: 20),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          ],
                                                      ),
                                                      height: 30,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5)),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              // Spacer(),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0,
                                                            top: 0),
                                                    child: Text(
                                                      "₹ " +
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                                  ['oprice']
                                                              .toString(),
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                            color:
                                                                Colors.black,
                                                            fontSize: 15,
                                                            letterSpacing: 0),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 30,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                   
                      height: MediaQuery.of(context).size.width /4,
                      width: 250,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          color: Colors.grey[50]),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Order Summary",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        fontSize: 20,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Price",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 14,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "₹ " + totalAmount.toString(),
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),

                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: 20,
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text(
                          //         "Shipping",
                          //         style: GoogleFonts.nunitoSans(
                          //           textStyle: TextStyle(
                          //               fontWeight: FontWeight.normal,
                          //               color: Colors.black,
                          //               fontSize: 14,
                          //               letterSpacing: 0),
                          //         ),
                          //       ),
                          //     ),
                          //     Spacer(),
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text(
                          //         "₹ " + totalAmount.toString(),
                          //         style: GoogleFonts.nunitoSans(
                          //           textStyle: TextStyle(
                          //               fontWeight: FontWeight.bold,
                          //               color: Colors.black,
                          //               fontSize: 14,
                          //               letterSpacing: 0),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 20,
                          //     ),
                          //   ],
                          // ),

                          
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 0.5,
                              width: 300,
                              color: Colors.black,
                            ),
                          ),

                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Total",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "₹ " + totalAmount.toString(),
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),

                       
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () {
                                

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ShipmentPage()));

                               
                              },
                              child: Container(
                                height: 35,
                                width: 300,
                                color: Colors.black,
                                child: Center(
                                  child: Text(
                                    "PLACE ORDER",
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
                            height: 5,
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
      ),
    );
  }
}
