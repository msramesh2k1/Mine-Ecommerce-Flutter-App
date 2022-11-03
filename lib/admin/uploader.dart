// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:enhanced_drop_down/enhanced_drop_down.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:developer';
// import 'dart:ui';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:universal_html/html.dart';

// import '../Widgets/helper.dart';
// import 'helper.dart';

// class AdminPanel extends StatefulWidget {
//   const AdminPanel({key}) : super(key: key);

//   @override
//   _AdminPanelState createState() => _AdminPanelState();
// }

// class _AdminPanelState extends State<AdminPanel> {
//   ScrollController _imagecontroller = ScrollController();
//   String? image1url;
//   ScrollController woodcontroller = ScrollController();

//   int? fileno;
//   int? linkno;
//   int? requireno;
//   int? expenseno;

//   String? image2url;
//   String? selected = '';
//   String? image3url;
//   bool permiumselected = false;
//   String? image4url;
//   String? image5url;
//   String? image6url;
//   String? image7url;
//   String? image8url;
//   String? image9url;
//   String? fileurl = "";
//   String? image10url;
//   TextEditingController opricecontroller = new TextEditingController();
//   TextEditingController commentscontroller = new TextEditingController();
//   TextEditingController qnocontroller = new TextEditingController();
//   TextEditingController itemcontroller = new TextEditingController();
//   TextEditingController linkcontroller = new TextEditingController();
//   TextEditingController pricecontroller = new TextEditingController();
//   TextEditingController categorycontroller = new TextEditingController();
//   TextEditingController expensecontroller = new TextEditingController();
//   TextEditingController productidcontroller = new TextEditingController();
//   TextEditingController hdimensioncontroller = new TextEditingController();
//   TextEditingController wdimensioncontroller = new TextEditingController();
//   TextEditingController ldimensioncontroller = new TextEditingController();
//   TextEditingController weightcontroller = new TextEditingController();
//   TextEditingController ratecontroller = new TextEditingController();
//   TextEditingController aratecontroller = new TextEditingController();
//   TextEditingController cuftcontroller = new TextEditingController();
//   TextEditingController warrantycontroller = new TextEditingController();
//   TextEditingController tdimensioncontroller = new TextEditingController();
//   TextEditingController witemdimensioncontroller = new TextEditingController();
//   TextEditingController litemdimensioncontroller = new TextEditingController();
//   TextEditingController serialcontroller = new TextEditingController();

//   void image1uploadtoStorage() {
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
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image1url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("1")
//                 .set({"name": "1", "imgurl": image1url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("1")
//                 .set({"name": "1", "imgurl": image1url});
//           });
//           return "d";
//         });
//       });
//     });
//     // print("Hello Coder");
//   }

//   void image2uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image2url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("2")
//                 .set({"name": "2", "imgurl": image2url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("2")
//                 .set({"name": "2", "imgurl": image2url});
//           });
//           return "d";
//         });
//       });
//     });
//   }

//   void image3uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image3url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("3")
//                 .set({"name": "3", "imgurl": image3url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("3")
//                 .set({"name": "3", "imgurl": image3url});
//           });
//           return "s";
//         });
//       });
//     });
//   }

//   void image4uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image4url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("4")
//                 .set({"name": "4", "imgurl": image4url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("4")
//                 .set({"name": "4", "imgurl": image4url});
//           });
//           return "d";
//         });
//       });
//     });
//   }

//   void image5uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image5url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("5")
//                 .set({"name": "5", "imgurl": image5url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("5")
//                 .set({"name": "5", "imgurl": image5url});
//           });
//           return "f";
//         });
//       });
//     });
//   }

//   void image6uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image6url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("6")
//                 .set({"name": "6", "imgurl": image6url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("6")
//                 .set({"name": "6", "imgurl": image6url});
//           });
//           return "d";
//         });
//       });
//     });
//   }

//   void image7uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image7url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("7")
//                 .set({"name": "7", "imgurl": image7url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("7")
//                 .set({"name": "7", "imgurl": image7url});
//           });
//           return "d";
//         });
//       });
//     });
//   }

//   void image8uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image8url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("8")
//                 .set({"name": "8", "imgurl": image8url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("8")
//                 .set({"name": "8", "imgurl": image8url});
//           });
//           return "f";
//         });
//       });
//     });
//   }

//   void image9uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image9url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("9")
//                 .set({"name": "9", "imgurl": image9url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("9")
//                 .set({"name": "9", "imgurl": image9url});
//           });
//           return "D";
//         });
//       });
//     });
//   }

//   void image10uploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
//       final file = uploadInput.files?.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file!);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fsv
//             .ref()
//             .child(DateTime.now().toIso8601String())
//             .putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL().then((value) {
//           setState(() {
//             image10url = value;
//             FirebaseFirestore.instance
//                 .collection("SearchProducts")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("10")
//                 .set({"name": "10", "imgurl": image10url});
//             FirebaseFirestore.instance
//                 .collection("Products")
//                 .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                 .collection("Images")
//                 .doc("10")
//                 .set({"name": "10", "imgurl": image10url});
//           });
//           return "d";
//         });
//       });
//     });
//   }

//   List<String> category= [];
//   List<String> reqwoodlist = [];
//   List<String> expense = [];
//   String? _mainimageurl;
//   PageController pagecontroller = PageController(initialPage: 0);
//   String categoryseperator = "";

//   String? reqwoodtype;
//   String? expensetype;

//   String? _topimageurl;
//   String? _sideimageurl;
//   TextEditingController descriptioncontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();

//   void sideuploadtoStorage() {
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
//           _sideimageurl = downloadUrl;
//         });
//       });
//     });
//   }

//   void topuploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
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
//           _topimageurl = downloadUrl;
//         });
//       });
//     });
//   }

//   int no = 0;

//   void setfileno(String docid) {
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(docid)
//         .collection("files")
//         .get()
//         .then((count) {
//       setState(() {
//         // print(docid);
//         // print("no"+count.size.toString());
//         fileno = count.size;
//         print("finwlno" + fileno.toString());
//       });
//     });
//   }

//   void setrequireno(String docid) {
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(docid)
//         .collection("materials")
//         .get()
//         .then((count) {
//       setState(() {
//         requireno = count.size;
//       });
//     });
//   }

//   void setexpenseno(String docid) {
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(docid)
//         .collection("others")
//         .get()
//         .then((count) {
//       setState(() {
//         expenseno = count.size;
//       });
//     });
//   }

//   void setlinkno(String docid) {
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .doc(docid)
//         .collection("links")
//         .get()
//         .then((count) {
//       setState(() {
//         print(docid);
//         print("no" + count.size.toString());
//         linkno = count.size;
//         print("finwlno" + fileno.toString());
//       });
//     });
//   }

