// // import 'dart:io' as io;
// // import 'dart:ui';
// // import 'package:firebase/firebase.dart' as fb;
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:universal_html/html.dart';

// class addcategory extends StatefulWidget {
//   @override
//   _addcategoryState createState() => _addcategoryState();
// }

// class _addcategoryState extends State<addcategory> {
//   String? imgurl;

//   void uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           imgurl = downloadUrl;
//           print(imgurl);
//         });
//       });
//     });
//   }

//   TextEditingController categorycontroller = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 2),
//             Padding(
//               padding: const EdgeInsets.only(top: 10.0, left: 50, right: 50),
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: Color.fromRGBO(230, 224, 215, 1),
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               height: 45,
//                               width: MediaQuery.of(context).size.width - 132,
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8.0),
//                                 child: TextField(
//                                   textCapitalization:
//                                       TextCapitalization.sentences,
//                                   style: TextStyle(color: Colors.black),
//                                   controller: categorycontroller,
//                                   keyboardType: TextInputType.name,
//                                   decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     labelText: "   CATEGORY NAME",
//                                     labelStyle: TextStyle(
//                                         color: Colors.black38,
//                                         fontSize: 12,
//                                         letterSpacing: 2),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       //SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: imgurl == null
//                                 ? GestureDetector(
//                                     onTap: () {
//                                       print(
//                                           categorycontroller.text.trim() + "2");
//                                       uploadtoStorage();
//                                     },
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(0),
//                                       child: Container(
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             color: Colors.white),
//                                         height: 150,
//                                         width:
//                                             MediaQuery.of(context).size.width -
//                                                 132,
//                                         child: Center(
//                                           child: Text(
//                                             "CHOOSE IMAGE",
//                                             style: GoogleFonts.nunitoSans(
//                                               textStyle: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.black38,
//                                                   fontSize: 12,
//                                                   letterSpacing: 2),
//                                             ),
//                                           ),
//                                         ),
//                                         //  child: Placeholder(
//                                         //     fallbackWidth:200,
//                                         //     fallbackHeight:200
//                                         //   ),
//                                       ),
//                                     ),
//                                   )
//                                 : Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                             height: 150,
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width -
//                                                 150,
//                                             child: Image.network(
//                                               imgurl.toString(),
//                                               fit: BoxFit.contain,
//                                             )),
//                                       ),
//                                     ],
//                                   ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(0.0),
//                             child: GestureDetector(
//                                 onTap: () {
//                                   FirebaseFirestore.instance
//                                       .collection("Category")
//                                       .doc(categorycontroller.text.toUpperCase()
//                                           .trim()
//                                           )
//                                       .set({
//                                     "image": imgurl,
//                                     "name": categorycontroller.text.toUpperCase()
//                                         .trim()
//                                       ,
//                                   }).whenComplete(() => EasyLoading.showToast(
//                                           "Category Added Successfully"));
//                                   //     .then((value) => Navigator.pop(context));
//                                   // Navigator.pop(context);

//                                   categorycontroller.clear();
//                                   setState(() {
//                                     imgurl = null;
//                                   });
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Upload",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.white,
//                                               fontSize: 16,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                     height: 40,
//                                     decoration: BoxDecoration(
//                                         color: Colors.black,
//                                         borderRadius: BorderRadius.circular(5)),
//                                   ),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
