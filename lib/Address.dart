import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'getcontrolleradddress.dart';
import 'users/views/Helper.dart';
import 'users/views/AddAddress.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

bool selected = false;
List address = new List.filled(0, 1, growable: false);
var id = "";
String? values;

class _AddressState extends State<Address> {
  GetxController addresschangercontroller = Get.put(AddressChangerController());
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Container(
                          width: 400, height: 800, child: AddAddress()),
                    );
                  });
            },
            child: Container(
              child: Center(
                child: Text("Add New Address",
                    style: GoogleFonts.nunitoSans(
                        textStyle: TextStyle(
                      letterSpacing: 0.5,
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ))),
              ),
              decoration: BoxDecoration(
                color: Colors.brown[900]!.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 40,
              width: 160,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
                SizedBox(width: 10,),
              Text("Home", style: TextStyle(color: Colors.black, fontSize: 14)),
              Radio(
              value: "Home",
              groupValue: values,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  values = value.toString();
                });
                print(values); //selected value
              }),
              SizedBox(width: 10,),
              Text("Office", style: TextStyle(color: Colors.black, fontSize: 14)),
              Radio(
              value: "Office",
              groupValue: values,
              activeColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  values = value.toString();
                });
                print(values); //selected value
              }),
            ],
          ),
          
          SingleChildScrollView(
            child: Container(
                height: 500,
                //  height: MediaQuery.of(context).size.height * 0.5,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(MRANDMRS.sharedprefs!.getString("uid"))
                      .collection("address").where('type' ,isEqualTo: values)
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : snapshot.data!.docs.length == 0
                            ? noAddressCard()
                            : ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          final store = Get.put(
                                              AddressChangerController());
                                          print(store.addressid);
                                          store.updateStoreName(
                                              snapshot.data!.docs[index]['id']);
                                          id = snapshot.data!.docs[index]['id'];
                                          print(store.addressid); // print(id);
                                        });
                                        // print(address);
                                        // if (address.contains(
                                        //     snapshot.data!.docs[index]['id'])) {
                                        //   setState(() {
                                        //     address.remove(snapshot
                                        //         .data!.docs[index]["id"]);
                                        //   });
                                        // } else {
                                        //   setState(() {
                                        //     address.add(snapshot
                                        //         .data!.docs[index]["id"]);
                                        //   });
                                        // }
                                      },
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                      ['name'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                          ['flatNumber'] +
                                                      " " +
                                                      snapshot.data!.docs[index]
                                                          ['street1'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal))),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                      ['street1'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal))),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                          ['city'] +
                                                      "  -  " +
                                                      snapshot.data!.docs[index]
                                                          ['pincode'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal))),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                      ['state'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal))),
                                              Text(
                                                  snapshot.data!.docs[index]
                                                          ['country'] +
                                                      snapshot.data!.docs[index]
                                                          ['phoneNumber'],
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunitoSans(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight
                                                              .normal))),
                                            ],
                                          ),
                                        ),
                                        height: 120,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: id ==
                                                  snapshot.data!.docs[index]
                                                      ['id']
                                              ? Colors.brown[900]!
                                                  .withOpacity(0.2)
                                              : Colors.grey[100],
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                              );
                  },
                )),
          ),
        ]));
  }

  noAddressCard() {
    return Container(
        color: Colors.transparent,
        height: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No address has been saved !!!",
                style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 14,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.normal))),
          ],
        ));
  }
}
