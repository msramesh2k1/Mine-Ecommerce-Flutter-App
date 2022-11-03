
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/users/views/Helper.dart';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../HomeScreenWidgets/HomeWidgets.dart';
import '../../Widgets/Custom_Widgets.dart';
import '../../helpers/mobilewidgets.dart';
import '../../helpers/responsive_widget.dart';
import 'loginpage.dart';

class DetailProductScreens extends StatefulWidget {
  final DocumentSnapshot queryDocumentSnapshot;
  const DetailProductScreens({Key? key, required this.queryDocumentSnapshot})
      : super(key: key);

  @override
  State<DetailProductScreens> createState() => _DetailProductScreensState();
}

class _DetailProductScreensState extends State<DetailProductScreens> {
  

  
  List<String> reqwoodlist = [];
  List<String> expense = [];
  String? reqwoodtype;
  String? expensetype;
  int? imageno;
  int? fileno;
  int? videono;
  int? reqno;
  int? expno;
  String? imgurl;
  String woodtype = " ";
  int quanityvalue = 1;
  int woodhas = 0;
  List _reqexpense = [];
  int materials = 0;
  int others = 0;
  int salesprice = 0;
  int link = 0;
  int filelink = 0;
  String? fileurl;
  String? imagesurl;
  List _woodlist = [];
  ScrollController? _controller;
  ScrollController _imagecontroller = ScrollController();
  // TextEditingController tdimensioncontroller = new TextEditingController();
  // TextEditingController hdimensioncontroller = new TextEditingController();
  // TextEditingController wdimensioncontroller = new TextEditingController();
  // TextEditingController ddimensioncontroller = new TextEditingController();
  // TextEditingController serialcontroller = new TextEditingController();
  // TextEditingController expensecontroller = new TextEditingController();
  // TextEditingController itemcontroller = new TextEditingController();
  // TextEditingController commentscontroller = new TextEditingController();
  // TextEditingController qnocontroller = new TextEditingController();
  // TextEditingController litemdimensioncontroller = new TextEditingController();
  // TextEditingController witemdimensioncontroller = new TextEditingController();
  // TextEditingController categorycontroller = new TextEditingController();
  // TextEditingController productidcontroller = new TextEditingController();
  // TextEditingController ratecontroller = new TextEditingController();

  @override
  void initState() {
    // print(widget.queryDocumentSnapshot['id']);
    FirebaseFirestore.instance
        .collection("SearchProducts")
        .doc(widget.queryDocumentSnapshot['id'])
        .collection("Images")
        .get()
        .then((imagecount) {
      setState(() {
        imageno = imagecount.size;
        print("IMAGE" + imagecount.size.toString());
      });
    });
    // FirebaseFirestore.instance
    //     .collection("SearchProducts")
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection("files")
    //     .get()
    //     .then((imagecount) {
    //   setState(() {
    //     fileno = imagecount.size;
    //     print("IMAGE" + imagecount.size.toString());
    //   });
    // });
    // FirebaseFirestore.instance
    //     .collection("SearchProducts")
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection("materials")
    //     .get()
    //     .then((imagecount) {
    //   setState(() {
    //     reqno = imagecount.size;
    //     print("IMAGE" + imagecount.size.toString());
    //   });
    // });
    // FirebaseFirestore.instance
    //     .collection("SearchProducts")
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection("others")
    //     .get()
    //     .then((imagecount) {
    //   setState(() {
    //     expno = imagecount.size;
    //   });
    // });
    // FirebaseFirestore.instance
    //     .collection("SearchProducts")
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection("links")
    //     .get()
    //     .then((imagecount) {
    //   setState(() {
    //     videono = imagecount.size + 1;
    //   });
    // });
    FirebaseFirestore.instance
        .collection("SearchProducts")
        .doc(widget.queryDocumentSnapshot['id'])
        .collection("WoodList")
        .get()
        .then((value) {
      value.docs.forEach((element) {
        setState(() {
          reqwoodlist.add(element.data()['name']);
          print(reqwoodlist);
        });
      });
    });
    // FirebaseFirestore.instance.collection("Expense").get().then((value) {
    //   value.docs.forEach((element) {
    //     setState(() {
    //       expense.add(element.data()['name']);
    //     });
    //   });
    // });

    // FirebaseFirestore.instance
    //     .collection("SearchProducts")
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection("materials")
    //     .get()
    //     .then((value) {
    //   if (value.docs.length == 0) {
    //     MRANDMRS.sharedprefs!
    //         .setDouble("total+$widget.queryDocumentSnapshot['id']", 0);
    //     print("Lenght of Others is Zero");
    //   } else {
    //     value.docs.forEach((element) {
    //       setState(() {
    //         _reqexpense.add((((element.data()['tvalue'] *
    //                     element.data()['wvalue'] *
    //                     element.data()['lvalue']) /
    //                 1728 *
    //                 element.data()['quantity']) *
    //             element.data()['rate']));
    //       });
    //     });
    //     _reqexpense.forEach((value) {
    //       reqexpense = reqexpense + value;
    //       setState(() {
    //         MRANDMRS.sharedprefs!.setDouble(
    //             "total+$widget.queryDocumentSnapshot['id']", reqexpense);
    //       });
    //     });
    //   }
    // });

    //     value.docs.forEach((element) {
    //       setState(() {
    //         ///(((((dex]['quantity']))) * snapshot.data.docs[index]['rate']).toStringAsFixed(2)
    //         _reqexpense.add((((element.data()['tvalue'] *
    //                     element.data()['wvalue'] *
    //                     element.data()['lvalue']) /
    //                 1728 *
    //                 element.data()['quantity']) *
    //             element.data()['rate']));
    //         print(_reqexpense);
    //       });
    //     });

    // }).then((value) {
    //   _reqexpense.forEach((value) {
    //     reqexpense = reqexpense + value;
    //     setState(() {
    //       MrandMrs.sharedprefs.setDouble(
    //           "total+$widget.queryDocumentSnapshot['id']", reqexpense);
    //     });

    //   });
    // }).then((value) =>
    //        print("ije" +
    //             MrandMrs.sharedprefs
    //                 .getDouble("total+$widget.queryDocumentSnapshot['id']")
    //                 .toStringAsFixed(2)));

    // FirebaseFirestore.instance
    //     .collection("SearchProducts")
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection("others")
    //     .get()
    //     .then((value) {
    //   if (value.docs.length == 0) {
    //     MRANDMRS.sharedprefs!
    //         .setDouble("subtotal+$widget.queryDocumentSnapshot['id']", 0);
    //     print("Lenght of Others is Zero");
    //   } else {
    //     value.docs.forEach((element) {
    //       otherexpense = otherexpense + element.data()['rate'];
    //       MRANDMRS.sharedprefs!.setDouble(
    //           "subtotal+$widget.queryDocumentSnapshot['id']",
    //           otherexpense.toDouble());
    //       print("No Is Has Minimum one Items");
    //     });
    //   }
    // });

    FirebaseFirestore.instance
        .collection('SearchProducts')
        .doc(widget.queryDocumentSnapshot['id'])
        .collection('WoodList')
        .get()
        .then((value) {
      print("no" + value.size.toString());
      setState(() {
        woodhas = value.size.toInt();
      });
    });

    _reqexpense.forEach((element) {
      print("hi");
    });
    // FirebaseFirestore.instance
    //     .collection('SearchProducts')
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection('links')
    //     .get()
    //     .then((value) {
    //   print("no" + value.size.toString());
    //   setState(() {
    //     link = value.size.toInt();
    //   });
    // });
    // FirebaseFirestore.instance
    //     .collection('SearchProducts')
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection('files')
    //     .get()
    //     .then((value) {
    //   print("no" + value.size.toString());
    //   setState(() {
    //     filelink = value.size.toInt();
    //   });
    // });
    // FirebaseFirestore.instance
    //     .collection('SearchProducts')
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection('materials')
    //     .get()
    //     .then((value) {
    //   print("no" + value.size.toString());
    //   setState(() {
    //     materials = value.size.toInt();
    //   });
    // });
    // FirebaseFirestore.instance
    //     .collection('SearchProducts')
    //     .doc(widget.queryDocumentSnapshot['id'])
    //     .collection('others')
    //     .get()
    //     .then((value) {
    //   print("no" + value.size.toString());
    //   setState(() {
    //     others = value.size.toInt();
    //   });
    // });
    // MrandMrs.sharedprefs.setDouble(
    //     "finaltotal+$widget.queryDocumentSnapshot['id']",
    //     MrandMrs.sharedprefs
    //             .getDouble("total+$widget.queryDocumentSnapshot['id']") +
    //         MrandMrs.sharedprefs
    //             .getInt("subtotal+$widget.queryDocumentSnapshot['id']"));

    String _imgurl = widget.queryDocumentSnapshot["mainimage"];
    super.initState();
    setState(() {
      imgurl = _imgurl;
    });
  }

