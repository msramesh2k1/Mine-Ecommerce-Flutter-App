import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import '../users/views/Helper.dart';

class cartvalue extends ChangeNotifier {
  late int _cartvalue ;
  int get getcartvalue => _cartvalue;
  Future cartitemsvalues() async {
    FirebaseFirestore.instance
        .collection("items")
        .get()
        .then((QuerySnapshot querySnapshot) {
      _cartvalue = querySnapshot.docs.length;
      notifyListeners();
      MRANDMRS.sharedprefs!.setInt("cartvalue", querySnapshot.docs.length);
    });
  }
}