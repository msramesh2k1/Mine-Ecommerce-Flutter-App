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

class CategoryLord extends StatefulWidget {
  final String category;
  const CategoryLord({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryLord> createState() => _AllItemsScreenState();
}

class _AllItemsScreenState extends State<CategoryLord> {
  
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
     context.read<CartController>().cartvaluefinder();
  }
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile:   Scaffold(
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
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon:  Icon(Icons.arrow_back_ios_sharp),),
                   Box(height: 0, width: 20),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Mr & Mrs",
                  //       style: GoogleFonts.novaSlim(
                  //         textStyle: const TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: kBackgroundColor,
                  //             fontSize: 20,
                  //             letterSpacing: 0),
                  //       ),
                  //     ),
                  //     Text(
                  //       "Design Wood Works",
                  //       style: GoogleFonts.openSans(
                  //         textStyle: const TextStyle(
                  //             fontWeight: FontWeight.normal,
                  //             color: Colors.black,
                  //             fontSize: 6,
                  //             letterSpacing: 1),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Spacer(),
                  Center(
                    child: Text(
                      widget.category,
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
                                        builder: (_) => AccountScreen()));},
                        
                        
                        child: Icon(EvaIcons.personOutline)),
                      const Box(height: 0, width: 20),
                      GestureDetector(
                        
                        onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Search()));
                        },
                        
                        child: GestureDetector(child: Icon(EvaIcons.searchOutline))),
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("SearchProducts").where('category',isEqualTo: widget.category)
                .snapshots(),
            builder: (context, snapshots) {
               return !snapshots.hasData
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : 
        GridView.builder(
                  itemCount: snapshots.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
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
                                  height: 130,
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
                          // height: 400,
                          color: Colors.white,
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      ),

       tab: Scaffold(
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
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon:  Icon(Icons.arrow_back_ios_sharp),),
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
                      widget.category,
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
                                        builder: (_) => AccountScreen()));},
                        
                        
                        child: Icon(EvaIcons.personOutline)),
                      const Box(height: 0, width: 20),
                      GestureDetector(
                        
                        onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Search()));
                        },
                        
                        child: GestureDetector(child: Icon(EvaIcons.searchOutline))),
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("SearchProducts").where('category',isEqualTo: widget.category)
                .snapshots(),
            builder: (context, snapshots) {
               return !snapshots.hasData
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : 
        GridView.builder(
                  itemCount: snapshots.data!.docs.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
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
                                  width: 200,
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
      ),
       
     desktop: Scaffold(
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
                  IconButton(onPressed:(){
                    Navigator.pop(context);
                  }, icon:  Icon(Icons.arrow_back_ios_sharp),),
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
                      widget.category,
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
                                        builder: (_) => AccountScreen()));},
                        
                        
                        child: Icon(EvaIcons.personOutline)),
                      const Box(height: 0, width: 20),
                      GestureDetector(
                        
                        onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Search()));
                        },
                        
                        child: GestureDetector(child: Icon(EvaIcons.searchOutline))),
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("SearchProducts").where('category',isEqualTo: widget.category)
                .snapshots(),
            builder: (context, snapshots) {
               return !snapshots.hasData
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : 
        GridView.builder(
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
      ),
    );
  }
}
