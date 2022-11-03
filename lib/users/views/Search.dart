import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/users/views/Detailer.dart';
import '../../../constants.dart';
import 'package:mine/helpers/mobilewidgets.dart';
import 'package:mine/helpers/responsive_widget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchcontroller =  TextEditingController();
  String name = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ResponsiveWidget(
          desktop: SizedBox(
            child: Column(
              children: [
                const TopMovileNotifyBlackBox(),
                const MobileTitleWebBox(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        controller: searchcontroller,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here",
                          hintStyle:
                              TextStyle(color: Colors.grey, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: (name != "" && name != null)
                          ? FirebaseFirestore.instance
                              .collection("SearchProducts")
                              .where('search', arrayContains: name)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("SearchProducts")
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: Text("Loading"));
                        } else {
                          return GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 4,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot documentSnapshot) {
                              Map<String, dynamic> data = documentSnapshot
                                  .data()! as Map<String, dynamic>;

                              return SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailProductScreens(
                                                      queryDocumentSnapshot:
                                                          documentSnapshot)));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data["mainimage"])),
                                            color: Colors.brown[50]!
                                                .withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Center(
                                          child: Text(
                                            data['name'],
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kBackgroundColor,
                                                  fontSize: 14,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          tab: SizedBox(
            child: Column(
              children: [
                const TopMovileNotifyBlackBox(),
                const MobileTitleWebBox(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        controller: searchcontroller,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here",
                          hintStyle:
                              TextStyle(color: Colors.grey, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: (name != "" && name != null)
                          ? FirebaseFirestore.instance
                              .collection("SearchProducts")
                              .where('search', arrayContains: name)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("SearchProducts")
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child:  Text("Loading"));
                        } else {
                          return GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 3,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot documentSnapshot) {
                              Map<String, dynamic> data = documentSnapshot
                                  .data()! as Map<String, dynamic>;

                              return Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailProductScreens(
                                                      queryDocumentSnapshot:
                                                          documentSnapshot)));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 155,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data["mainimage"])),
                                            color: Colors.brown[50]!
                                                .withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Center(
                                          child: Text(
                                            data['name'],
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kBackgroundColor,
                                                  fontSize: 14,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          mobile: SizedBox(
            child: Column(
              children: [
                const TopMovileNotifyBlackBox(),
                const MobileTitleWebBox(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.brown[50],
                        borderRadius: BorderRadius.circular(7)),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                    
                        controller: searchcontroller,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,

                          hintText: "Search here",
                          hintStyle:
                              TextStyle(color: Colors.grey, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: (name != "" && name != null)
                          ? FirebaseFirestore.instance
                              .collection("SearchProducts")
                              .where('search', arrayContains: name)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("SearchProducts")
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: Text("Loading"));
                        } else {
                          return GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 2,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot documentSnapshot) {
                              Map<String, dynamic> data = documentSnapshot
                                  .data()! as Map<String, dynamic>;

                              return SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailProductScreens(
                                                    queryDocumentSnapshot:
                                                        documentSnapshot,
                                                  )));
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 110,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    data["mainimage"])),
                                            color: Colors.brown[100],
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Center(
                                          child: Text(
                                            data['name'],
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: kBackgroundColor,
                                                  fontSize: 14,
                                                  letterSpacing: 0),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                      },
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
