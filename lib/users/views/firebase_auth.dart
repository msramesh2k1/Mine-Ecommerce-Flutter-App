import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mine/constants.dart';
import 'package:mine/users/views/AddAddress.dart';
import 'package:mine/users/views/Helper.dart';
import 'package:mine/users/views/HomePage.dart';
import 'package:mine/users/views/accountscree.dart';

class FirebaseAuthentication {
      final TextEditingController namecontroller = new TextEditingController();
      final TextEditingController registeremailcontroller = new TextEditingController();
  String phoneNumber = "";

  sendOTP(String phoneNumber) async {
    this.phoneNumber = phoneNumber;
    FirebaseAuth auth = FirebaseAuth.instance;
    ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
      '+91 $phoneNumber',
    );
    printMessage("OTP Sent to +91 $phoneNumber");
    MRANDMRS.sharedprefs!.setString("phno",phoneNumber.toString());
    return confirmationResult;
  }

  authenticateMe(ConfirmationResult confirmationResult, String otp,BuildContext context) async {
    UserCredential userCredential = await confirmationResult.confirm(otp);
    print("PHNO : " + MRANDMRS.sharedprefs!.getString('phno').toString()); // sme
   //sme
    userCredential.additionalUserInfo!.isNewUser
        ?     
      
        
        Get.dialog(
         
          Padding(
          padding: 

     MediaQuery.of(context).size.width > 1100 ?  
          
          const EdgeInsets.only(left:300.0,right: 300,top: 150,bottom: 150) :   const EdgeInsets.only(left:10.0,right: 10,top: 150,bottom: 150),
          child: Container(
            height: 800,
            width: 300,
            decoration: BoxDecoration(
                 color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5)
            ),

         
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
               Container(
                  height: 50,
                  color:Color.fromRGBO(204, 191, 171, 1),
                  child: Center(
                    child: Text(
                                  "Create User Account",
                                  style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: 14,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                  ),
                ),
                   SizedBox(height: 30,),
                         MyTextField(hint: "Name", controller: namecontroller, height: 45, width: 500),
                           SizedBox(height: 20,),    MyTextField(hint: "Email", controller: registeremailcontroller, height: 45, width: 500),
               
                  
                      //        Container(
                      //   height: 45,
                      //   width:500,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20.0),
                      //     child: TextField(
                      //       style: TextStyle(
                      //           color: kBackgroundColor, fontSize: 14),
                      //       cursorColor: kBackgroundColor,
                      //       controller: namecontroller,
                         
                      //       keyboardType: TextInputType.emailAddress,
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         focusedBorder: InputBorder.none,
                      //         // suffixIcon: IconButton(
                      //         //   icon: Icon(
                      //         //       _password
                      //         //           ? Icons.visibility
                      //         //           : Icons.visibility_off,
                      //         //       color: kBackgroundColor,
                      //         //       size: 18),
                      //         //   onPressed: () {
                      //         //     setState(() {
                      //         //       _password = !_password;
                      //         //     });
                      //         //   },
                      //         // ),
                      //         // labelText: 'OTP',
                      //         label: Center(child: Text("NAME")),
                              
                      //         labelStyle: TextStyle(
                      //             fontFamily: 'lato',
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.normal,
                      //             color: Colors.black54),
                      //       ),
                      //     ),
                      //   ),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.black)),
                      // ),
                   
                      //  Container(
                      //   height: 45,
                      //   width:500,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 10.0),
                      //     child: TextField(
                      //       style: TextStyle(
                      //           color: kBackgroundColor, fontSize: 14),
                      //       cursorColor: kBackgroundColor,
                      //       controller: registeremailcontroller,

                      //       keyboardType: TextInputType.emailAddress,
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         focusedBorder: InputBorder.none,
                      //         // suffixIcon: IconButton(
                      //         //   icon: Icon(
                      //         //       _password
                      //         //           ? Icons.visibility
                      //         //           : Icons.visibility_off,
                      //         //       color: kBackgroundColor,
                      //         //       size: 18),
                      //         //   onPressed: () {
                      //         //     setState(() {
                      //         //       _password = !_password;
                      //         //     });
                      //         //   },
                      //         // ),
                      //         // labelText: 'OTP',
                      //         label: Center(child: Text("EMAIL")),
                              
                      //         labelStyle: TextStyle(
                      //             fontFamily: 'lato',
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.normal,
                      //             color: Colors.black54),
                      //       ),
                      //     ),
                      //   ),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.black)),
                      // ),
                      SizedBox(height: 30,),
                      InkWell
                      (
                        onTap: (){


                        // print(MRANDMRS.sharedprefs!.getString("phno")); //sme
                           MRANDMRS.sharedprefs!.setString("uid", userCredential.user!.uid);
                            MRANDMRS.sharedprefs!.setString("email", registeremailcontroller.text.toString());
                            MRANDMRS.sharedprefs!.setString("name",namecontroller.text.toString());
                            // MRANDMRS.sharedprefs!.setString("phno",phoneNumber.toString());
                          print(userCredential.user!.uid);
                          print(registeremailcontroller.text.toString());
                          print(namecontroller.text.toString());
                          FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set({
                            "uid" : userCredential.user!.uid,
                            "email" : registeremailcontroller.text.toString(),
                            "name" : namecontroller.text.toString(),
                          "phno" : MRANDMRS.sharedprefs!.getString("phno")
                          

                          }).then((value) => {
                            Get.to(AccountScreen())
                          });
                         
                        },
                        
                        child: Container(
                          height: 45,
                          width: 500,
                           decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
    color: Color.fromRGBO(204, 191, 171, 1),
            ),
                         
                          child: Center(
                            child:  Text(
                                "REGISTER",
                                style: GoogleFonts.nunitoSans(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontSize: 16,
                                      letterSpacing: 2),
                                ),
                              ),
                      
                          ),
                        ),
                      ),

Spacer(),
                
              ],

            ),
            
          )),barrierDismissible: false,
          )
        : MRANDMRS.sharedprefs?.setString("uid",userCredential.user!.uid).then((value) {

          FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).get().then((value) {
          
          print(value.data());

           MRANDMRS.sharedprefs!.setString("uid", value.data()!['uid']);
           MRANDMRS.sharedprefs!.setString("name", value.data()!['name']);
           MRANDMRS.sharedprefs!.setString("email", value.data()!['email']);
             MRANDMRS.sharedprefs!.setString("phno", value.data()!['phno']);

          //  MRANDMRS.sharedprefs!.setString("phno", )

           Get.to(AccountScreen());
          }

           
           
           
           
           
           );

        });
        
        
       
  }

  printMessage(String msg) {
    debugPrint(msg);
  }
}