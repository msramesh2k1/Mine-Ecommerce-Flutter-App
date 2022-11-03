import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mine/Orders.dart';
import 'package:mine/Widgets/razor/razorpay_web.dart';
import 'package:mine/getcontrolleradddress.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/users/views/HomePage.dart';

// import '../../Widgets/razor/src/payments_web.dart';
// import '../../Widgets/razor/src/rzp_models.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

class DummyPay extends StatelessWidget {
  final num totalamount;

   DummyPay({Key? key, required this.totalamount}) : super(key: key);

     final store =   Get.find<AddressChangerController>();
                                      

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GetBuilder<AddressChangerController>(
        builder: ((controller) {
          return           RazorpayWeb(
            
          rzpKey: "rzp_test_gTTQvwX8dAKWtz", // Enter Your Razorpay Key Here
          rzpSecret: "93qZc1a8BiCmV46rOIPusc4i", // Enter Your Razorpay Secret Here
          options: RzpOptions(
            amount: totalamount.toDouble() * 100,
            // generateOrderId: true,
            // corsUrl: kCorsUrl,
            name: "Mr & Mrs Design Wood Works",
            description: "",
            image: "https://firebasestorage.googleapis.com/v0/b/mr-and-mrs-93502.appspot.com/o/Screenshot%202022-05-27%20150739.png?alt=media&token=51371055-03e6-46f6-88a2-c2d365a02a8f",
            prefill:  PrefillData(
              contact: MRANDMRS.sharedprefs!.getString('phno').toString(),
              name: MRANDMRS.sharedprefs!.getString('name').toString(),
              email: MRANDMRS.sharedprefs!.getString("email").toString(),
             
            ),
            colorhex: "#0000FF",
          ),
          onPaymentSuccess: (String paymentId) {
            print("Payment Success");

            print(paymentId);
           FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((value) => value.docs.forEach((element) {

         var now = DateTime.now();

 
              FirebaseFirestore.instance
                  .collection("orders")
                  .doc(MRANDMRS.sharedprefs!.getString("uid"))
                  .collection("items")
                  .doc(paymentId.toString())
                  .set({
                "id": paymentId.toString(),
                "status": "order Placed",
                "address": store.addressid.toString(),
                "payment": "PAID",
                "time" :  DateFormat('yyyy-MM-dd hh:mm:ss').format(now),
                "date" : DateFormat.yMMMMd().format(now) });


   FirebaseFirestore.instance
                  .collection("adminorders")
              
                  .doc(paymentId.toString() + element.data()['id'])
               
                  .set({

                     "payid": paymentId.toString(),
                "ostatus": "order Placed",
                "oaddress": store.addressid.toString(),
                "opayment": "PAID",
                "otime" :  DateFormat('yyyy-MM-dd hh:mm:ss').format(now),
                "odate" : DateFormat.yMMMMd().format(now),
                "height": element.data()['height'],
                'width': element.data()['width'],
                "depth": element.data()['depth'],
                "weight": element.data()['weight'],
                "uid":MRANDMRS.sharedprefs!.getString("uid"),
                "warranty": element.data()['warranty'],
                "status": "orderPlaced, Yet to Deliver",
                "category": element.data()['category'],
                "name": element.data()["name"],
                "quanity": element.data()['quanity'],
                "wood": element.data()['wood'],
                "actualprice" : element.data()['actualprice'],
                "sgst" : element.data()['sgst'],
                "cgst" : element.data()['cgst'],
                "id": element.data()['id'],
                "username" :MRANDMRS.sharedprefs!.getString("name")
,

                'mainimage': element.data()['mainimage'],
                "Description": element.data()['Description'],
                'price': element.data()['price'],
                'oprice': element.data()['oprice'],
                "time" :DateTime.now().millisecondsSinceEpoch.toString(),

// ********************//
              });
                
              FirebaseFirestore.instance
                  .collection("orders")
                  .doc(MRANDMRS.sharedprefs!.getString("uid"))
                  .collection("items")
                  .doc(paymentId.toString())
                  .collection("items")
                  .doc(element.data()['id'])
                  .set({
                "height": element.data()['height'],
                'width': element.data()['width'],
                "depth": element.data()['depth'],
                "weight": element.data()['weight'],
                "uid":MRANDMRS.sharedprefs!.getString("uid"),
                "warranty": element.data()['warranty'],
                "status": "orderPlaced, Yet to Deliver",
                "category": element.data()['category'],
                "name": element.data()["name"],
                "quanity": element.data()['quanity'],
                "wood": element.data()['wood'],
                "actualprice" : element.data()['actualprice'],
                "sgst" : element.data()['sgst'],
                "cgst" : element.data()['cgst'],
                "id": element.data()['id'],

                'mainimage': element.data()['mainimage'],
                "Description": element.data()['Description'],
                'price': element.data()['price'],
                'oprice': element.data()['oprice']

// ********************//
              });


              FirebaseFirestore.instance
                  .collection("users")
                  .doc(MRANDMRS.sharedprefs!.getString("uid"))
                  .collection("cart")
                  .doc(element.data()['id'])
                  .delete();
            }));
    FirebaseFirestore.instance
        .collection("orders")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .set({
      // "addressid": id,
      // "amount": totalAmount,
//"orderBy":EcommerceApp.sharedPreferences!.getStringList(EcommerceApp.userCartList),
      //  "orderBy": MRANDMRS.sharedprefs!.getString("uid"),
// EcommerceApp.productID:EcommerceApp.sharedPreferences!.getStringList(EcommerceApp.userCartList),
      //"method": "Cash On Delievery",
      "time": DateTime.now().millisecondsSinceEpoch.toString(),
      "uid" : MRANDMRS.sharedprefs!.getString("uid")
      // "paid": true,
    }).then((value) => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => Orders())));

            log(paymentId);
          },
          onPaymentError: (String error) {
            print("Payment Error");
            // store.addressid.close();
            
          
             Get.to(HomeScreen());
          },
        );
          
        }
      )
       
      ),
    );
  }
}