  TextEditingController namecontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveWidget(
          tab: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               
                //  TopNotifyBlackBox(),
                // MobileTitleWebBox(),
                DetailTitleWebBox(),
               Box(height: 20, width: 0),
                
              
                 Container(
                   width: MediaQuery.of(context).size.width,
                  //  height: 425,
                   child: Column(
                     children: [
                      SizedBox(width: 20,),
                     
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(imgurl.toString()),
                              fit: BoxFit.cover),
                          color: Colors.white,
                        ),
                        height: 400,
                        width: 400,
                      ),
                      SizedBox(
                        width: 80,
                      ),
                       Container(
                        width:MediaQuery.of(context).size.width,
                        height:80,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("SearchProducts")
                                .doc(widget.queryDocumentSnapshot["id"]
                                    .toString())
                                .collection("Images")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return Scrollbar(
                                  
                                  child: ListView.builder(
                                      controller: _imagecontroller,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: GestureDetector(
                                            onDoubleTap: () {
                                               launch(snapshot.data!.docs[index]
                                                  ['imgurl']);
                                            },
                                            
                                            onTap: () {
                                              setState(() {
                                                imgurl = snapshot.data!
                                                    .docs[index]['imgurl'];
                                                print(imgurl);
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: imgurl ==   snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['imgurl'] ? Colors.white : Colors.grey[200],
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['imgurl']),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              }
                            }),
                   
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white70,
                        ),
                      ),
                                          ],
                  ),
                ),
                Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              height: 400,
                              width: 500,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(

                                      children: [
                                         Text("SHOP  |  " +
                                          widget.queryDocumentSnapshot['category']  + " | ".toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 15,
                                                letterSpacing: 1.5),
                                          ),
                                        ),
                                        Text(
                                          widget.queryDocumentSnapshot['name']
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 1.5),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Box(height: 15, width: 0),
                                   widget.queryDocumentSnapshot['permium'] ? 
                                    Container(
                                      height:25,
                                      width : 80,
                                      color:Colors.grey[200],
                                      child:Center(
                                        child: Text(
                                           "PERMIUM",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                      ),

                                    ) : SizedBox(),
                                     Box(height: 10, width: 0),
                                    Text(
                                    
                                          widget.queryDocumentSnapshot['name']
                                              .toString().toLowerCase()
                                          ,
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 22,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                     Box(height: 10, width: 0),
                                    Row(
                                      children: [
                                        Text(
                                         "₹ ${((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice']} ( Incl Taxes )",                                                                                  
                                           style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 68, 45, 40),
                                                fontSize: 20,
                                                letterSpacing: 1.5),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                          Text(
                                      "MRP ₹ ${((widget.queryDocumentSnapshot['price']/ 100) * 18) + widget.queryDocumentSnapshot['price']}",                       
                                             
                                      style: GoogleFonts.nunitoSans(
                                        
                                        textStyle: const TextStyle(
                                          decoration : TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 95, 79, 75),
                                            fontSize: 15,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                      ],
                                    ),
                                    Box(height: 8, width: 0),
                                    Row(
                                      children: [
                                        Text("EXCLUDING GST : ₹ " + 
                                          widget.queryDocumentSnapshot['oprice'].toString(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13,
                                                height: 1.5,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("YOU SAVE : ₹ ${(((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price'])
                                         - (((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice'])} ( ${((((((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price'])
                                         - ((((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice']))) / (((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price']) * 100 )).round()} % )" ,
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13,
                                                height: 1.5,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                        
                                       
                                      ],
                                    ),

                                    // Box(height: 15, width: 0),
                                    // Container(
                                    //   height: 0.5,
                                    //   color: Colors.black,
                                    //   width: 300,
                                    // ),
                                    // //tod
                                    Box(height: 8, width: 0),
                                    Text(
                                      widget
                                          .queryDocumentSnapshot['Description']
                                          .toString(),
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 13,
                                            height: 1.5,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                    Box(height: 13, width: 0),
                                    Text(
                                      "Material    :    " +
                                          reqwoodlist
                                              .toString()
                                              .toLowerCase()
                                              .replaceAll(",", "  | ")
                                              .replaceAll("[", "")
                                              .replaceAll("]", ""),
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16,
                                            letterSpacing: 0),
                                      ),
                                    ),

                                    Box(height: 10, width: 0),

                                    Container(
                                      height: 60,
                                      // width: 100,
                                      child: StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection("SearchProducts")
                                              .doc(widget
                                                  .queryDocumentSnapshot["id"]
                                                  .toString())
                                              .collection("WoodList")
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return Center(
                                                child: CircularProgressIndicator()
                                              );
                                            } else {
                                              return Scrollbar(
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: snapshot
                                                        .data!.docs.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // setState(() {
                                                            //   woodtype = snapshot
                                                            //       .data.docs[index]['name'];
                                                            // });
                                                            print(woodtype);
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0)),
                                                            height: 50,
                                                            width: 50,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(snapshot.data!.docs[index]
                                                                              [
                                                                              'image']),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  height: 40,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              );
                                            }
                                          }),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    ),
                                    Container(
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "QUANTITY : ",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                              letterSpacing: 0),
                        ),
                      ),
                       IconButton(
                          onPressed: () {
                            setState(() {
                              if (quanityvalue >= 2) {
                                quanityvalue--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove_circle_outline)),
                     
                      Container(
                          child: Center(
                            child: Text(
                              quanityvalue.toString(),
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(2)),
                          height: 30,
                          width: 30),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              quanityvalue++;
                            });
                          },
                          icon: Icon(Icons.add_circle_outline)),
                      
                      
                    ],
                  )),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                        onTap: () {

                         MRANDMRS.sharedprefs!.getString('uid') == null ? Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())):


                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(MRANDMRS.sharedprefs!.getString("uid"))
                              .collection("cart")
                              .doc(widget.queryDocumentSnapshot["id"])
                              .set({
                            "Description":
                                widget.queryDocumentSnapshot["Description"],
                            // "price": widget.queryDocumentSnapshot["price"],
                            "oprice": widget.queryDocumentSnapshot["oprice"],
                            "category":
                                widget.queryDocumentSnapshot["category"],
                            "name": widget.queryDocumentSnapshot["name"],
                            "permium" : widget.queryDocumentSnapshot['permium'],
                            "id": widget.queryDocumentSnapshot["id"],
                            "mainimage":
                                widget.queryDocumentSnapshot["mainimage"],
                            "quanity": quanityvalue,
                            "price": widget.queryDocumentSnapshot["price"],
                            "wood": woodtype,
                             "permium" : widget.queryDocumentSnapshot['permium'],
                            'length': widget.queryDocumentSnapshot['lenght'],
                            'lenght': widget.queryDocumentSnapshot['lenght'],
                             "sgst" : (widget.queryDocumentSnapshot["oprice"]  / 100) * 9,
                                "cgst" : (widget.queryDocumentSnapshot["oprice"]  / 100) * 9,
                                "actualprice" : widget.queryDocumentSnapshot["oprice"] ,

                            "width": widget.queryDocumentSnapshot['width'],
                            "weight": widget.queryDocumentSnapshot['weight'],
                            'height': widget.queryDocumentSnapshot['height']
                          }).whenComplete(() {
                             final snackBar = SnackBar(
                               backgroundColor: Colors.brown[200],
                              //  margin: EdgeInsets.all(20),
                               width: 300,
                              // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                               
                               behavior: SnackBarBehavior.floating,

                               dismissDirection: DismissDirection.startToEnd,
                               
                               
                               content: Text('Item Added Successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          child: Center(
                            child: Text(
                              "ADD TO CART",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 13,
                                    letterSpacing: 4),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                                  ])))
