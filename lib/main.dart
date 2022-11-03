import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mine/Orders.dart';
import 'package:mine/admin/Admin.dart';
import 'package:mine/admin/admindashboard.dart';
import 'package:mine/admin/adminlogin.dart';
import 'package:mine/admin/uploader.dart';
import 'package:mine/cart/cartvalue.dart';
import 'package:mine/controllers/cart_controller.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/users/views/HomePage.dart';
import 'package:mine/users/views/Stepper.dart';
import 'package:mine/users/views/dummypayment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sizer/sizer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //        apiKey: "AIzaSyB1HnyORceSCnvsZ5mBX-pLISkHTXYkriY",
  // authDomain: "mine-6d958.firebaseapp.com",
  // projectId: "mine-6d958",
  // storageBucket: "mine-6d958.appspot.com",
  // messagingSenderId: "665425464962",
  // appId: "1:665425464962:web:abf8567ce987655f2dee9b",
  // measurementId: "G-QG9L58EC4H"),
  // );

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  MRANDMRS.sharedprefs = await SharedPreferences.getInstance();
  MRANDMRS.firestore = FirebaseFirestore.instance;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: cartvalue()),
          ChangeNotifierProvider(create: (context) => CartController()),
        ],
        child: GetMaterialApp(
          
          theme: Theme.of(context).copyWith(
            textTheme: GoogleFonts.openSansTextTheme(),
            highlightColor: Colors.teal,
            primaryColor: Colors.black,
          ),
          debugShowCheckedModeBanner: false,
          title: 'MR AND MRS',
          home: HomeScreen(),      
       
          builder: EasyLoading.init(),
        ),
      );
    });
  }
}