//   void setno(String name) {
//     FirebaseFirestore.instance
//         .collection("SearchProducts")
//         .where("category", isEqualTo: name)
//         .get()
//         .then((value) {
//       setState(() {
//         no = value.docs.length + 1;
//       });
//       print("No of Docs" + value.size.toString());
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     print(DateTime.now().toIso8601String());

//     FirebaseFirestore.instance.collection("Woods").get().then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           reqwoodlist.add(element.data()['name']);
//           // print(reqwoodlist);
//         });
//       });
//     });
//     FirebaseFirestore.instance.collection("Expense").get().then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           expense.add(element.data()['name']);
//         });
//       });
//     });

//     FirebaseFirestore.instance.collection("Category").get().then((value) {
//       value.docs.forEach((element) {
//         setState(() {
//           category.add(element.data()['name']);
//         });
//       });
//     });
//   }

//   void mainuploadtoStorage() {
//     var uploadInput = FileUploadInputElement()..accept = 'image/*';

//     FirebaseStorage fsv = FirebaseStorage.instance;

//     uploadInput.click();
//     uploadInput.onChange.listen((event) {
//       // print("io"+name);
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
//           _mainimageurl = downloadUrl;
//           FirebaseFirestore.instance
//               .collection("SearchProducts")
//               .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//               .collection("Images")
//               .doc("0")
//               .set({"name": "0", "imgurl": _mainimageurl});
//           FirebaseFirestore.instance
//               .collection("Products")
//               .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//               .collection("Images")
//               .doc("0")
//               .set({"name": "0", "imgurl": _mainimageurl});
//         });
//       });
//     });
//   }

// //CONSTcategorytype+" - "+no.toString().padLeft(4, '0')
//   String? categorytype;
//   List<String> _woodlist = [];

//   @override
//   Widget build(BuildContext context) {
//     final node = FocusScope.of(context);
//     bool firstpage = true;
//     bool lastpage = true;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.black,
//               size: 15,
//             )),
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: WidgetHelper.subtext("Upload Items", 16, Colors.black),
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
//           child: SingleChildScrollView(
//             child: Container(
//               color: Colors.grey[100],
//               child: Column(
//                 // controller: pagecontroller,
//                 // physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   Container(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext(
//                                 "Category :", 12, Colors.black),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             DropdownButton<String>(
//                               dropdownColor: Colors.white,
//                               focusNode: FocusNode(skipTraversal: true),
//                               hint: Text("Select Category"),
//                               value: categorytype,
//                               onChanged: (String? Value) {
//                                 setState(() {
//                                   categorytype = Value;
//                                   setno(Value!);
//                                 });
//                               },
//                               items: category.map((String category) {
//                                 return DropdownMenuItem<String>(
//                                   value: category,
//                                   child: Text(
//                                     category,
//                                     style: TextStyle(color: Colors.black),
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext(
//                                 "Product ID :", 12, Colors.black),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext(no.toString().padLeft(4, '0'),
//                                 12, Colors.black),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext("Premium :", 12, Colors.black),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   permiumselected = !permiumselected;
//                                 });
//                               },
//                               child: Container(
//                                 height: 20,
//                                 width: 20,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: permiumselected
//                                         ? Colors.green
//                                         : Colors.grey),
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext("Name :", 12, Colors.black),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8)),
//                                 width: 200,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 8,
//                                     right: 8,
//                                     bottom: 2,
//                                   ),
//                                   child: RawKeyboardListener(
//                                     focusNode: FocusNode(),
//                                     onKey: (event) {
//                                       if (event.isKeyPressed(
//                                           LogicalKeyboardKey.tab)) {
//                                         // Do something
//                                         node.nextFocus();
//                                       }
//                                     },
//                                     child: TextField(
//                                       maxLength: 26,
//                                       // maxLengthEnforced: true,

//                                       // textCapitalization:
//                                       //     TextCapitalization.sentences,
//                                       style: TextStyle(color: Colors.black),
//                                       controller: namecontroller,
//                                       keyboardType: TextInputType.name,
//                                       decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: "NAME",
//                                         hintStyle: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             letterSpacing: 2),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext(
//                                 "Description :", 12, Colors.black),
//                             SizedBox(
//                               width: 2,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Container(
//                                 height: 50,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(8)),
//                                 width: 400,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                     left: 8,
//                                     right: 8,
//                                     bottom: 2,
//                                   ),
//                                   child: RawKeyboardListener(
//                                     focusNode: FocusNode(),
//                                     onKey: (event) {
//                                       if (event.isKeyPressed(
//                                           LogicalKeyboardKey.tab)) {
//                                         // Do something
//                                         node.nextFocus();
//                                       }
//                                     },
//                                     child: TextField(
//                                       // textCapitalization:
//                                       //     TextCapitalization.sentences,
//                                       style: TextStyle(color: Colors.black),
//                                       controller: descriptioncontroller,
//                                       keyboardType: TextInputType.name,
//                                       decoration: InputDecoration(
//                                         border: InputBorder.none,
//                                         hintText: "Description",
//                                         hintStyle: TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 12,
//                                             letterSpacing: 2),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: 20,
//                             ),
//                             WidgetHelper.subtext(
//                                 "Select Wood : ", 12, Colors.black),
//                             // SizedBox(
//                             //   width: 10,
//                             // ),
//                             //   GestureDetector(
//                             //     onTap: (){

//                             //       //note
//                             //       showModalBottomSheet(
//                             //         // barrierColor: Colors.white,
//                             //         backgroundColor: Colors.white,
//                             //         context: context, builder: (b){
//                             //         return Container(height: 500,

//                             //         color: Colors.white,
//                             //         child: addwood(),
//                             //         );
//                             //       });
//                             //     },
//                             //     child: Icon(Icons.add_circle,color: Colors.black)
//                             //   ),
//                             //   SizedBox(width: 10,),