// SingleChildScrollView(
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
//                                                 showDialog(
//                                                     context: context,
//                                                     builder:
//                                                         (BuildContext context) {
//                                                       return Dialog(
//                                                           shape:
//                                                               RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         4),
//                                                           ),
//                                                           elevation: 0,
//                                                           backgroundColor:
//                                                               Colors
//                                                                   .transparent,
//                                                           child: Container(
//                                                             height: 180,
//                                                             width: 400,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               shape: BoxShape
//                                                                   .rectangle,
//                                                               color: Colors
//                                                                   .grey[100],
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           4),
//                                                             ),
//                                                             child: Column(
//                                                               children: <
//                                                                   Widget>[
//                                                                 SizedBox(
//                                                                   height: 20,
//                                                                 ),
//                                                                 Text(
//                                                                   "Edit Info",
//                                                                   style: GoogleFonts
//                                                                       .nunitoSans(
//                                                                     textStyle: TextStyle(
//                                                                         fontWeight:
//                                                                             FontWeight
//                                                                                 .bold,
//                                                                         color: Colors
//                                                                             .black,
//                                                                         fontSize:
//                                                                             18,
//                                                                         letterSpacing:
//                                                                             0),
//                                                                   ),
//                                                                 ),
//                                                                 Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                               .all(
//                                                                           10.0),
//                                                                   child:
//                                                                       Container(
//                                                                     height: 50,
//                                                                     width: 300,
//                                                                     decoration: BoxDecoration(
//                                                                         color: Colors
//                                                                             .white,
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(4)),
//                                                                     child:
//                                                                         Padding(
//                                                                       padding: const EdgeInsets
//                                                                               .symmetric(
//                                                                           horizontal:
//                                                                               8.0),
//                                                                       child:
//                                                                           TextField(
//                                                                         textCapitalization:
//                                                                             TextCapitalization.sentences,
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.black),
//                                                                         controller:
//                                                                             namecontroller,
//                                                                         keyboardType:
//                                                                             TextInputType.name,
//                                                                         decoration:
//                                                                             InputDecoration(
//                                                                           border:
//                                                                               InputBorder.none,
//                                                                           labelText:
//                                                                               "Height",
//                                                                           labelStyle: TextStyle(
//                                                                               color: Colors.black38,
//                                                                               fontSize: 12,
//                                                                               letterSpacing: 2),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                     height: 10),
//                                                                 GestureDetector(
//                                                                   onTap: () {
//                                                                     setState(
//                                                                         () {
//                                                                       FirebaseFirestore
//                                                                           .instance
//                                                                           .collection(
//                                                                               "Products")
//                                                                           .doc(widget.queryDocumentSnapshot[
//                                                                               'id'])
//                                                                           .update({
//                                                                         "height": namecontroller
//                                                                             .text
//                                                                             .toString()
//                                                                       });
//                                                                       FirebaseFirestore
//                                                                           .instance
//                                                                           .collection(
//                                                                               "SearchProducts")
//                                                                           .doc(widget.queryDocumentSnapshot[
//                                                                               'id'])
//                                                                           .update({
//                                                                         "height": namecontroller
//                                                                             .text
//                                                                             .toString()
//                                                                       }).then((value) {
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                       });
//                                                                     });
//                                                                   },
//                                                                   child:
//                                                                       Container(
//                                                                           height:
//                                                                               30,
//                                                                           width:
//                                                                               80,
//                                                                           child:
//                                                                               Center(
//                                                                             child:
//                                                                                 Text(
//                                                                               "update",
//                                                                               style: GoogleFonts.nunitoSans(
//                                                                                 textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11, letterSpacing: 0),
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           decoration: BoxDecoration(
//                                                                               color: Colors.black,
//                                                                               borderRadius: BorderRadius.circular(4))),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ));
//                                                     });
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
//                                                 showDialog(
//                                                     context: context,
//                                                     builder:
//                                                         (BuildContext context) {
//                                                       return Dialog(
//                                                           shape:
//                                                               RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         4),
//                                                           ),
//                                                           elevation: 0,
//                                                           backgroundColor:
//                                                               Colors
//                                                                   .transparent,
//                                                           child: Container(
//                                                             height: 180,
//                                                             width: 400,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               shape: BoxShape
//                                                                   .rectangle,
//                                                               color: Colors
//                                                                   .grey[100],
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           4),
//                                                             ),
//                                                             child: Column(
//                                                               children: <
//                                                                   Widget>[
//                                                                 SizedBox(
//                                                                   height: 20,
//                                                                 ),
//                                                                 Text(
//                                                                   "Edit Info",
//                                                                   style: GoogleFonts
//                                                                       .nunitoSans(
//                                                                     textStyle: TextStyle(
//                                                                         fontWeight:
//                                                                             FontWeight
//                                                                                 .bold,
//                                                                         color: Colors
//                                                                             .black,
//                                                                         fontSize:
//                                                                             18,
//                                                                         letterSpacing:
//                                                                             0),
//                                                                   ),
//                                                                 ),
//                                                                 Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                               .all(
//                                                                           10.0),
//                                                                   child:
//                                                                       Container(
//                                                                     height: 50,
//                                                                     width: 300,
//                                                                     decoration: BoxDecoration(
//                                                                         color: Colors
//                                                                             .white,
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(4)),
//                                                                     child:
//                                                                         Padding(
//                                                                       padding: const EdgeInsets
//                                                                               .symmetric(
//                                                                           horizontal:
//                                                                               8.0),
//                                                                       child:
//                                                                           TextField(
//                                                                         textCapitalization:
//                                                                             TextCapitalization.sentences,
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.black),
//                                                                         controller:
//                                                                             namecontroller,
//                                                                         keyboardType:
//                                                                             TextInputType.name,
//                                                                         decoration:
//                                                                             InputDecoration(
//                                                                           border:
//                                                                               InputBorder.none,
//                                                                           labelText:
//                                                                               "Width",
//                                                                           labelStyle: TextStyle(
//                                                                               color: Colors.black38,
//                                                                               fontSize: 12,
//                                                                               letterSpacing: 2),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                     height: 10),
//                                                                 GestureDetector(
//                                                                   onTap: () {
//                                                                     setState(
//                                                                         () {
//                                                                       FirebaseFirestore
//                                                                           .instance
//                                                                           .collection(
//                                                                               "Products")
//                                                                           .doc(widget.queryDocumentSnapshot[
//                                                                               'id'])
//                                                                           .update({
//                                                                         "width": namecontroller
//                                                                             .text
//                                                                             .toString()
//                                                                       });
//                                                                       FirebaseFirestore
//                                                                           .instance
//                                                                           .collection(
//                                                                               "SearchProducts")
//                                                                           .doc(widget.queryDocumentSnapshot[
//                                                                               'id'])
//                                                                           .update({
//                                                                         "width": namecontroller
//                                                                             .text
//                                                                             .toString()
//                                                                       }).then((value) {
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                         //   Phoenix.rebirth(context);
//                                                                         // Navigator.pushReplacement(
//                                                                         //     context,
//                                                                         //     MaterialPageRoute(
//                                                                         //         builder:
//                                                                         //             (c) {
//                                                                         //   return Homer();
//                                                                         // }));
//                                                                       });
//                                                                     });
//                                                                   },
//                                                                   child:
//                                                                       Container(
//                                                                           height:
//                                                                               30,
//                                                                           width:
//                                                                               80,
//                                                                           child:
//                                                                               Center(
//                                                                             child:
//                                                                                 Text(
//                                                                               "update",
//                                                                               style: GoogleFonts.nunitoSans(
//                                                                                 textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11, letterSpacing: 0),
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           decoration: BoxDecoration(
//                                                                               color: Colors.black,
//                                                                               borderRadius: BorderRadius.circular(4))),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ));
//                                                     });
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
//                                                 showDialog(
//                                                     context: context,
//                                                     builder:
//                                                         (BuildContext context) {
//                                                       return Dialog(
//                                                           shape:
//                                                               RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         4),
//                                                           ),
//                                                           elevation: 0,
//                                                           backgroundColor:
//                                                               Colors
//                                                                   .transparent,
//                                                           child: Container(
//                                                             height: 180,
//                                                             width: 400,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               shape: BoxShape
//                                                                   .rectangle,
//                                                               color: Colors
//                                                                   .grey[100],
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           4),
//                                                             ),
//                                                             child: Column(
//                                                               children: <
//                                                                   Widget>[
//                                                                 SizedBox(
//                                                                   height: 20,
//                                                                 ),
//                                                                 Text(
//                                                                   "EDIT INFO",
//                                                                   style: GoogleFonts
//                                                                       .nunitoSans(
//                                                                     textStyle: TextStyle(
//                                                                         fontWeight:
//                                                                             FontWeight
//                                                                                 .bold,
//                                                                         color: Colors
//                                                                             .black,
//                                                                         fontSize:
//                                                                             18,
//                                                                         letterSpacing:
//                                                                             1),
//                                                                   ),
//                                                                 ),
//                                                                 Padding(
//                                                                   padding:
//                                                                       const EdgeInsets
//                                                                               .all(
//                                                                           10.0),
//                                                                   child:
//                                                                       Container(
//                                                                     height: 50,
//                                                                     width: 300,
//                                                                     decoration: BoxDecoration(
//                                                                         color: Colors
//                                                                             .white,
//                                                                         borderRadius:
//                                                                             BorderRadius.circular(4)),
//                                                                     child:
//                                                                         Padding(
//                                                                       padding: const EdgeInsets
//                                                                               .symmetric(
//                                                                           horizontal:
//                                                                               8.0),
//                                                                       child:
//                                                                           TextField(
//                                                                         textCapitalization:
//                                                                             TextCapitalization.sentences,
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.black),
//                                                                         controller:
//                                                                             namecontroller,
//                                                                         keyboardType:
//                                                                             TextInputType.name,
//                                                                         decoration:
//                                                                             InputDecoration(
//                                                                           border:
//                                                                               InputBorder.none,
//                                                                           labelText:
//                                                                               "Lenght",
//                                                                           labelStyle: TextStyle(
//                                                                               color: Colors.black38,
//                                                                               fontSize: 12,
//                                                                               letterSpacing: 2),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 10,
//                                                                 ),
//                                                                 GestureDetector(
//                                                                   onTap: () {
//                                                                     setState(
//                                                                         () {
//                                                                       FirebaseFirestore
//                                                                           .instance
//                                                                           .collection(
//                                                                               "Products")
//                                                                           .doc(widget.queryDocumentSnapshot[
//                                                                               'id'])
//                                                                           .update({
//                                                                         "lenght": namecontroller
//                                                                             .text
//                                                                             .toString()
//                                                                       });
//                                                                       FirebaseFirestore
//                                                                           .instance
//                                                                           .collection(
//                                                                               "SearchProducts")
//                                                                           .doc(widget.queryDocumentSnapshot[
//                                                                               'id'])
//                                                                           .update({
//                                                                         "lenght": namecontroller
//                                                                             .text
//                                                                             .toString()
//                                                                       }).then((value) {
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                         Navigator.pop(
//                                                                             context);
//                                                                       });
//                                                                     });
//                                                                   },
//                                                                   child:
//                                                                       Container(
//                                                                           height:
//                                                                               30,
//                                                                           width:
//                                                                               80,
//                                                                           child:
//                                                                               Center(
//                                                                             child:
//                                                                                 Text(
//                                                                               "update",
//                                                                               style: GoogleFonts.nunitoSans(
//                                                                                 textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11, letterSpacing: 0),
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           decoration: BoxDecoration(
//                                                                               color: Colors.black,
//                                                                               borderRadius: BorderRadius.circular(4))),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ));
//                                                     });
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
//                                                   showDialog(
//                                                       context: context,
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return Dialog(
//                                                             shape:
//                                                                 RoundedRectangleBorder(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           4),
//                                                             ),
//                                                             elevation: 0,
//                                                             backgroundColor:
//                                                                 Colors
//                                                                     .transparent,
//                                                             child: Container(
//                                                               height: 180,
//                                                               width: 400,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 shape: BoxShape
//                                                                     .rectangle,
//                                                                 color: Colors
//                                                                     .grey[100],
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             4),
//                                                               ),
//                                                               child: Column(
//                                                                 children: <
//                                                                     Widget>[
//                                                                   SizedBox(
//                                                                     height: 20,
//                                                                   ),
//                                                                   Padding(
//                                                                     padding: const EdgeInsets
//                                                                             .all(
//                                                                         10.0),
//                                                                     child:
//                                                                         Container(
//                                                                       height:
//                                                                           50,
//                                                                       width:
//                                                                           300,
//                                                                       decoration: BoxDecoration(
//                                                                           color: Colors
//                                                                               .white,
//                                                                           borderRadius:
//                                                                               BorderRadius.circular(4)),
//                                                                       child:
//                                                                           Padding(
//                                                                         padding:
//                                                                             const EdgeInsets.symmetric(horizontal: 8.0),
//                                                                         child:
//                                                                             TextField(
//                                                                           textCapitalization:
//                                                                               TextCapitalization.sentences,
//                                                                           style:
//                                                                               TextStyle(color: Colors.black),
//                                                                           controller:
//                                                                               namecontroller,
//                                                                           keyboardType:
//                                                                               TextInputType.name,
//                                                                           decoration:
//                                                                               InputDecoration(
//                                                                             border:
//                                                                                 InputBorder.none,
//                                                                             labelText:
//                                                                                 "Weight",
//                                                                             labelStyle: TextStyle(
//                                                                                 color: Colors.black38,
//                                                                                 fontSize: 12,
//                                                                                 letterSpacing: 0),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 10,
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ));
//                                                       });
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
//     )