,
               
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                      ),
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0,
                            ),
                            Text(
                              "PRODUCT DETAILS",
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: 0),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Table(
                                textDirection: TextDirection.ltr,
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                border: TableBorder.all(
                                    width: 0.5, color: lettercolor),
                                children: [
                                  TableRow(children: [
                                    Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "BRAND",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "MR AND MRS",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  "DIMENSIONS",
                                                  style:
                                                      GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: lettercolor,
                                                        fontSize: 12,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                
                                              },
                                              child: Text(
                                                " H " +
                                                    widget.queryDocumentSnapshot[
                                                        'height'],
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                               
                                                  
                                              },
                                              child: Text(
                                                " * W " +
                                                    widget.queryDocumentSnapshot[
                                                        'width'],
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                               
                                              },
                                              child: Text(
                                                " * L " +
                                                    widget.queryDocumentSnapshot[
                                                        'lenght'] +
                                                    " (In Inches)",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: GestureDetector(
                                                child: Text(
                                                  "WEIGHT",
                                                  style:
                                                      GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: lettercolor,
                                                        fontSize: 12,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  
                                                },
                                                child: Text(
                                                  widget.queryDocumentSnapshot[
                                                          'weight'] +
                                                      " kg",
                                                  style:
                                                      GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: lettercolor,
                                                        fontSize: 12,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                 
                                ],
                              ),
                            ),
   SizedBox(height: 10,),
        
         Text("This is a Made on order product it will be take 10 to 15 days to manufacture & 10 Days for delivery . For customization call 7540032123 ",
textAlign: TextAlign.center,style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 16,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

Text("Return & Exchanges are not accepted , But contact 7540032123 if you have problems with your order",
                         textAlign: TextAlign.center,                             style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 16,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

                                                    SizedBox(height:20),

        
                                                    
        
                           
                           
                          ],
                        ),

                           )),
                 
                //  MobileEndBox()
              ])])),
    ),
          mobile: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                //  TopNotifyBlackBox(),
                // MobileTitleWebBox(),
                DetailTitleWebBox(),
               Box(height: 20, width: 0),
                
              
                 Container(
                   width: MediaQuery.of(context).size.width,
                  //  height: 425,
                   child: Column(
                     children: [
                      SizedBox(width: 20,),
                     
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                              image: NetworkImage(imgurl.toString()),
                              fit: BoxFit.cover),
                          color: Colors.white,
                        ),
                        height: 400,
                        width: 400,
                      ),
                      SizedBox(
                        width: 80,
                      ),
                       Container(
                        width:MediaQuery.of(context).size.width,
                        height:80,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("SearchProducts")
                                .doc(widget.queryDocumentSnapshot["id"]
                                    .toString())
                                .collection("Images")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: CircularProgressIndicator());
                              } else {
                                return Scrollbar(
                                  
                                  child: ListView.builder(
                                      controller: _imagecontroller,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: GestureDetector(
                                            onDoubleTap: () {
                                               launch(snapshot.data!.docs[index]
                                                  ['imgurl']);
                                            },
                                            
                                            onTap: () {
                                              setState(() {
                                                imgurl = snapshot.data!
                                                    .docs[index]['imgurl'];
                                                print(imgurl);
                                              });
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: imgurl ==   snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['imgurl'] ? Colors.white : Colors.grey[200],
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['imgurl']),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                );
                              }
                            }),
                   
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white70,
                        ),
                      ),
                                          ],
                  ),
                ),
                Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              height: 400,
                              width: 500,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(

                                      children: [
                                         Text("SHOP  |  " +
                                          widget.queryDocumentSnapshot['category']  + " | ".toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 15,
                                                letterSpacing: 1.5),
                                          ),
                                        ),
                                        Text(
                                          widget.queryDocumentSnapshot['name']
                                              .toString()
                                              .toUpperCase(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 15,
                                                letterSpacing: 1.5),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Box(height: 15, width: 0),
                                   widget.queryDocumentSnapshot['permium'] ? 
                                    Container(
                                      height:25,
                                      width : 80,
                                      color:Colors.grey[200],
                                      child:Center(
                                        child: Text(
                                           "PERMIUM",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                      ),

                                    ) : SizedBox(),
                                     Box(height: 10, width: 0),
                                    Text(
                                    
                                          widget.queryDocumentSnapshot['name']
                                              .toString().toLowerCase()
                                          ,
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 22,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                     Box(height: 10, width: 0),
                                    Row(
                                      children: [
                                        Text(
                                         "₹ ${((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice']} ( Incl Taxes )",                                                                                  
                                            style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 68, 45, 40),
                                                fontSize: 20,
                                                letterSpacing: 1.5),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                          Text(
                                      "MRP ₹ ${((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price']}",                       
                                             
                                        style: GoogleFonts.nunitoSans(
                                        
                                        textStyle: const TextStyle(
                                          decoration : TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 95, 79, 75),
                                            fontSize: 15,
                                            letterSpacing: 1.5),
                                      ),
                                    ),
                                      ],
                                    ),
  Box(height: 8, width: 0),
                                    Row(
                                      children: [
                                       Text("EXCLUDING GST : ₹ " + 
                                          widget.queryDocumentSnapshot['oprice'].toString(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13,
                                                height: 1.5,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("YOU SAVE : ₹ ${(((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price'])
                                         - (((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice'])} ( ${((((((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price'])
                                         - ((((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice']))) / (((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price']) * 100 )).round()} % )" ,
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13,
                                                height: 1.5,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Box(height: 15, width: 0),
                                    // Container(
                                    //   height: 0.5,
                                    //   color: Colors.black,
                                    //   width: 300,
                                    // ),
                                    // //tod
                                    Box(height: 8, width: 0),
                                    Text(
                                      widget
                                          .queryDocumentSnapshot['Description']
                                          .toString(),
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black45,
                                            fontSize: 13,
                                            height: 1.5,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                    Box(height: 13, width: 0),
                                    Text(
                                      "Material    :    " +
                                          reqwoodlist
                                              .toString()
                                              .toLowerCase()
                                              .replaceAll(",", "  | ")
                                              .replaceAll("[", "")
                                              .replaceAll("]", ""),
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: 16,
                                            letterSpacing: 0),
                                      ),
                                    ),

                                    Box(height: 10, width: 0),

                                    Container(
                                      height: 60,
                                      // width: 100,
                                      child: StreamBuilder<QuerySnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection("SearchProducts")
                                              .doc(widget
                                                  .queryDocumentSnapshot["id"]
                                                  .toString())
                                              .collection("WoodList")
                                              .snapshots(),
                                          builder: (context, snapshot) {
                                            if (snapshot.data == null) {
                                              return Center(
                                                child: CircularProgressIndicator()
                                              );
                                            } else {
                                              return Scrollbar(
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: snapshot
                                                        .data!.docs.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            // setState(() {
                                                            //   woodtype = snapshot
                                                            //       .data.docs[index]['name'];
                                                            // });
                                                            print(woodtype);
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0)),
                                                            height: 50,
                                                            width: 50,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(snapshot.data!.docs[index]
                                                                              [
                                                                              'image']),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  height: 40,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              );
                                            }
                                          }),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                    ),
                                    Container(
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "QUANTITY : ",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                              letterSpacing: 0),
                        ),
                      ),
                     IconButton(
                          onPressed: () {
                            setState(() {
                              if (quanityvalue >= 2) {
                                quanityvalue--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove_circle_outline)),
                      Container(
                          child: Center(
                            child: Text(
                              quanityvalue.toString(),
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(2)),
                          height: 30,
                          width: 30),
                           IconButton(
                          onPressed: () {
                            setState(() {
                              quanityvalue++;
                            });
                          },
                          icon: Icon(Icons.add_circle_outline)),
                      
                      
                      
                    ],
                  )),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                ),
                SizedBox(height: 10,),
                GestureDetector(
                        onTap: () {

                         MRANDMRS.sharedprefs!.getString('uid') == null ? Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())):


                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(MRANDMRS.sharedprefs!.getString("uid"))
                              .collection("cart")
                              .doc(widget.queryDocumentSnapshot["id"])
                              .set({
                            "Description":
                                widget.queryDocumentSnapshot["Description"],
                            // "price": widget.queryDocumentSnapshot["price"],
                            "oprice": widget.queryDocumentSnapshot["oprice"],
                            "category":
                                widget.queryDocumentSnapshot["category"],
                            "name": widget.queryDocumentSnapshot["name"],
                            "permium" : widget.queryDocumentSnapshot['permium'],
                            "id": widget.queryDocumentSnapshot["id"],
                            "mainimage":
                                widget.queryDocumentSnapshot["mainimage"],
                            "quanity": quanityvalue,
                         
                             "price": widget.queryDocumentSnapshot["price"],
                            'length': widget.queryDocumentSnapshot['lenght'],
                            'lenght': widget.queryDocumentSnapshot['lenght'],
                             "sgst" : (widget.queryDocumentSnapshot["oprice"]  / 100) * 9,
                                "cgst" : (widget.queryDocumentSnapshot["oprice"]  / 100) * 9,
                                "actualprice" : widget.queryDocumentSnapshot["oprice"] ,

                            "width": widget.queryDocumentSnapshot['width'],
                            "weight": widget.queryDocumentSnapshot['weight'],
                            'height': widget.queryDocumentSnapshot['height']
                          }).whenComplete(() {
                             final snackBar = SnackBar(
                               backgroundColor: Colors.brown[200],
                              //  margin: EdgeInsets.all(20),
                               width: 300,
                              // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                               
                               behavior: SnackBarBehavior.floating,

                               dismissDirection: DismissDirection.startToEnd,
                               
                               
                               content: Text('Item Added Successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 200,
                          child: Center(
                            child: Text(
                              "ADD TO CART",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 13,
                                    letterSpacing: 4),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black,
                              border: Border.all(color: Colors.black)),
                        ),
                      ),
                                  ])))
