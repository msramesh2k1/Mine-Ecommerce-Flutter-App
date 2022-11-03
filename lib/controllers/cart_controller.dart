import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../users/views/Helper.dart';


class CartController extends ChangeNotifier {
  int _cartvalue = 0;
  int get cartvalue => _cartvalue;

  void cartvaluefinder() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(MRANDMRS.sharedprefs!.getString("uid"))
        .collection("cart")
        .get()
        .then((QuerySnapshot querySnapshot) {
      print(querySnapshot);
      _cartvalue = querySnapshot.docs.length;
      print("CART VALUE" + _cartvalue.toString());
      notifyListeners();
    });
  }
}