//                             Container(
//                               constraints: BoxConstraints(maxWidth: 800),
//                               child: WidgetHelper.subtext(
//                                   _woodlist
//                                       .toString()
//                                       .replaceAll("[", "")
//                                       .replaceAll("]", ""),
//                                   12,
//                                   Colors.black),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.arrow_back_ios,
//                                   size: 14,
//                                   color: Colors.black,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     woodcontroller.animateTo(
//                                         woodcontroller.offset - 50,
//                                         duration: Duration(milliseconds: 200),
//                                         curve: Curves.ease);
//                                   });
//                                 }),
//                             IconButton(
//                                 icon: Icon(
//                                   Icons.arrow_forward_ios,
//                                   size: 14,
//                                   color: Colors.black,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     woodcontroller.animateTo(
//                                         woodcontroller.offset + 50,
//                                         duration: Duration(milliseconds: 200),
//                                         curve: Curves.ease);
//                                   });
//                                 })
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               top: 8.0, left: 28, right: 8, bottom: 5),
//                           child: Container(
//                             height: 90,
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 1.0, right: 1.0, top: 1, bottom: 1),
//                               child: Container(
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey[100],
//                                     borderRadius: BorderRadius.circular(4)),
//                                 child: Container(
//                                   height: 70,
//                                   child: StreamBuilder<QuerySnapshot>(
//                                       stream: FirebaseFirestore.instance
//                                           .collection("Woods")
//                                           .snapshots(),
//                                       builder: (context, snapshot) {
//                                         if (!snapshot.hasData) {
//                                           return Center(
//                                             child: CircularProgressIndicator(),
//                                           );
//                                         } else {
//                                           return Scrollbar(
//                                             child: ListView.builder(
//                                                 controller: woodcontroller,
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                                 //                     gridDelegate:
//                                                 // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 11),

//                                                 itemCount:
//                                                     snapshot.data?.docs.length,
//                                                 itemBuilder:
//                                                     (BuildContext context,
//                                                         int index) {
//                                                   return Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 10,
//                                                             right: 10,
//                                                             top: 3),
//                                                     child: GestureDetector(
//                                                       onTap: () {},
//                                                       child: Container(
//                                                         decoration: BoxDecoration(
//                                                             color: Colors
//                                                                 .transparent,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         4)),
//                                                         height: 55,
//                                                         width: 70,
//                                                         child: Column(
//                                                           children: [
//                                                             Container(
//                                                               child: IconButton(
//                                                                   //TODO
//                                                                   onPressed:
//                                                                       () {
//                                                                     if (_woodlist.contains(snapshot
//                                                                             .data!
//                                                                             .docs[index]
//                                                                         [
//                                                                         'name'])) {
//                                                                       setState(
//                                                                           () {
//                                                                         FirebaseFirestore
//                                                                             .instance
//                                                                             .collection(
//                                                                                 "SearchProducts")
//                                                                             .doc(categorytype! +
//                                                                                 " - " +
//                                                                                 no.toString().padLeft(4, '0'))
//                                                                             .collection("WoodList")
//                                                                             .doc(snapshot.data!.docs[index]['name'])
//                                                                             .delete();
//                                                                         FirebaseFirestore
//                                                                             .instance
//                                                                             .collection(
//                                                                                 "Products")
//                                                                             .doc(categorytype! +
//                                                                                 " - " +
//                                                                                 no.toString().padLeft(4, '0'))
//                                                                             .collection("WoodList")
//                                                                             .doc(snapshot.data!.docs[index]['name'])
//                                                                             .delete();
//                                                                         _woodlist.remove(snapshot
//                                                                             .data!
//                                                                             .docs[index]['name']);
//                                                                       });
//                                                                     } else {
//                                                                       setState(
//                                                                           () {
//                                                                         _woodlist.add(snapshot
//                                                                             .data!
//                                                                             .docs[index]['name']);
//                                                                         FirebaseFirestore
//                                                                             .instance
//                                                                             .collection(
//                                                                                 "SearchProducts")
//                                                                             .doc(categorytype! +
//                                                                                 " - " +
//                                                                                 no.toString().padLeft(4, '0'))
//                                                                             .collection("WoodList")
//                                                                             .doc(snapshot.data!.docs[index]['name'])
//                                                                             .set({
//                                                                           "name": snapshot
//                                                                               .data!
//                                                                               .docs[index]['name'],
//                                                                           "image": snapshot
//                                                                               .data!
//                                                                               .docs[index]['image']
//                                                                         });
//                                                                         FirebaseFirestore
//                                                                             .instance
//                                                                             .collection(
//                                                                                 "Products")
//                                                                             .doc(categorytype! +
//                                                                                 " - " +
//                                                                                 no.toString().padLeft(4, '0'))
//                                                                             .collection("WoodList")
//                                                                             .doc(snapshot.data!.docs[index]['name'])
//                                                                             .set({
//                                                                           "name": snapshot
//                                                                               .data!
//                                                                               .docs[index]['name'],
//                                                                           "image": snapshot
//                                                                               .data!
//                                                                               .docs[index]['image']
//                                                                         });
//                                                                       });
//                                                                     }
//                                                                   },
//                                                                   icon: Icon(
//                                                                       _woodlist.contains(snapshot.data!.docs[index]
//                                                                               [
//                                                                               'name'])
//                                                                           ? Icons
//                                                                               .remove_circle_outline
//                                                                           : Icons
//                                                                               .add_circle_outline,
//                                                                       size: 20,
//                                                                       color: Colors
//                                                                           .white)),
//                                                               height: 60,
//                                                               width: 280,
//                                                               decoration: BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               4),
//                                                                   color: Colors
//                                                                       .white,
//                                                                   image: DecorationImage(
//                                                                       image: NetworkImage(snapshot
//                                                                               .data!
//                                                                               .docs[index]
//                                                                           [
//                                                                           'image']),
//                                                                       fit: BoxFit
//                                                                           .cover)),
//                                                             ),
//                                                             Center(
//                                                               child: Text(
//                                                                 snapshot
//                                                                     .data!
//                                                                     .docs[index]
//                                                                         ['name']
//                                                                     .toUpperCase(),
//                                                                 style:
//                                                                     GoogleFonts
//                                                                         .lato(
//                                                                   textStyle: TextStyle(
//                                                                       fontWeight:
//                                                                           FontWeight
//                                                                               .w700,
//                                                                       color: Colors
//                                                                           .black,
//                                                                       fontSize:
//                                                                           8,
//                                                                       letterSpacing:
//                                                                           1),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   );
//                                                 }),
//                                           );
//                                         }
//                                       }),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   //

