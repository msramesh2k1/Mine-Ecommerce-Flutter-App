// checked - completed
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/HomeScreenWidgets/HomeWidgets.dart';
import 'package:mine/constants.dart';
import 'package:mine/helpers/mobilewidgets.dart';
import 'package:mine/helpers/responsive_widget.dart';

import '../Widgets/Custom_Widgets.dart';
import '../helpers/cartmethod.dart';
import '../users/views/Helper.dart';
import '../users/views/Search.dart';
import '../users/views/accountscree.dart';
import '../users/views/loginpage.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "ABOUT US",
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
      body: ResponsiveWidget(
        mobile: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // Container(
                  //   color: Color.fromRGBO(230, 224, 215, 1),
                    
                  //   child: Center(
                  //     child: Text(
                  //       "ABOUT US",
                  //       style: GoogleFonts.nunitoSans(
                  //         textStyle: const TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black,
                  //             fontSize: 18,
                  //             letterSpacing: 7),
                  //       ),
                  //     ),
                  //   ),
                  //   height: 100,
                  // ),
                   SizedBox(height: 40,),
                Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  
                                  
                                  fit: BoxFit.cover,
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/mr-and-mrs-93502.appspot.com/o/WhatsApp%20Image%202022-08-15%20at%208.08.02%20PM.jpeg?alt=media&token=e6efd16c-20e0-4f48-a898-50c72b26b922"))
                              ),
                       
                                height:200,
                                width: 200,
                               
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Text(
    
                                "M SUBRAMANIAN - Founder",
    
                                textAlign: TextAlign.left,
    
                                style: GoogleFonts.numans(
    
                                  textStyle: const TextStyle(
    
                                      fontWeight: FontWeight.bold,
    
                                      color: Colors.black,
                                      
    
                                      
    
                                      fontSize: 17,
    
                                      letterSpacing: 1),
    
                                ),
    
                              ),
  ],
),                     
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,top: 30,bottom:30,right:15),
                    child: Text(
                      "Mr and Mrs Design Wood Works is a fully integrated manufacturer unit.Established in 2022 out of a desire to bring a uniquely customer-oriented approach, we design durable, elegant furniture that excels at meeting all core requirements. Combined with a huge array of options, choices, price points, and scales, our customers can specify the best possible solution.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "OUR BRAND PHILOSOPHY",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "As a brand we believe in the following design philosophy and principles:",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "QUALITY",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Mr and Mrs Design Wood Works, an online furniture store believes in combining outstanding quality with astonishing value, offering a carefully curated, assortment of home products. Pairing timeless elements with fresh twists, each item is designed to enhance a room, or inspire a memorable experience",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "NATURAL",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "We believe a blank canvas is something full of possibilities and with unlimited potential. At Mr and Mrs Design Wood Works, an online furniture store we celebrate the beauty of natural materials that are crafted into simple, one-of-a-kind shapes and silhouettes.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "SUSTAINABILITY",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "We strive to use materials that are sustainably sourced. We believe in supporting artisans and craftsmen and their crafts. As a brand we want to preserve and use the dying, traditional techniques of sofa and furniture making."
                   ,   textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "COMFORT",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Whether it is comfort of shopping with us or the comfort provided by our products like sofas and chairs using high quality material like foams, fibers and down feathers, we have taken care of all your comfort needs in our products",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "STRONG AESTHETICS",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "We believes in creating beautiful aesthetics that will live with you forever. Our design philosophy is very clear, to create and sell products which are honest, breathe easy and exude strong aesthetics",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        tab:SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  
                                  
                                  fit: BoxFit.cover,
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/mr-and-mrs-93502.appspot.com/o/WhatsApp%20Image%202022-08-15%20at%208.08.02%20PM.jpeg?alt=media&token=e6efd16c-20e0-4f48-a898-50c72b26b922"))
                              ),
                       
                                height:200,
                                width: 200,
                               
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Text(
    
                                "M SUBRAMANIAN - Founder",
    
                                textAlign: TextAlign.left,
    
                                style: GoogleFonts.numans(
    
                                  textStyle: const TextStyle(
    
                                      fontWeight: FontWeight.bold,
    
                                      color: Colors.black,
                                      
    
                                      
    
                                      fontSize: 17,
    
                                      letterSpacing: 1),
    
                                ),
    
                              ),
  ],
),                     
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,top: 30,bottom:30,right:15),
                    child: Text(
                      "Mr and Mrs Design Wood Works is a fully integrated manufacturer unit.Established in 2022 out of a desire to bring a uniquely customer-oriented approach, we design durable, elegant furniture that excels at meeting all core requirements. Combined with a huge array of options, choices, price points, and scales, our customers can specify the best possible solution.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "OUR BRAND PHILOSOPHY",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "As a brand we believe in the following design philosophy and principles:",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "QUALITY",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Mr and Mrs Design Wood Works, an online furniture store believes in combining outstanding quality with astonishing value, offering a carefully curated, assortment of home products. Pairing timeless elements with fresh twists, each item is designed to enhance a room, or inspire a memorable experience",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "NATURAL",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "We believe a blank canvas is something full of possibilities and with unlimited potential. At Mr and Mrs Design Wood Works, an online furniture store we celebrate the beauty of natural materials that are crafted into simple, one-of-a-kind shapes and silhouettes.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "SUSTAINABILITY",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "We strive to use materials that are sustainably sourced. We believe in supporting artisans and craftsmen and their crafts. As a brand we want to preserve and use the dying, traditional techniques of sofa and furniture making.",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "COMFORT",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Whether it is comfort of shopping with us or the comfort provided by our products like sofas and chairs using high quality material like foams, fibers and down feathers, we have taken care of all your comfort needs in our products",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "STRONG AESTHETICS",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "We believes in creating beautiful aesthetics that will live with you forever. Our design philosophy is very clear, to create and sell products which are honest, breathe easy and exude strong aesthetics",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            
                            fontSize: 17,
                            letterSpacing: 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        desktop: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  // Container(
                  //   color: Color.fromRGBO(230, 224, 215, 1),
                    
                  //   child: Center(
                  //     child: Text(
                  //       "ABOUT US",
                  //       style: GoogleFonts.nunitoSans(
                  //         textStyle: const TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.black,
                  //             fontSize: 18,
                  //             letterSpacing: 7),
                  //       ),
                  //     ),
                  //   ),
                  //   height: 100,
                  // ),
                      
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  
                                  
                                  fit: BoxFit.cover,
                                image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/mr-and-mrs-93502.appspot.com/o/WhatsApp%20Image%202022-08-15%20at%208.08.02%20PM.jpeg?alt=media&token=e6efd16c-20e0-4f48-a898-50c72b26b922"))
                              ),
                       
                                height:200,
                                width: 200,
                               
                            ),
                          ],
                        ),
                        SizedBox(height: 40,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Text(
    
                                "M SUBRAMANIAN - Founder",
    
                                textAlign: TextAlign.left,
    
                                style: GoogleFonts.numans(
    
                                  textStyle: const TextStyle(
    
                                      fontWeight: FontWeight.bold,
    
                                      color: Colors.black,
                                      
    
                                      
    
                                      fontSize: 17,
    
                                      letterSpacing: 1),
    
                                ),
    
                              ),
  ],
),                      Padding(
                          padding: const EdgeInsets.only(left:15.0,top: 40,bottom:30,right:15),
                          child: Text(
                            "Mr and Mrs Design Wood Works is a fully integrated manufacturer unit.Established in 2022 out of a desire to bring a uniquely customer-oriented approach, we design durable, elegant furniture that excels at meeting all core requirements. Combined with a huge array of options, choices, price points, and scales, our customers can specify the best possible solution.",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  
                                  fontSize: 17,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                        
                      Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "OUR BRAND PHILOSOPHY",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "As a brand we believe in the following design philosophy and principles:",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "QUALITY",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Mr and Mrs Design Wood Works, an online furniture store believes in combining outstanding quality with astonishing value, offering a carefully curated, assortment of home products. Pairing timeless elements with fresh twists, each item is designed to enhance a room, or inspire a memorable experience",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "NATURAL",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "We believe a blank canvas is something full of possibilities and with unlimited potential. At Mr and Mrs Design Wood Works, an online furniture store we celebrate the beauty of natural materials that are crafted into simple, one-of-a-kind shapes and silhouettes.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "SUSTAINABILITY",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "We strive to use materials that are sustainably sourced. We believe in supporting artisans and craftsmen and their crafts. As a brand we want to preserve and use the dying, traditional techniques of sofa and furniture making.",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "COMFORT",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Whether it is comfort of shopping with us or the comfort provided by our products like sofas and chairs using high quality material like foams, fibers and down feathers, we have taken care of all your comfort needs in our products",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "STRONG AESTHETICS",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "We believes in creating beautiful aesthetics that will live with you forever. Our design philosophy is very clear, to create and sell products which are honest, breathe easy and exude strong aesthetics",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              
                              fontSize: 17,
                              letterSpacing: 1),
                        ),
                      ),
                    )

                      ],
                    ),
                  ),                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