,
               
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 0,
                      ),
                      child: Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 30,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0,
                            ),
                            Text(
                              "PRODUCT DETAILS",
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: 0),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Table(
                                textDirection: TextDirection.ltr,
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                border: TableBorder.all(
                                    width: 0.5, color: lettercolor),
                                children: [
                                  TableRow(children: [
                                    Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "BRAND",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "MR AND MRS",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Text(
                                                  "DIMENSIONS",
                                                  style:
                                                      GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: lettercolor,
                                                        fontSize: 12,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                
                                              },
                                              child: Text(
                                                " H " +
                                                    widget.queryDocumentSnapshot[
                                                        'height'],
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                               
                                                  
                                              },
                                              child: Text(
                                                " * W " +
                                                    widget.queryDocumentSnapshot[
                                                        'width'],
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                               
                                              },
                                              child: Text(
                                                " * L " +
                                                    widget.queryDocumentSnapshot[
                                                        'lenght'] +
                                                    " (Inch)",
                                                style: GoogleFonts.nunitoSans(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: lettercolor,
                                                      fontSize: 12,
                                                      letterSpacing: 1),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                  TableRow(children: [
                                    Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: GestureDetector(
                                                child: Text(
                                                  "WEIGHT",
                                                  style:
                                                      GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: lettercolor,
                                                        fontSize: 12,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: () {
                                                  
                                                },
                                                child: Text(
                                                  widget.queryDocumentSnapshot[
                                                          'weight'] +
                                                      " kg",
                                                  style:
                                                      GoogleFonts.nunitoSans(
                                                    textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: lettercolor,
                                                        fontSize: 12,
                                                        letterSpacing: 1),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                               
                                ],
                              ),
                            ),
  SizedBox(height: 10,),
        
         Text("This is a Made on order product it will be take 10 to 15 days to manufacture & 10 Days for delivery . For customization call 7540032123 ",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 14,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

Text("Return & Exchanges are not accepted , But contact 7540032123 if you have problems with your order",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 14,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

                                                    SizedBox(height:20),

        
                          ],
                        ),

                           )),
                 
                 MobileEndBox()
              ])])),
    ),
          desktop: SingleChildScrollView(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(children: [
                    // TopNotifyBlackBox(),
                    DetailTitleWebBox(),
                    Box(height: 20, width: 0),
              
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 500,
                      child: Row(
                        children: [
                              SizedBox(width: 20,),
                          Container(
                            width: 80,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection("SearchProducts")
                                    .doc(widget.queryDocumentSnapshot["id"]
                                        .toString())
                                    .collection("Images")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                 return !snapshot.hasData
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : 
                                   Scrollbar(
                                      child: ListView.builder(
                                          controller: _imagecontroller,
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: GestureDetector(
                                                onDoubleTap: () {},
                                                onLongPress: () {
                                                  launch(snapshot.data!
                                                      .docs[index]['imgurl']);
                                                },
                                                onTap: () {
                                                  setState(() {
                                                    imgurl = snapshot.data!
                                                        .docs[index]['imgurl'];
                                                    print(imgurl);
                                                  });
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: imgurl ==   snapshot.data!
                                                                          .docs[
                                                                      index]
                                                                  ['imgurl'] ? Colors.white : Colors.grey[200],
                                                       image: DecorationImage(
                                                              image: NetworkImage(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      ['imgurl']),
                                                              fit: BoxFit.cover)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                    );
                                  }
                                ),
                            height: 500,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                  image: NetworkImage(imgurl.toString()),
                                  fit: BoxFit.contain),
                              color: Colors.white,
                            ),
                            height: 400,
                            width: 400,
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  height: 500,
                                  width: 500,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
        
                                        children: [
                                           Text("SHOP  |  " +
                                            widget.queryDocumentSnapshot['category']  + " | ".toString()
                                                .toUpperCase(),
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black45,
                                                  fontSize: 15,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                          Text(
                                            widget.queryDocumentSnapshot['name']
                                                .toString()
                                                .toUpperCase(),
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                        ],
                                      ),
        
                                        Box(height: 15, width: 0),
                                         widget.queryDocumentSnapshot['permium'] ? 
                                      Container(
                                        height:25,
                                        width : 80,
                                        color:Colors.grey[200],
                                        child:Center(
                                          child: Text(
                                             "PERMIUM",
                                              style: GoogleFonts.nunitoSans(
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    letterSpacing: 1.5),
                                              ),
                                            ),
                                        ),
        
                                      ) : SizedBox(),
                                       Box(height: 10, width: 0),
                                       Text(
                                      
                                            widget.queryDocumentSnapshot['name']
                                                .toString().toLowerCase()
                                            ,
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 22,
                                              letterSpacing: 0),
                                        ),
                                      ),
                                       Box(height: 10, width: 0),
                                      
                                      
                                         Row(
                                        children: [
                                          Text(
                                           "₹ ${((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice']} ( Incl Taxes )",                                                                                  
                                             style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 68, 45, 40),
                                                  fontSize: 20,
                                                  letterSpacing: 1.5),
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                            Text(
                                      "MRP ₹ ${((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price']}",                       
                                             
                                         style: GoogleFonts.nunitoSans(
                                          
                                          textStyle: const TextStyle(
                                            decoration : TextDecoration.lineThrough,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(255, 95, 79, 75),
                                              fontSize: 15,
                                              letterSpacing: 1.5),
                                        ),
                                      ),
                                        ],
                                      ),
                                        Box(height: 8, width: 0),
                                    Row(
                                      children: [
                                        Text("EXCLUDING GST : ₹ " + 
                                          widget.queryDocumentSnapshot['oprice'].toString(),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13,
                                                height: 1.5,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text("YOU SAVE : ₹ ${(((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price'])
                                         - (((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice'])} ( ${((((((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price'])
                                         - ((((widget.queryDocumentSnapshot['oprice'] / 100) * 18) + widget.queryDocumentSnapshot['oprice']))) / (((widget.queryDocumentSnapshot['price'] / 100) * 18) + widget.queryDocumentSnapshot['price']) * 100 )).round()} % )" ,
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontSize: 13,
                                                height: 1.5,
                                                letterSpacing: 0),
                                          ),
                                        ),
                                      ],
                                    ),
        Box(height: 8, width: 0),
                                       
                                       Text(
                                        widget
                                            .queryDocumentSnapshot['Description']
                                            .toString(),
                                        style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black45,
                                              fontSize: 13,
                                              height: 1.5,
                                              letterSpacing: 0),
                                        ),
                                      ),
                                        Box(height: 13, width: 0),
                                        Text(
                                          "Material    :    " +
                                              reqwoodlist
                                                  .toString()
                                                  .toLowerCase()
                                                  .replaceAll(",", "|")
                                                  .replaceAll("[", "")
                                                  .replaceAll("]", ""),
                                          style: GoogleFonts.nunitoSans(
                                            textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontSize: 16,
                                                letterSpacing: 0),
                                          ),
                                        ),
        
                                        Box(height: 10, width: 0),
        
                                         Container(
                                        height: 60,
                                        // width: 100,
                                        child: StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection("SearchProducts")
                                                .doc(widget
                                                    .queryDocumentSnapshot["id"]
                                                    .toString())
                                                .collection("WoodList")
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.data == null) {
                                                return Center(
                                                  child: CircularProgressIndicator()
                                                );
                                              } else {
                                                return Scrollbar(
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: snapshot
                                                          .data!.docs.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              // setState(() {
                                                              //   woodtype = snapshot
                                                              //       .data.docs[index]['name'];
                                                              // });
                                                              print(woodtype);
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .transparent,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              height: 50,
                                                              width: 50,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .black,
                                                                        image: DecorationImage(
                                                                            image: NetworkImage(snapshot.data!.docs[index]
                                                                                [
                                                                                'image']),
                                                                            fit: BoxFit
                                                                                .cover),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                0)),
                                                                    height: 40,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                );
                                              }
                                            }),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(0)),
                                      ),
                                       Container(
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "QUANTITY : ",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 0),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quanityvalue >= 2) {
                                quanityvalue--;
                              }
                            });
                          },
                          icon: Icon(Icons.remove_circle_outline)),
                       
                        Container(
                            child: Center(
                              child: Text(
                                quanityvalue.toString(),
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black,
                                      fontSize: 14,
                                      letterSpacing: 1),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(2)),
                            height: 30,
                            width: 30),
                       IconButton(
                            onPressed: () {
                              setState(() {
                                quanityvalue++;
                              });
                            },
                            icon: Icon(Icons.add_circle_outline)),
                        
                        
                      ],
                    )),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5)),
                  ),  SizedBox(height: 10,),
                  GestureDetector(
                          onTap: () {
        
                           MRANDMRS.sharedprefs!.getString('uid') == null ? Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())):
        
        
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(MRANDMRS.sharedprefs!.getString("uid"))
                                .collection("cart")
                                .doc(widget.queryDocumentSnapshot["id"])
                                .set({
                              "Description":
                                  widget.queryDocumentSnapshot["Description"],
                              // "price": widget.queryDocumentSnapshot["price"],
                              "oprice": widget.queryDocumentSnapshot["oprice"],
                              "category":
                                  widget.queryDocumentSnapshot["category"],
                              "name": widget.queryDocumentSnapshot["name"],
                              "permium" : widget.queryDocumentSnapshot['permium'],
                              "id": widget.queryDocumentSnapshot["id"],
                              "mainimage":
                                  widget.queryDocumentSnapshot["mainimage"],
                              "quanity": quanityvalue,
                              "wood": woodtype,
                             "price": widget.queryDocumentSnapshot["price"],
                              'length': widget.queryDocumentSnapshot['lenght'],
                              'lenght': widget.queryDocumentSnapshot['lenght'],
                               "sgst" : (widget.queryDocumentSnapshot["oprice"]  / 100) * 9,
                                "cgst" : (widget.queryDocumentSnapshot["oprice"]  / 100) * 9,
                                "actualprice" : widget.queryDocumentSnapshot["oprice"] ,
        
                              "width": widget.queryDocumentSnapshot['width'],
                              "weight": widget.queryDocumentSnapshot['weight'],
                              'height': widget.queryDocumentSnapshot['height']
                            }).whenComplete(() {
                             final snackBar = SnackBar(
                               backgroundColor: Colors.brown[200],
                              //  margin: EdgeInsets.all(20),
                               width: 300,
                              // margin: EdgeInsets.fromLTRB(0, 0, 0, 75),
                               
                               behavior: SnackBarBehavior.floating,

                               dismissDirection: DismissDirection.startToEnd,
                               
                               
                               content: Text('Item Added Successfully'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            
                          });
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            child: Center(
                              child: Text(
                                "ADD TO CART",
                                style: GoogleFonts.nunitoSans(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13,
                                      letterSpacing: 4),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                                border: Border.all(color: Colors.black)),
                          ),
                        ),
                
                                    
                                      ])))
                        ],
                      ),
                    ),
                   
                   
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                     
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                          ),
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Text(
                                  "PRODUCT DETAILS",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16,
                                        letterSpacing: 0),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Table(
                                    textDirection: TextDirection.ltr,
                                    defaultVerticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    border: TableBorder.all(
                                        width: 0.5, color: lettercolor),
                                    children: [
                                      TableRow(children: [
                                        Container(
                                          height: 40,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    "BRAND",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: lettercolor,
                                                          fontSize: 12,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    "MR AND MRS",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: lettercolor,
                                                          fontSize: 12,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 40,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: Text(
                                                      "DIMENSIONS",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 12,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  
                                                  child: Text(
                                                    " H " +
                                                        widget.queryDocumentSnapshot[
                                                            'height'],
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: lettercolor,
                                                          fontSize: 12,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    
                                                  },
                                                  child: Text(
                                                    " * W " +
                                                        widget.queryDocumentSnapshot[
                                                            'width'],
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: lettercolor,
                                                          fontSize: 12,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                   
                                                  },
                                                  child: Text(
                                                    " * L " +
                                                        widget.queryDocumentSnapshot[
                                                            'lenght'] +
                                                        " (In Inches)",
                                                    style:
                                                        GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: lettercolor,
                                                          fontSize: 12,
                                                          letterSpacing: 1),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                      TableRow(children: [
                                        Container(
                                          height: 40,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: GestureDetector(
                                                    child: Text(
                                                      "WEIGHT",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 12,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      
                                                    },
                                                    child: Text(
                                                      widget.queryDocumentSnapshot[
                                                              'weight'] +
                                                          " kg",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 12,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                       
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30,),
        
         Text("This is a Made on order product it will be take 10 to 15 days to manufacture & 10 Days for delivery . For customization call 7540032123 ",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 16,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

Text("Return & Exchanges are not accepted , But contact 7540032123 if you have problems with your order",
                                                      style:
                                                          GoogleFonts.nunitoSans(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: lettercolor,
                                                            fontSize: 16,
                                                            letterSpacing: 1),
                                                      ),
                                                    ),

                                                    SizedBox(height:20),

        
        
                                //   Row(children: [
                                //
                                //
                                //
                              ],
                            ),
        
                            //               ]),
                            //         )),
        
                            //   ]),
                            // Row(
                            //                           mainAxisAlignment:
                            //                               MainAxisAlignment.start,
                            //                           children: [
                            //                             Column(
                            //                               children: [
                            //                                 // Container(
                            //                                 //   width: 450,
                            //                                 //   height: 20,
                            //                                 //   child: Row(
                            //                                 //     mainAxisAlignment: MainAxisAlignment.end,
                            //                                 //     children: [
                            //                                 //       IconButton(
                            //                                 //           icon: Icon(
                            //                                 //             Icons.arrow_back_ios,
                            //                                 //             size: 14,
                            //                                 //             color: Colors.black,
                            //                                 //           ),
                            //                                 //           onPressed: () {
                            //                                 //             _imagecontroller.animateTo(
                            //                                 //                 _imagecontroller.offset - 50,
                            //                                 //                 duration: Duration(milliseconds: 200),
                            //                                 //                 curve: Curves.ease);
                            //                                 //           }),
                            //                                 //       IconButton(
                            //                                 //           icon: Icon(
                            //                                 //             Icons.arrow_forward_ios,
                            //                                 //             size: 14,
                            //                                 //             color: Colors.black,
                            //                                 //           ),
                            //                                 //           onPressed: () {
                            //                                 //             _imagecontroller.animateTo(
                            //                                 //                 _imagecontroller.offset + 50,
                            //                                 //                 duration: Duration(milliseconds: 200),
                            //                                 //                 curve: Curves.ease);
                            //                                 //           })
                            //                                 //     ],
                            //                                 //   ),
                            //                                 // ),
                            //                                 // SizedBox(
                            //                                 //   height: 20,
                            //                                 // ),
        
                            //                                 SizedBox(
                            //                                   height: 15,
                            //                                 ),
        
                            //                                 SizedBox(
                            //                                   height: 30,
                            //                                 ),
                            //                                 Container(
                            //                                   height: 400,
                            //                                   width: 500,
                            //                                   color: Colors.black38,
                            //                                 ),
                            //                                 SizedBox(
                            //                                   height: 10,
                            //                                 ),
                            //                                 Container(
                            //                                   height: 100,
                            //                                   width: 500,
                            //                                   child: Row(
                            //                                     children: [
                            //                                       Container(
                            //                                         height: 80,
                            //                                         width: 80,
                            //                                         color: Colors.black38,
                            //                                       ),
                            //                                       Box(height: 0, width: 10),
                            //                                       Container(
                            //                                         height: 80,
                            //                                         width: 80,
                            //                                         color: Colors.black38,
                            //                                       ),
                            //                                       Box(height: 0, width: 10),
                            //                                       Container(
                            //                                         height: 80,
                            //                                         width: 80,
                            //                                         color: Colors.black38,
                            //                                       ),
                            //                                       Box(height: 0, width: 10),
                            //                                       Container(
                            //                                         height: 80,
                            //                                         width: 80,
                            //                                         color: Colors.black38,
                            //                                       ),
                            //                                     ],
                            //                                   ),
                            //                                 ),
                            //                                 SizedBox(
                            //                                   height: 10,
                            //                                 )
                            //                               ],
                            //                             ),
                            //                             SizedBox(
                            //                               width: 100,
                            //                             ),
                            //                             Column(
                            //                               crossAxisAlignment:
                            //                                   CrossAxisAlignment.start,
                            //                               mainAxisAlignment:
                            //                                   MainAxisAlignment.start,
                            //                               children: [
                            //                                 Row(
                            //                                   children: [
                            //                                     Text(
                            //                                       "15,000 INR",
                            //                                       style: GoogleFonts.nunitoSans(
                            //                                         textStyle: const TextStyle(
                            //                                             fontWeight:
                            //                                                 FontWeight
                            //                                                     .normal,
                            //                                             color:
                            //                                                 Colors.black54,
                            //                                             decoration:
                            //                                                 TextDecoration
                            //                                                     .lineThrough,
                            //                                             fontSize: 13,
                            //                                             letterSpacing: 0),
                            //                                       ),
                            //                                     ),
                            //                                     Box(height: 0, width: 10),
                            //                                     Text(
                            //                                       "12,000 INR",
                            //                                       style: GoogleFonts.nunitoSans(
                            //                                         textStyle:
                            //                                             const TextStyle(
                            //                                                 fontWeight:
                            //                                                     FontWeight
                            //                                                         .bold,
                            //                                                 color: Colors
                            //                                                     .black,
                            //                                                 fontSize: 17,
                            //                                                 letterSpacing:
                            //                                                     0),
                            //                                       ),
                            //                                     ),
                            //                                   ],
                            //                                 ),
                            //                                 Text(
                            //                                   "Inclusive of All Taxes",
                            //                                   style: GoogleFonts.nunitoSans(
                            //                                     textStyle: const TextStyle(
                            //                                         fontWeight:
                            //                                             FontWeight.normal,
                            //                                         color: Colors.black,
                            //                                         fontSize: 13,
                            //                                         letterSpacing: 0),
                            //                                   ),
                            //                                 ),
                            //                                 Box(height: 10, width: 0),
                            //                                 Row(
                            //                                   children: [
                            //                                     Container(
                            //                                       height: 40,
                            //                                       width: 100,
                            //                                       child: Row(
                            //                                         mainAxisAlignment:
                            //                                             MainAxisAlignment
                            //                                                 .spaceEvenly,
                            //                                         children: [
                            //                                           Icon(Icons.remove),
                            //                                           Text("2"),
                            //                                           Icon(Icons.add)
                            //                                         ],
                            //                                       ),
                            //                                       decoration: BoxDecoration(
                            //                                           border: Border.all(
                            //                                               color: Colors
                            //                                                   .black)),
                            //                                     ),
                            //                                     Box(height: 0, width: 10),
                            //
                            //                                   ],
                            //                                 ),
                            //
                            //                               ],
                            //                             ),
                            //
                            //                           ],
                            //                         ),
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 ),
                          ))
                    ]),
                    EndBox()
                  ]))),
        ));
  }
}

//for search
