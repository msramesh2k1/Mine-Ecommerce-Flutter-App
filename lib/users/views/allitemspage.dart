import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/helpers/cartmethod.dart';
import 'package:mine/helpers/responsive_widget.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import 'package:mine/users/views/detailproductscreen.dart';

import '../../HomeScreenWidgets/HomeWidgets.dart';
import '../../Widgets/Custom_Widgets.dart';
import '../../cart/CartPage.dart';
import '../../controllers/cart_controller.dart';
import 'Helper.dart';
import 'Search.dart';
import 'accountscree.dart';
import 'loginpage.dart';

class AllItemsScreen extends StatefulWidget {
  const AllItemsScreen({Key? key}) : super(key: key);

  @override
  State<AllItemsScreen> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<AllItemsScreen> {
  
  @override
  void initState() {
     context.read<CartController>().cartvaluefinder();
    // TODO: implement initState

    super.initState();

  }
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      tab:  Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("SearchProducts")
                .snapshots(),
            builder: (context, snapshots) {
               return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                  itemCount: snapshots.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,   mainAxisExtent:320,),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailProductScreen(
                                      queryDocumentSnapshot:
                                          snapshots.data!.docs[index])));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Image(
                                  image: NetworkImage(
                                    snapshots.data!.docs[index]['mainimage'],
                                  ),
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 200,
                                ),
                              ),
                              Box(height: 0, width: 0),
                              Text(
                                snapshots.data!.docs[index]['name'],
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 14,
                                      letterSpacing: 4),
                                ),
                              ),
                            ],
                          ),
                          height: 400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(126.0),
          child: Column(
            children: [
              // TopNotifyBlackBox(),
              // TitleWebBox(),

              Box(height: 40, width: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Box(height: 0, width: 5),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_sharp),
                  ),
                  // Box(height: 0, width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mr & Mrs",
                        style: GoogleFonts.novaSlim(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kBackgroundColor,
                              fontSize: 25,
                              letterSpacing: 0),
                        ),
                      ),
                      Text(
                        "Design Wood Works",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 11,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "ALL PRODUCTS",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            MRANDMRS.sharedprefs!.getString("uid") == null
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AccountScreen()));
                          },
                          child: Icon(EvaIcons.personOutline)),
                      const Box(height: 0, width: 20),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Search()));
                          },
                          child: GestureDetector(
                              child: Icon(EvaIcons.searchOutline))),
                      const Box(height: 0, width: 20),
                     cartmethod(context),
                      const Box(height: 0, width: 40),
                    ],
                  ),
                ],
              ),

              Box(height: 30, width: 0),
              Container(
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      mobile: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("SearchProducts")
                .snapshots(),
            builder: (context, snapshots) {
             return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            :  GridView.builder(
                  itemCount: snapshots.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,   mainAxisExtent: 220,),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DetailProductScreen(
                                        queryDocumentSnapshot:
                                            snapshots.data!.docs[index])));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(snapshots
                                            .data!.docs[index]["mainimage"])),
                                    color: Colors.brown[100],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                Box(height: 2, width: 0),
                                Center(
                                  child: Text(
                                    snapshots.data!.docs[index]['name'],
                                    style: GoogleFonts.nunitoSans(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 14,
                                          letterSpacing: 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: Column(
            children: [
              // TopNotifyBlackBox(),
              // TitleWebBox(),

             Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Box(height: 0, width: 8),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_sharp,size: 15,),
                  ),
                  // Box(height: 0, width: 20),
                  Spacer(),
                  Center(
                    child: Text(
                      "ALL PRODUCTS",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  Spacer(),
                 //cartmethod
                 cartmethod(context),
                  const Box(height: 0, width: 5),
                ],
              ),

              Spacer(),
              Container(
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      desktop: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("SearchProducts")
                .snapshots(),
            builder: (context, snapshots) {
               return !snapshots.hasData
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : GridView.builder(
                  itemCount: snapshots.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailProductScreen(
                                      queryDocumentSnapshot:
                                          snapshots.data!.docs[index])));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Image(
                                  image: NetworkImage(
                                    snapshots.data!.docs[index]['mainimage'],
                                  ),
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                              Box(height: 0, width: 0),
                              Text(
                                snapshots.data!.docs[index]['name'],
                                style: GoogleFonts.nunitoSans(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 14,
                                      letterSpacing: 4),
                                ),
                              ),
                            ],
                          ),
                          height: 400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(126.0),
          child: Column(
            children: [
              // TopNotifyBlackBox(),
              // TitleWebBox(),

              Box(height: 40, width: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Box(height: 0, width: 5),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_sharp),
                  ),
                  Box(height: 0, width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Mr & Mrs",
                        style: GoogleFonts.novaSlim(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kBackgroundColor,
                              fontSize: 25,
                              letterSpacing: 0),
                        ),
                      ),
                      Text(
                        "Design Wood Works",
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 11,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "ALL PRODUCTS",
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 16,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            MRANDMRS.sharedprefs!.getString("uid") == null
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => LoginScreen()))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => AccountScreen()));
                          },
                          child: Icon(EvaIcons.personOutline)),
                      const Box(height: 0, width: 20),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Search()));
                          },
                          child: GestureDetector(
                              child: Icon(EvaIcons.searchOutline))),
                      const Box(height: 0, width: 20),
                     cartmethod(context),
                      const Box(height: 0, width: 40),
                    ],
                  ),
                ],
              ),

              Box(height: 30, width: 0),
              Container(
                height: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