//                   secondpage(),
//                   thirdpage()
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget secondpage() {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 8,
//           ),
//           Column(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       WidgetHelper.subtext("Main Image : ", 13, Colors.black),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   _mainimageurl == null
//                       ? Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 mainuploadtoStorage();
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(5)),
//                                 height: 100,
//                                 width: 100,
//                                 child: Center(
//                                   child: Text(
//                                     "Main Image",
//                                     style: GoogleFonts.nunitoSans(
//                                       textStyle: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 10,
//                                           letterSpacing: 0),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )
//                       : Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: Colors.white),
//                                 height: 100,
//                                 width: 100,
//                                 child: Image.network(
//                                   _mainimageurl!,
//                                   fit: BoxFit.contain,
//                                 )),
//                           ],
//                         ),
//                 ],
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 20,
//               ),
//               WidgetHelper.subtext("Specification Images : ", 13, Colors.black),
//             ],
//           ),
//           SizedBox(height: 10),
//           Row(
//             children: [
//               _topimageurl == null
//                   ? Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             topuploadtoStorage();
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               SizedBox(width: 13),
//                               Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: Colors.white),
//                                 height: 100,
//                                 width: 100,
//                                 child: Center(
//                                   child: Text(
//                                     "Top Image",
//                                     style: GoogleFonts.nunitoSans(
//                                       textStyle: TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.black,
//                                           fontSize: 10,
//                                           letterSpacing: 0),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                   : Row(
//                       children: [
//                         SizedBox(
//                           width: 17,
//                         ),
//                         Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.white),
//                             height: 100,
//                             width: 100,
//                             child: Image.network(
//                               _topimageurl!,
//                               fit: BoxFit.contain,
//                             )),
//                         SizedBox(height: 20),
//                       ],
//                     ),
//               SizedBox(
//                 width: 10,
//               ),
//               _sideimageurl == null
//                   ? GestureDetector(
//                       onTap: () {
//                         sideuploadtoStorage();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Colors.white),
//                         height: 100,
//                         width: 100,
//                         child: Center(
//                           child: Text(
//                             "Side Image",
//                             style: GoogleFonts.nunitoSans(
//                               textStyle: TextStyle(
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black,
//                                   fontSize: 10,
//                                   letterSpacing: 0),
//                             ),
//                           ),
//                         ),
//                         //  child: Placeholder(
//                         //     fallbackWidth:100,
//                         //     fallbackHeight:100
//                         //   ),
//                       ),
//                     )
//                   : Row(
//                       children: [
//                         SizedBox(
//                           width: 17,
//                         ),
//                         Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(5),
//                                 color: Colors.white),
//                             height: 100,
//                             width: 100,
//                             child: Image.network(
//                               _sideimageurl!,
//                               fit: BoxFit.contain,
//                             )),
//                       ],
//                     ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               SizedBox(width: 25),
//               Text(
//                 "Images",
//                 style: GoogleFonts.nunitoSans(
//                   textStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                       fontSize: 16,
//                       letterSpacing: 0),
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             // width: ,
//             height: 10,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                     icon: Icon(
//                       Icons.arrow_back_ios,
//                       size: 14,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       _imagecontroller.animateTo(_imagecontroller.offset - 50,
//                           duration: Duration(milliseconds: 200),
//                           curve: Curves.ease);
//                     }),
//                 IconButton(
//                     icon: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 14,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       _imagecontroller.animateTo(_imagecontroller.offset + 50,
//                           duration: Duration(milliseconds: 200),
//                           curve: Curves.ease);
//                     })
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                   borderRadius: BorderRadius.circular(4)),
//               // height: 220,
//               child: SingleChildScrollView(
//                 controller: _imagecontroller,
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image1url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image1uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image1url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image2url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image2uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image2url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image3url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image3uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image3url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image4url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image4uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image4url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image5url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image5uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image5url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image6url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image6uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image6url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image7url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image7uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image7url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image8url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image8uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image8url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image9url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image9uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image9url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           image10url == null
//                               ? GestureDetector(
//                                   onTap: () {
//                                     image10uploadtoStorage();
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.circular(5)),
//                                     height: 100,
//                                     width: 100,
//                                     child: Center(
//                                       child: Text(
//                                         "Choose Image",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 10,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 100,
//                                   width: 300,
//                                   child: Image.network(
//                                     image10url!,
//                                     fit: BoxFit.contain,
//                                   )),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget thirdpage() {
//     return Container(
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       SizedBox(
//         height: 20,
//       ),
//       Row(
//         children: [
//           SizedBox(width: 20),
//           Text(
//             "Model Details",
//             style: GoogleFonts.nunitoSans(
//               textStyle: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 16,
//                   letterSpacing: 0),
//             ),
//           ),
//         ],
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Column(
//               children: [
//                 Text(
//                   " W ",
//                   style: GoogleFonts.lato(
//                     textStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 16,
//                         letterSpacing: 2),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(4)),
//                     width: 60,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: TextField(
//                         // textCapitalization: TextCapitalization.sentences,
//                         style: TextStyle(color: Colors.black),
//                         controller: wdimensioncontroller,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           labelText: "W",
//                           labelStyle: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Text(
//                   " T ",
//                   style: GoogleFonts.lato(
//                     textStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 16,
//                         letterSpacing: 2),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(4)),
//                     width: 60,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: TextField(
//                         // textCapitalization: TextCapitalization.sentences,
//                         style: TextStyle(color: Colors.black),
//                         controller: hdimensioncontroller,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           labelText: "T",
//                           labelStyle: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Text(
//                   " L ",
//                   style: GoogleFonts.lato(
//                     textStyle: TextStyle(
//                         fontWeight: FontWeight.normal,
//                         color: Colors.black,
//                         fontSize: 16,
//                         letterSpacing: 2),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(4)),
//                     width: 60,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: TextField(
//                         // textCapitalization: TextCapitalization.sentences,
//                         style: TextStyle(color: Colors.black),
//                         controller: ldimensioncontroller,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           labelText: "L",
//                           labelStyle: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12,
//                               letterSpacing: 2),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(4)),
//               width: 150,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: TextField(
//                   // textCapitalization: TextCapitalization.sentences,
//                   style: TextStyle(color: Colors.black),
//                   controller: weightcontroller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     labelText: "WEIGHT",
//                     labelStyle: TextStyle(
//                         color: Colors.black, fontSize: 12, letterSpacing: 2),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//        Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(4)),
//               width: 150,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: TextField(
//                   // textCapitalization: TextCapitalization.sentences,
//                   style: TextStyle(color: Colors.black),
//                   controller: opricecontroller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     labelText: "PRICE",
//                     labelStyle: TextStyle(
//                         color: Colors.black, fontSize: 12, letterSpacing: 2),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//            Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(4)),
//               width: 150,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: TextField(
//                   // textCapitalization: TextCapitalization.sentences,
//                   style: TextStyle(color: Colors.black),
//                   controller: pricecontroller,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     labelText: "OFFER PRICE",
//                     labelStyle: TextStyle(
//                         color: Colors.black, fontSize: 12, letterSpacing: 2),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             GestureDetector(
//                 onTap: () async {
// // print(no);
//                   setfileno(
//                       categorytype! + " - " + no.toString().padLeft(4, '0'));
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Dialog(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           elevation: 0,
//                           backgroundColor: Colors.transparent,
//                           child: Container(
//                             width: 300,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Column(
//                               children: <Widget>[
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   "Files",
//                                   style: GoogleFonts.nunitoSans(
//                                     textStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                         letterSpacing: 0),
//                                   ),
//                                 ),

//                                 // 999
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       var uploadInput = FileUploadInputElement()
//                                         ..accept = 'file/*';

//                                       FirebaseStorage fsv =
//                                           FirebaseStorage.instance;

//                                       uploadInput.click();
//                                       uploadInput.onChange.listen((event) {
//                                         final file = uploadInput.files?.first;
//                                         final reader = FileReader();
//                                         reader.readAsDataUrl(file!);
//                                         reader.onLoadEnd.listen((event) async {
//                                           var snapshot = await fsv
//                                               .ref()
//                                               .child(DateTime.now()
//                                                   .toIso8601String())
//                                               .putBlob(file);
//                                           String downloadUrl = await snapshot
//                                               .ref
//                                               .getDownloadURL();
//                                           setState(() {
//                                             fileurl = downloadUrl;
//                                             FirebaseFirestore.instance
//                                                 .collection("Products")
//                                                 .doc(categorytype! +
//                                                     " - " +
//                                                     no
//                                                         .toString()
//                                                         .padLeft(4, '0'))
//                                                 .collection("files")
//                                                 .doc(fileno.toString())
//                                                 .set({
//                                               "no": fileno.toString(),
//                                               "file": fileurl,
//                                             });
//                                             FirebaseFirestore.instance
//                                                 .collection("SearchProducts")
//                                                 .doc(categorytype! +
//                                                     " - " +
//                                                     no
//                                                         .toString()
//                                                         .padLeft(4, '0'))
//                                                 .collection("files")
//                                                 .doc(fileno.toString())
//                                                 .set({
//                                               "no": fileno.toString(),
//                                               "file": fileurl,
//                                             }).whenComplete(() {
//                                               print(
//                                                   "File Uploaded Successfully");
//                                               // Toast.show(
//                                               //     "File Uploaded Successfully",
//                                               //     context,
//                                               //     duration: Toast.LENGTH_SHORT,
//                                               //     gravity: Toast.BOTTOM);
//                                             }).then((value) {
//                                               serialcontroller.clear();

//                                               setState(() {
//                                                 fileurl = "";
//                                               });
//                                               Navigator.pop(context);
//                                             });

//                                             // print("HIHIHI" + fileurl);
//                                           });
//                                         });
//                                       });
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(4),
//                                         color: Colors.grey[100],
//                                       ),
//                                       child: Row(
//                                         children: [
//                                           SizedBox(
//                                             width: 5,
//                                           ),
//                                           Center(
//                                             child: Text(
//                                               "Choose file",
//                                               style: GoogleFonts.nunitoSans(
//                                                 textStyle: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.black38,
//                                                     fontSize: 14,
//                                                     letterSpacing: 0),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       height: 34,
//                                       width: 120,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 },
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.attach_file,
//                                 color: Colors.black54,
//                               ),
//                               Text(
//                                 "Add Files",
//                                 style: GoogleFonts.nunitoSans(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black54,
//                                       fontSize: 13,
//                                       letterSpacing: 0),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             // border: Border.all(
//                             //     color: Colors.black),
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                     ),
//                   ],
//                 )),
//             GestureDetector(
//                 onTap: () async {
// // print(no);
//                   setlinkno(
//                       categorytype! + " - " + no.toString().padLeft(4, '0'));
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Dialog(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           elevation: 0,
//                           backgroundColor: Colors.transparent,
//                           child: Container(
//                             width: 300,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.rectangle,
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Column(
//                               children: <Widget>[
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   "Video links",
//                                   style: GoogleFonts.nunitoSans(
//                                     textStyle: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                         letterSpacing: 0),
//                                   ),
//                                 ),

//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     height: 50,
//                                     width: 500,
//                                     decoration: BoxDecoration(
//                                         color: Colors.grey[100],
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0),
//                                       child: TextField(
//                                         textCapitalization:
//                                             TextCapitalization.sentences,
//                                         style: TextStyle(color: Colors.black),
//                                         controller: linkcontroller,
//                                         keyboardType: TextInputType.name,
//                                         decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                           labelText: "Links",
//                                           labelStyle: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 12,
//                                               letterSpacing: 2),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),

//                                 // 999
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       {
//                                         setState(() {
//                                           FirebaseFirestore.instance
//                                               .collection("Products")
//                                               .doc(categorytype! +
//                                                   " - " +
//                                                   no.toString().padLeft(4, '0'))
//                                               .collection("links")
//                                               .doc(linkno.toString())
//                                               .set({
//                                             "time": linkno.toString(),
//                                             "link":
//                                                 linkcontroller.text.toString(),
//                                           });

//                                           FirebaseFirestore.instance
//                                               .collection("SearchProducts")
//                                               .doc(categorytype! +
//                                                   " - " +
//                                                   no.toString().padLeft(4, '0'))
//                                               .collection("links")
//                                               .doc(linkno.toString())
//                                               .set({
//                                             "time": linkno.toString(),
//                                             "link":
//                                                 linkcontroller.text.toString(),
//                                           }).whenComplete(() {
//                                             print("Raj");
//                                             // Toast.show(
//                                             //     "Link Uploaded Successfully",
//                                             //     context,
//                                             //     duration: Toast.LENGTH_SHORT,
//                                             //     gravity: Toast.BOTTOM);
//                                           }).then((value) {
//                                             linkcontroller.clear();

//                                             Navigator.pop(context);
//                                           });
//                                         });
//                                       }
//                                     },
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(4),
//                                         color: Colors.black,
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "Upload",
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                                 fontSize: 14,
//                                                 letterSpacing: 0),
//                                           ),
//                                         ),
//                                       ),
//                                       height: 34,
//                                       width: 120,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 },
//                 child: Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.attach_file,
//                                 color: Colors.black54,
//                               ),
//                               Text(
//                                 "Add Video",
//                                 style: GoogleFonts.nunitoSans(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black54,
//                                       fontSize: 13,
//                                       letterSpacing: 0),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         height: 40,
//                         width: 100,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             // border: Border.all(
//                             //     color: Colors.black),
//                             borderRadius: BorderRadius.circular(4)),
//                       ),
//                     ),
//                   ],
//                 )),
//             GestureDetector(
//               onTap: () {
//                 setrequireno(
//                     categorytype! + " - " + no.toString().padLeft(4, '0'));
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return Dialog(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         elevation: 0,
//                         backgroundColor: Colors.transparent,
//                         child: Container(
//                           height: 355,
//                           width: 432,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Column(
//                             children: <Widget>[
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Text(
//                                 "Requirement List",
//                                 style: GoogleFonts.nunitoSans(
//                                   textStyle: TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       color: Colors.black,
//                                       fontSize: 18,
//                                       letterSpacing: 0),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(width: 10),
//                                   EnhancedDropDown.withData(
//                                       dropdownLabelTitle: "",
//                                       dataSource: _woodlist,
//                                       defaultOptionText: "",
//                                       valueReturned: (chosen) {
//                                         //  print(chosen);
//                                         setState(() {
//                                           reqwoodtype = chosen;
//                                         });
//                                       }),
//                                   SizedBox(
//                                     width: 10,
//                                   ),

//                                   // child: Container(
//                                   //   height: 50,
//                                   //   decoration: BoxDecoration(
//                                   //       color: Colors.grey[100],
//                                   //       borderRadius:
//                                   //           BorderRadius.circular(4)),
//                                   //   width: 160,
//                                   //   child: Padding(
//                                   //     padding: const EdgeInsets.symmetric(
//                                   //         horizontal: 8.0),
//                                   //     child: TextField(
//                                   //       textCapitalization:
//                                   //           TextCapitalization.sentences,
//                                   //       style:
//                                   //           TextStyle(color: Colors.black),
//                                   //       controller: itemcontroller,
//                                   //       keyboardType: TextInputType.text,
//                                   //       decoration: InputDecoration(
//                                   //         border: InputBorder.none,
//                                   //         labelText: "Type of Wood",
//                                   //         labelStyle: TextStyle(
//                                   //             color: Colors.black,
//                                   //             fontSize: 12,
//                                   //            ),
//                                   //       ),
//                                   //     ),
//                                   //   ),
//                                   // ),

//                                   Row(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           height: 50,
//                                           width: 200,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[100],
//                                               borderRadius:
//                                                   BorderRadius.circular(4)),
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8.0),
//                                             child: TextField(
//                                               textCapitalization:
//                                                   TextCapitalization.sentences,
//                                               style: TextStyle(
//                                                   color: Colors.black),
//                                               controller: commentscontroller,
//                                               keyboardType: TextInputType.name,
//                                               decoration: InputDecoration(
//                                                 border: InputBorder.none,
//                                                 labelText: "Description",
//                                                 labelStyle: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 12,
//                                                     letterSpacing: 0),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text(
//                                         " W ",
//                                         style: GoogleFonts.lato(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 16,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Container(
//                                           height: 50,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[100],
//                                               borderRadius:
//                                                   BorderRadius.circular(4)),
//                                           width: 60,
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8.0),
//                                             child: TextField(
//                                               // textCapitalization: TextCapitalization.sentences,
//                                               style: TextStyle(
//                                                   color: Colors.black),
//                                               controller:
//                                                   witemdimensioncontroller,
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               decoration: InputDecoration(
//                                                 border: InputBorder.none,
//                                                 labelText: "W",
//                                                 labelStyle: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 12,
//                                                     letterSpacing: 0),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         " T ",
//                                         style: GoogleFonts.lato(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 16,
//                                               letterSpacing: 2),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Container(
//                                           height: 50,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[100],
//                                               borderRadius:
//                                                   BorderRadius.circular(4)),
//                                           width: 60,
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8.0),
//                                             child: TextField(
//                                               // textCapitalization: TextCapitalization.sentences,
//                                               style: TextStyle(
//                                                   color: Colors.black),
//                                               controller: tdimensioncontroller,
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               decoration: InputDecoration(
//                                                 border: InputBorder.none,
//                                                 labelText: "T",
//                                                 labelStyle: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 12,
//                                                     letterSpacing: 0),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       Text(
//                                         " L ",
//                                         style: GoogleFonts.lato(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black,
//                                               fontSize: 16,
//                                               letterSpacing: 2),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Container(
//                                           height: 50,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey[100],
//                                               borderRadius:
//                                                   BorderRadius.circular(4)),
//                                           width: 60,
//                                           child: Padding(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 8.0),
//                                             child: TextField(
//                                               // textCapitalization: TextCapitalization.sentences,
//                                               style: TextStyle(
//                                                   color: Colors.black),
//                                               controller:
//                                                   litemdimensioncontroller,
//                                               keyboardType:
//                                                   TextInputType.number,
//                                               decoration: InputDecoration(
//                                                 border: InputBorder.none,
//                                                 labelText: "L",
//                                                 labelStyle: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 12,
//                                                     letterSpacing: 0),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Container(
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                           color: Colors.grey[100],
//                                           borderRadius:
//                                               BorderRadius.circular(4)),
//                                       width: 60,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8.0),
//                                         child: TextField(
//                                           textCapitalization:
//                                               TextCapitalization.sentences,
//                                           style: TextStyle(color: Colors.black),
//                                           controller: qnocontroller,
//                                           keyboardType: TextInputType.name,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             labelText: "NO.Q",
//                                             labelStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 letterSpacing: 0),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: Container(
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                           color: Colors.grey[100],
//                                           borderRadius:
//                                               BorderRadius.circular(4)),
//                                       width: 60,
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8.0),
//                                         child: TextField(
//                                           // textCapitalization: TextCapitalization.sentences,
//                                           style: TextStyle(color: Colors.black),
//                                           controller: ratecontroller,
//                                           keyboardType: TextInputType.number,
//                                           decoration: InputDecoration(
//                                             border: InputBorder.none,
//                                             labelText: "Rate",
//                                             labelStyle: TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 12,
//                                                 letterSpacing: 0),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               GestureDetector(
//                                   onTap: () {
//                                     FirebaseFirestore.instance
//                                         .collection("Products")
//                                         .doc(categorytype! +
//                                             " - " +
//                                             no.toString().padLeft(4, '0'))
//                                         .collection("materials")
//                                         .doc(requireno.toString())
//                                         .set({
//                                       "serial": requireno.toString(),
//                                       "name": reqwoodtype,
//                                       "rate": double.parse(
//                                           ratecontroller.value.text),
//                                       "quantity": double.parse(
//                                           qnocontroller.value.text),
//                                       "tvalue": double.parse(
//                                           tdimensioncontroller.value.text),
//                                       "wvalue": double.parse(
//                                           witemdimensioncontroller.value.text),
//                                       "lvalue": double.parse(
//                                           litemdimensioncontroller.value.text),
//                                       "comments":
//                                           commentscontroller.text.toString()
//                                     });
//                                     FirebaseFirestore.instance
//                                         .collection("SearchProducts")
//                                         .doc(categorytype! +
//                                             " - " +
//                                             no.toString().padLeft(4, '0'))
//                                         .collection("materials")
//                                         .doc(requireno.toString())
//                                         .set({
//                                       "serial": requireno.toString(),
//                                       "name": reqwoodtype,
//                                       "rate": double.parse(
//                                           ratecontroller.value.text),
//                                       "quantity": double.parse(
//                                           qnocontroller.value.text),
//                                       "tvalue": double.parse(
//                                           tdimensioncontroller.value.text),
//                                       "wvalue": double.parse(
//                                           witemdimensioncontroller.value.text),
//                                       "lvalue": double.parse(
//                                           litemdimensioncontroller.value.text),
//                                       "comments":
//                                           commentscontroller.text.toString()
//                                     }).whenComplete(() {
//                                       print("jsd");
//                                     }).then((value) => Navigator.pop(context));
//                                     serialcontroller.clear();
//                                     itemcontroller.clear();
//                                     qnocontroller.clear();
//                                     tdimensioncontroller.clear();
//                                     witemdimensioncontroller.clear();
//                                     litemdimensioncontroller.clear();
//                                     commentscontroller.clear();
//                                     ratecontroller.clear();
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: Container(
//                                       child: Center(
//                                         child: Text(
//                                           "Upload",
//                                           style: GoogleFonts.nunitoSans(
//                                             textStyle: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                                 fontSize: 16,
//                                                 letterSpacing: 0),
//                                           ),
//                                         ),
//                                       ),
//                                       height: 34,
//                                       width: 120,
//                                       decoration: BoxDecoration(
//                                           color: Colors.black,
//                                           borderRadius:
//                                               BorderRadius.circular(4)),
//                                     ),
//                                   )),
//                             ],
//                           ),
//                         ),
//                       );
//                     });
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.attach_file,
//                           color: Colors.black54,
//                         ),
//                         Text(
//                           "Add Requirements",
//                           style: GoogleFonts.nunitoSans(
//                             textStyle: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54,
//                                 fontSize: 13,
//                                 letterSpacing: 0),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   height: 40,
//                   width: 150,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       // border: Border.all(
//                       //     color: Colors.black),
//                       borderRadius: BorderRadius.circular(4)),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 setexpenseno(
//                     categorytype! + " - " + no.toString().padLeft(4, '0'));

//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection("Expense")
//                             .snapshots(),
//                         builder: (BuildContext context, snapshots) {
//                           List<String> expenses = [];
//                           // snapshots.data!.docs.forEach((element) {
//                           //   //  setState(() {
//                           //   expenses.add(element.data()['name']);
//                           //   // });

//                           //   //  print("HLO"+element.data()['name']);
//                           // });

//                           return Dialog(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 0,
//                             backgroundColor: Colors.transparent,
//                             child: Container(
//                               height: 300,
//                               width: 410,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.rectangle,
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Column(
//                                 // mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Other Expenses",
//                                         style: GoogleFonts.nunitoSans(
//                                           textStyle: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black,
//                                               fontSize: 18,
//                                               letterSpacing: 0),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       GestureDetector(
//                                           onTap: () {
//                                             showModalBottomSheet(
//                                                 context: context,
//                                                 builder: (b) {
//                                                   return Container(
//                                                     height: 150,
//                                                     color: Colors.white,
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(8.0),
//                                                           child: Container(
//                                                             height: 45,
//                                                             width: 150,
//                                                             decoration: BoxDecoration(
//                                                                 color: Colors
//                                                                     .grey[200],
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             4)),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets
//                                                                       .symmetric(
//                                                                   horizontal:
//                                                                       8.0),
//                                                               child: TextField(
//                                                                 textCapitalization:
//                                                                     TextCapitalization
//                                                                         .sentences,
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .black),
//                                                                 controller:
//                                                                     expensecontroller,
//                                                                 keyboardType:
//                                                                     TextInputType
//                                                                         .name,
//                                                                 decoration:
//                                                                     InputDecoration(
//                                                                   border:
//                                                                       InputBorder
//                                                                           .none,
//                                                                   labelText:
//                                                                       "Expense Type",
//                                                                   labelStyle: TextStyle(
//                                                                       color: Colors
//                                                                           .black54,
//                                                                       fontSize:
//                                                                           12,
//                                                                       letterSpacing:
//                                                                           0),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         GestureDetector(
//                                                           onTap: () {
//                                                             FirebaseFirestore
//                                                                 .instance
//                                                                 .collection(
//                                                                     "Expense")
//                                                                 .doc(expensecontroller
//                                                                     .text
//                                                                     .toUpperCase()
//                                                                     .trim()
//                                                                     .toString())
//                                                                 .set({
//                                                               "name": expensecontroller
//                                                                   .text
//                                                                   .toUpperCase()
//                                                                   .trim()
//                                                                   .toString()
//                                                             }).whenComplete(() {
//                                                               Navigator.pop(
//                                                                   context);
//                                                               Navigator.pop(
//                                                                   context);
//                                                               // Navigator.pop(context);
//                                                             });
//                                                           },
//                                                           child: Container(
//                                                             height: 45,
//                                                             width: 100,
//                                                             decoration: BoxDecoration(
//                                                                 color: Colors
//                                                                     .black,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10)),
//                                                             child: Center(
//                                                               child:
//                                                                   WidgetHelper
//                                                                       .subtext(
//                                                                 "Update",
//                                                                 12,
//                                                                 Colors.white,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 });
//                                           },
//                                           child: Icon(
//                                             Icons.add_circle_outline,
//                                             color: Colors.black,
//                                           )),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 12,
//                                   ),
//                                   // Container(
//                                   //   child: StreamBuilder(
//                                   //     builder: (BuildContext context , snapshots){
//                                   //       return ListView.builder(
//                                   //         scrollDirection: Axis.horizontal,
//                                   //         itemCount: snapshots.data.docs.length,
//                                   //         itemBuilder: (BuildContext context, int index){
//                                   //         return Padding(
//                                   //           padding: const EdgeInsets.only(left:5.0,right: 5,top: 20,bottom: 20),
//                                   //           child: GestureDetector(
//                                   //             onTap: (){
//                                   //               setState(() {

//                                   //                                                               selected = snapshots.data.docs[index]['name'];
//                                   //                                                             });
//                                   //             },
//                                   //             child: Container(
//                                   //               child: Center(child: WidgetHelper.subtext(snapshots.data.docs[index]['name'],10,Colors.black),),
//                                   //               height: 30,width: 100,
//                                   //        decoration: BoxDecoration(
//                                   //              color: selected == snapshots.data.docs[index]['name'] ? Colors.green[100] : Colors.white,
//                                   //              borderRadius: BorderRadius.circular(10)
//                                   //              ,
//                                   //              border: Border.all(color: Colors.black),

//                                   //        ),),
//                                   //           ),
//                                   //         );
//                                   //       });
//                                   //     },
//                                   //     stream: FirebaseFirestore.instance.collection("Expense").snapshots(),),
//                                   // height: 100,
//                                   // decoration: BoxDecoration(
//                                   //   color: Colors.grey[100],

//                                   //   borderRadius: BorderRadius.circular(10),

//                                   // ),

//                                   // ),

//                                   Column(
//                                     children: [
//                                       SizedBox(width: 10),
//                                       EnhancedDropDown.withData(
//                                           dropdownLabelTitle: "",
//                                           dataSource: expenses,
//                                           defaultOptionText: "",
//                                           valueReturned: (chosen) {
//                                             //  print(chosen);
//                                             setState(() {
//                                               expensetype = chosen;
//                                             });
//                                           }),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Container(
//                                               height: 50,
//                                               width: 200,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.grey[100],
//                                                   borderRadius:
//                                                       BorderRadius.circular(4)),
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.symmetric(
//                                                         horizontal: 8.0),
//                                                 child: TextField(
//                                                   textCapitalization:
//                                                       TextCapitalization
//                                                           .sentences,
//                                                   style: TextStyle(
//                                                       color: Colors.black),
//                                                   controller: ratecontroller,
//                                                   keyboardType:
//                                                       TextInputType.name,
//                                                   decoration: InputDecoration(
//                                                     border: InputBorder.none,
//                                                     labelText: "Price",
//                                                     labelStyle: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 12,
//                                                         letterSpacing: 0),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   GestureDetector(
//                                       onTap: () {
//                                         FirebaseFirestore.instance
//                                             .collection("Products")
//                                             .doc(categorytype! +
//                                                 " - " +
//                                                 no.toString().padLeft(4, '0'))
//                                             .collection("others")
//                                             .doc(expenseno.toString())
//                                             .set({
//                                           "serial": expenseno.toString(),
//                                           "rate": double.parse(
//                                               ratecontroller.value.text),
//                                           "comments": expensetype
//                                         });
//                                         FirebaseFirestore.instance
//                                             .collection("SearchProducts")
//                                             .doc(categorytype! +
//                                                 " - " +
//                                                 no.toString().padLeft(4, '0'))
//                                             .collection("others")
//                                             .doc(expenseno.toString())
//                                             .set({
//                                               "serial": expenseno.toString(),
//                                               "rate": double.parse(
//                                                   ratecontroller.value.text),
//                                               "comments": expensetype
//                                             })
//                                             .whenComplete(
//                                                 () => {print("Sjkdss")})
//                                             .then((value) =>
//                                                 Navigator.pop(context));
//                                         serialcontroller.clear();
//                                         itemcontroller.clear();
//                                         qnocontroller.clear();
//                                         tdimensioncontroller.clear();
//                                         witemdimensioncontroller.clear();
//                                         litemdimensioncontroller.clear();
//                                         commentscontroller.clear();
//                                         ratecontroller.clear();
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(10.0),
//                                         child: Container(
//                                           child: Center(
//                                             child: Text(
//                                               "Upload",
//                                               style: GoogleFonts.nunitoSans(
//                                                 textStyle: TextStyle(
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.white,
//                                                     fontSize: 16,
//                                                     letterSpacing: 0),
//                                               ),
//                                             ),
//                                           ),
//                                           height: 34,
//                                           width: 120,
//                                           decoration: BoxDecoration(
//                                               color: Colors.black,
//                                               borderRadius:
//                                                   BorderRadius.circular(4)),
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     });
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   child: Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.attach_file,
//                           color: Colors.black54,
//                         ),
//                         Text(
//                           "Other Expenses",
//                           style: GoogleFonts.nunitoSans(
//                             textStyle: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black54,
//                                 fontSize: 13,
//                                 letterSpacing: 0),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   height: 40,
//                   width: 150,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       // border: Border.all(
//                       //     color: Colors.black),
//                       borderRadius: BorderRadius.circular(4)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       Row(
//         children: [
//           SizedBox(
//             width: 180,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(13.0),
//             child: GestureDetector(
//               onTap: () {
//                 String name = namecontroller.text.toLowerCase().toString();
//                 List names = name.split(" ");

//                 FirebaseFirestore.instance
//                     .collection("Products")
//                     .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                     .set({
//                   "Description": descriptioncontroller.text.trim(),
//                   "publishedDate": DateTime.now(),
//                   "oprice": int.tryParse(pricecontroller.text),
//                   "price" :int.tryParse(opricecontroller.text),
//                   "permium" : permiumselected,
//                   "category": categorytype,
//                   "name": namecontroller.text.toString(),
//                   "id": categorytype! + " - " + no.toString().padLeft(4, '0'),
//                   "topimage": _topimageurl,
//                   "sideimage": _sideimageurl,
//                   "mainimage": _mainimageurl,
//                   "search": names,
//                   "height": hdimensioncontroller.text.toString(),
//                   "width": wdimensioncontroller.text.toString(),
//                   "lenght": ldimensioncontroller.text.toString(),
//                   "weight": weightcontroller.text.toString(),
//                   "warranty": warrantycontroller.text.toString(),
//                   "index": namecontroller.text.toLowerCase().toString(),
//                 });

//                 FirebaseFirestore.instance
//                     .collection("SearchProducts")
//                     .doc(categorytype! + " - " + no.toString().padLeft(4, '0'))
//                     .set({
//                   "Description": descriptioncontroller.text.trim(),
//                   "publishedDate": DateTime.now(),
//                     "oprice": int.tryParse(pricecontroller.text),
//                   "price" :int.tryParse(opricecontroller.text),
//                   "category": categorytype,
//                   "name": namecontroller.text.toString(),
//                   "id": categorytype! + " - " + no.toString().padLeft(4, '0'),
//                   "topimage": _topimageurl,
//                   "sideimage": _sideimageurl,
//                   "mainimage": _mainimageurl,
//                     "permium" : permiumselected,
                   
//                   "search": names,
//                   "height": hdimensioncontroller.text.toString(),
//                   "width": wdimensioncontroller.text.toString(),
//                   "lenght": ldimensioncontroller.text.toString(),
//                   "weight": weightcontroller.text.toString(),
//                   "warranty": warrantycontroller.text.toString(),
//                   "index": namecontroller.text.toLowerCase().toString(),
//                 }).whenComplete(() {
//                   Navigator.pop(context);
//                 });
//               },
//               child: Container(
//                 height: 35,
//                 decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(3)),
//                 child: Center(
//                   child:
//                       WidgetHelper.subtext("Upload Product", 14, Colors.white),
//                 ),
//                 width: 150,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ]));
//   }
// }
