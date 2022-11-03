// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mine/admin/Admin.dart';
// import 'package:mine/admin/admindashboard.dart';
// import 'package:mine/constants.dart';
// import 'package:mine/helpers/responsive_widget.dart';

// class AdminLogin extends StatefulWidget {
//   const AdminLogin({Key? key}) : super(key: key);

//   @override
//   State<AdminLogin> createState() => _AdminLoginState();
// }

// class _AdminLoginState extends State<AdminLogin> {
//   TextEditingController phonecontroller =  TextEditingController();
//   TextEditingController passwordcontroller =  TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ResponsiveWidget(
//         desktop: Container(
//             decoration: BoxDecoration(
//                 color: Colors.orange[100]!.withOpacity(0.5),
//                 image: DecorationImage(
//                     image: NetworkImage(
//                       "https://static.vecteezy.com/system/resources/previews/004/493/292/original/light-brown-gradient-background-free-photo.jpg"
//                       // "https://images.pexels.com/photos/3255761/pexels-photo-3255761.jpeg?auto=compress&cs=tinysrgb&w=600",
//                       // "https://images.pexels.com/photos/6985259/pexels-photo-6985259.jpeg"
//                     ),
//                     fit: BoxFit.cover)),
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Center(
//               child: Container(
//                 height: 270,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 30,
//                     ),
//                     Text(
//                       "Admin Login",
//                       style: GoogleFonts.nunitoSans(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 15,
//                             letterSpacing: 0),
//                       ),
//                     ),
//                        SizedBox(
//                       height: 10,
//                     )

//                     ,
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                             // color: Colors.blue[100]!.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(color: Colors.black)
//                           ),
                          
//                           child: Padding(
//                             padding: const EdgeInsets.only(left:10.0),
//                             child: TextField(
//                               style: TextStyle(
//                                   color: kBackgroundColor,
//                                   fontSize: 14),
//                               cursorColor: kBackgroundColor,
//                                controller: phonecontroller,
//                               keyboardType:
//                                   TextInputType.emailAddress,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                                 label: Text("  Phone Number"),
//                                 labelStyle: TextStyle(
//                                     fontFamily: 'lato',
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.black54),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
                    
                    
//                       Padding(
//                         padding: const EdgeInsets.only(left:20.0,right: 20),
//                         child: Container(
//                           height: 40,
//                           decoration: BoxDecoration(
//                             // color: Colors.blue[100]!.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(5),
//                             border: Border.all(color: Colors.black)
//                           ),
                          
//                           child: Padding(
//                             padding: const EdgeInsets.only(left:10.0),
//                             child: TextField(
//                               style: TextStyle(
//                                   color: kBackgroundColor,
//                                   fontSize: 14),
//                               cursorColor: kBackgroundColor,
//                                controller: passwordcontroller,
//                               keyboardType:
//                                   TextInputType.emailAddress,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 focusedBorder: InputBorder.none,
//                                 label: Text("  Password"),
//                                 labelStyle: TextStyle(
//                                     fontFamily: 'lato',
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.normal,
//                                     color: Colors.black54),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

                   
//                       Padding(
//                         padding: const EdgeInsets.all(20.0),
//                         child: InkWell(
//                           onTap: (){

                           
//                             phonecontroller.text == "7540032123" && passwordcontroller.text== "rms123" ? Get.to(Admin()) :
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                backgroundColor: Colors.white,
                           
//                                width: 300,
                            
                               
//                              behavior: SnackBarBehavior.floating,

//                              dismissDirection: DismissDirection.startToEnd,
                      
                               
//                                content: Container(
                             
//                                 height: 20,
//                                  child: Center(
//                                    child: Text('Something Went Wrong',  style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               fontSize: 14,
//                               letterSpacing: 0)), ),
//                                  ),
//                                ))
            
//             );                
//                                         },
//                           child: Container(
//                             child: Center(
//                               child:   Text(
//                                               "Login",
//                                               style: GoogleFonts.nunitoSans(
//                           textStyle: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               fontSize: 14,
//                               letterSpacing: 0),
//                                               ),
//                                             ),
//                             ),
//                             height: 40,
//                             decoration: BoxDecoration(
//                               // color: Colors.blue[100]!.withOpacity(0.2),
//                               color: Colors.black,
                        
//                               borderRadius: BorderRadius.circular(5),
//                               // border: Border.all(color: Colors.blue.shade50)
//                             ),
                            
                           
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)),
//                 width: 300,
//               ),
//             )),
//         mobile: Container(),
//         tab: Container(),
//       ),
//     );
//   }
// }
