//completed

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/HomeScreenWidgets/HomeWidgets.dart';
import 'package:mine/users/views/accountscree.dart';
import 'package:mine/users/views/phoneauth.dart';
import 'package:mine/users/views/registerpage.dart';
import 'package:mine/Widgets/Custom_Widgets.dart';
import '../../../constants.dart';
import 'package:mine/helpers/mobilewidgets.dart';
import 'package:mine/helpers/responsive_widget.dart';

import 'ErrorAlert.dart';

import 'firebase_auth.dart';
import 'forgotpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _password = true;
  final TextEditingController emailcontroller = new TextEditingController();
  final TextEditingController phonecontroller = new TextEditingController();
  final TextEditingController resetemailtexteditingcontroller =
      new TextEditingController();

  final TextEditingController namecontroller = new TextEditingController();
  final TextEditingController registeremailcontroller =
      new TextEditingController();

  String countrycode = "";
  final TextEditingController passwordcontroller = new TextEditingController();

  bool displaytext = false;

  bool canShow = false;
  var temp;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _password = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: ResponsiveWidget(
            mobile: SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: [
                      TopMovileNotifyBlackBox(),
                      MobileTitleWebBox(),
                      Box(height: 40, width: 0),
                      Text(
                        "LOGIN",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                      Box(height: 30, width: 0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => MobileLoginScreen()));
                        },
                        child: Text(
                          "Login via Phone",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                      Box(height: 30, width: 0),
                      displaytext
                          ? Column(
                              children: [
                              InkWell(
                               
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                       Icon(Icons.phone_iphone_outlined),SizedBox(width: 5,),
                                      Text(
                                      "${emailcontroller.text.toString()}" ,

                               style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 17,
                                              letterSpacing: 1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "We've sent a OTP to mobile number above number\n.Please enter it to complete verification",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            )
                          :
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: CountryCodePicker(
                                  onChanged: (value) {
                                    setState(() {
                                      countrycode = value.toString();
                                      print(countrycode);
                                    });
                                  },
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: 'IN',
                                  favorite: ['+39', 'FR'],
                                  // optional. Shows only country name and flag
                                  showCountryOnly: false,
                                  // optional. Shows only country name and flag when popup is closed.
                                  showOnlyCountryWhenClosed: false,
                                  // optional. aligns the flag and the Text left
                                  alignLeft: false,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                      color: kBackgroundColor, fontSize: 14),
                                  cursorColor: kBackgroundColor,
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    label: Text("PHONE NUMBER"),
                                    labelStyle: TextStyle(
                                        fontFamily: 'lato',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  print(countrycode + emailcontroller.text);
                                  temp = await FirebaseAuthentication().sendOTP(
                                      countrycode + emailcontroller.text);
                                        setState(() {
                                          displaytext = true;
                                        });
                                },
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "SEND OTP",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 10,
                                       
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                      Box(height: 15, width: 0),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            style: TextStyle(
                                color: kBackgroundColor, fontSize: 14),
                            cursorColor: kBackgroundColor,
                            controller: passwordcontroller,
                            // obscureText: !_password,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // suffixIcon: IconButton(
                              //   icon: Icon(
                              //       _password
                              //           ? Icons.visibility
                              //           : Icons.visibility_off,
                              //       color: kBackgroundColor,
                              //       size: 18),
                              //   onPressed: () {
                              //     setState(() {
                              //       _password = !_password;
                              //     });
                              //   },
                              // ),
                              // labelText: 'OTP',
                              label: Center(child: Text("OTP")),

                              labelStyle: TextStyle(
                                  fontFamily: 'lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                      Box(height: 10, width: 0),
                      GestureDetector(
                        onTap: () {
                          // Route route = MaterialPageRoute(
                          //     builder: (context) => ForgetPassword());
                          // Navigator.push(context, route);
                        },
                        child: Text(
                          "Forget Password ?",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.transparent,
                                fontSize: 14,
                                letterSpacing: 0),
                          ),
                        ),
                      ),
                      Box(height: 10, width: 0),
                      GestureDetector(
                        onTap: () {
                          emailcontroller.text.isNotEmpty &&
                                  passwordcontroller.text.isNotEmpty
                              ? FirebaseAuthentication().authenticateMe(
                                  temp, passwordcontroller.text, context)
                              : SizedBox();

                          // emailcontroller.text.isNotEmpty &&
                          //         passwordcontroller.text.isNotEmpty
                          //     ?  FirebaseAuthentication().authenticateMe(temp, passwordcontroller.text)

                          //                     Get.dialog(Padding(
                          // padding: const EdgeInsets.all(200.0),
                          // child: Container(
                          //   height: 300,
                          //   width: 100,

                          //   color: Colors.white,
                          //   child: Column(
                          //     children: [

                          //     ],

                          //   ),

                          // )));

                          // _loginform()
                          // : showDialog(
                          //     context: context,
                          //     builder: (c) {
                          //       return ErrorAlertDialog(
                          //           message: "Provide Email and Password");
                          //     });
                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width - 30,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 2),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(204, 191, 171, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(204, 191, 171, 1))),
                        ),
                      ),
                      Box(height: 10, width: 0),
                      Box(height: 40, width: 0),
                    ],
                  ),
                  color: Colors.white),
            ),
            tab: SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: [
                      TopNotifyBlackBox(),
                      TitleWebBox(),
                      Box(height: 40, width: 0),
                      Text(
                        "LOGIN",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                      Box(height: 30, width: 0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => MobileLoginScreen()));
                        },
                        child: Text(
                          "Login via Phone",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                      Box(height: 30, width: 0),
                      displaytext
                          ? Column(
                              children: [
                               InkWell(
                               
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                       Icon(Icons.phone_iphone_outlined),SizedBox(width: 5,),
                                      Text(
                                      "${emailcontroller.text.toString()}" ,

                               style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 17,
                                              letterSpacing: 1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "We've sent a OTP to mobile number above number\n.Please enter it to complete verification",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            )
                          :
                      Container(
                        height: 50,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: CountryCodePicker(
                                  onChanged: (value) {
                                    setState(() {
                                      countrycode = value.toString();
                                      print(countrycode);
                                    });
                                  },
                                  // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                  initialSelection: 'IN',
                                  favorite: ['+39', 'FR'],
                                  // optional. Shows only country name and flag
                                  showCountryOnly: false,
                                  // optional. Shows only country name and flag when popup is closed.
                                  showOnlyCountryWhenClosed: false,
                                  // optional. aligns the flag and the Text left
                                  alignLeft: false,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  style: TextStyle(
                                      color: kBackgroundColor, fontSize: 14),
                                  cursorColor: kBackgroundColor,
                                  controller: emailcontroller,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    label: Text("PHONE NUMBER"),
                                    labelStyle: TextStyle(
                                        fontFamily: 'lato',
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  print(countrycode + emailcontroller.text);
                                  temp = await FirebaseAuthentication().sendOTP(
                                      countrycode + emailcontroller.text);
                                        setState(() {
                                          displaytext = true;
                                        });
                                },
                                child: Container(
                                  height: 35,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "SEND OTP",
                                      style: GoogleFonts.nunitoSans(
                                        textStyle: const TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                            fontSize: 10,
                                            letterSpacing: 0.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                      Box(height: 15, width: 0),
                      Container(
                        height: 50,
                        width: 500,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            style: TextStyle(
                                color: kBackgroundColor, fontSize: 14),
                            cursorColor: kBackgroundColor,
                            controller: passwordcontroller,
                            // obscureText: !_password,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // suffixIcon: IconButton(
                              //   icon: Icon(
                              //       _password
                              //           ? Icons.visibility
                              //           : Icons.visibility_off,
                              //       color: kBackgroundColor,
                              //       size: 18),
                              //   onPressed: () {
                              //     setState(() {
                              //       _password = !_password;
                              //     });
                              //   },
                              // ),
                              // labelText: 'OTP',
                              label: Center(child: Text("OTP")),

                              labelStyle: TextStyle(
                                  fontFamily: 'lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                      Box(height: 10, width: 0),
                      GestureDetector(
                        onTap: () {
                          // Route route = MaterialPageRoute(
                          //     builder: (context) => ForgetPassword());
                          // Navigator.push(context, route);
                        },
                        child: Text(
                          "Forget Password ?",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.transparent,
                                fontSize: 14,
                                letterSpacing: 0),
                          ),
                        ),
                      ),
                      Box(height: 10, width: 0),
                      GestureDetector(
                        onTap: () {
                          emailcontroller.text.isNotEmpty &&
                                  passwordcontroller.text.isNotEmpty
                              ? FirebaseAuthentication().authenticateMe(
                                  temp, passwordcontroller.text, context)
                              : SizedBox();

                          // _loginform()
                          // : showDialog(
                          //     context: context,
                          //     builder: (c) {
                          //       return ErrorAlertDialog(
                          //           message: "Provide Email and Password");
                          //     });
                        },
                        child: Container(
                          height: 45,
                          width: 500,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 2),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(204, 191, 171, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(204, 191, 171, 1))),
                        ),
                      ),
                      Box(height: 10, width: 0),
                      Box(height: 40, width: 0),
                    ],
                  ),
                  color: Colors.white),
            ),
            desktop: SingleChildScrollView(
              child: Container(
                  child: Column(
                    children: [
                      TopNotifyBlackBox(),
                      TitleWebBox(),
                      Box(height: 40, width: 0),
                      Text(
                        "LOGIN",
                        style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 14,
                              letterSpacing: 2),
                        ),
                      ),
                      Box(height: 30, width: 0),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => MobileLoginScreen()));
                        },
                        child: Text(
                          "Login via Phone",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: 14,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                      Box(height: 30, width: 0),
                      displaytext
                          ? Column(
                              children: [
                              InkWell(
                               
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                       Icon(Icons.phone_iphone_outlined),SizedBox(width: 5,),
                                      Text(
                                      "${emailcontroller.text.toString()}" ,

                               style: GoogleFonts.nunitoSans(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 17,
                                              letterSpacing: 1.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "We've sent a OTP to mobile number above number\n.Please enter it to complete verification",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: 0),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              height: 50,
                              width: 400,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: CountryCodePicker(
                                        onChanged: (value) {
                                          setState(() {
                                            countrycode = value.toString();
                                            print(countrycode);
                                          });
                                        },
                                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                        initialSelection: 'IN',
                                        favorite: ['+39', 'FR'],
                                        // optional. Shows only country name and flag
                                        showCountryOnly: false,
                                        // optional. Shows only country name and flag when popup is closed.
                                        showOnlyCountryWhenClosed: false,
                                        // optional. aligns the flag and the Text left
                                        alignLeft: false,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        style: TextStyle(
                                            color: kBackgroundColor,
                                            fontSize: 14),
                                        cursorColor: kBackgroundColor,
                                        controller: emailcontroller,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          label: Text("PHONE NUMBER"),
                                          labelStyle: TextStyle(
                                              fontFamily: 'lato',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        print(
                                            countrycode + emailcontroller.text);
                                        temp = await FirebaseAuthentication()
                                            .sendOTP(countrycode +
                                                emailcontroller.text);

                                        setState(() {
                                          displaytext = true;
                                        });
                                      },
                                      child: Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: Colors.white),
                                        child: Center(
                                          child: Text(
                                            "SEND OTP",
                                            style: GoogleFonts.nunitoSans(
                                              textStyle: const TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  letterSpacing: 0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                            ),
                      Box(height: 15, width: 0),
                      Container(
                        height: 50,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: TextField(
                            style: TextStyle(
                                color: kBackgroundColor, fontSize: 14),
                            cursorColor: kBackgroundColor,
                            controller: passwordcontroller,
                            // obscureText: !_password,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              // suffixIcon: IconButton(
                              //   icon: Icon(
                              //       _password
                              //           ? Icons.visibility
                              //           : Icons.visibility_off,
                              //       color: kBackgroundColor,
                              //       size: 18),
                              //   onPressed: () {
                              //     setState(() {
                              //       _password = !_password;
                              //     });
                              //   },
                              // ),
                              // labelText: 'OTP',
                              label: Center(child: Text("OTP")),

                              labelStyle: TextStyle(
                                  fontFamily: 'lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                      ),
                      Box(height: 10, width: 0),
                      GestureDetector(
                        onTap: () {
                          // Route route = MaterialPageRoute(
                          //     builder: (context) => ForgetPassword());
                          // Navigator.push(context, route);
                        },
                        child: Text(
                          "Forget Password ?",
                          style: GoogleFonts.nunitoSans(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.transparent,
                                fontSize: 14,
                                letterSpacing: 0),
                          ),
                        ),
                      ),
                      Box(height: 10, width: 0),
                      GestureDetector(
                        onTap: () {
                          emailcontroller.text.isNotEmpty &&
                                  passwordcontroller.text.isNotEmpty
                              ? FirebaseAuthentication().authenticateMe(
                                  temp, passwordcontroller.text, context)
                              : SizedBox();

                          // _loginform()
                          // : showDialog(
                          //     context: context,
                          //     builder: (c) {
                          //       return ErrorAlertDialog(
                          //           message: "Provide Email and Password");
                          //     });
                        },
                        child: Container(
                          height: 45,
                          width: 400,
                          child: Center(
                            child: Text(
                              "LOGIN",
                              style: GoogleFonts.nunitoSans(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 2),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(204, 191, 171, 1),
                              border: Border.all(
                                  color: Color.fromRGBO(204, 191, 171, 1))),
                        ),
                      ),
                      Box(height: 10, width: 0),
                      Box(height: 40, width: 0),
                    ],
                  ),
                  color: Colors.white),
            ),
          )),
    );
  }

  // Future<void> _loginform() async {
  //   User firebaseUser;
  //   await auth
  //       .signInWithEmailAndPassword(
  //           email: emailcontroller.text, password: passwordcontroller.text)
  //       .then((authUser) {
  //     var snackBar = SnackBar(
  //         backgroundColor: Colors.white,
  //         content: Container(
  //           height: 20,
  //           child: Center(
  //               child: Text(
  //             'LoggedIn Successfully',
  //             style: TextStyle(color: Colors.black, letterSpacing: 1),
  //           )),
  //         ));
  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     firebaseUser = authUser.user!;
  //     readData(firebaseUser);
  //   }).catchError((error) {
  //     Navigator.pop(context);
  //     // showDialog(
  //     //     context: context,
  //     //     builder: (c) {
  //     //       // return ErrorAlertDialog(
  //     //       //   message: error.message.toString(),
  //     //       // );
  //     //     });
  //   });
  // }

  // readData(User fUser) async {
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(fUser.uid)
  //       .get()
  //       .then((dataSnapshot) async {
  //     // MRANDMRS.firestore
  //     //     .collection("users")
  //     //     .doc(fUser.uid)
  //     //     .collection("CartItems")
  //     //     .get()
  //     //     .then((value) => value.docs.forEach((element) async {
  //     //           await MRANDMRS.sharedPreferences.setString(
  //     //               element.data()["title"],
  //     //               element.data()["Quantity"].toString());
  //     //           print(element.data()["title"]);

  //     //           print(element.data());
  //     //         }));
  //     await MRANDMRS.sharedprefs!.setString("uid", dataSnapshot.data()!["uid"]);
  //     await MRANDMRS.sharedprefs!
  //         .setString("email", dataSnapshot.data()!["email"]);
  //     await MRANDMRS.sharedprefs!
  //         .setString("name", dataSnapshot.data()!["name"]);
  //   }).whenComplete(() {
  //     Route route = MaterialPageRoute(builder: (context) => AccountScreen());
  //     Navigator.pushReplacement(context, route);
  //   });
  // }
}
