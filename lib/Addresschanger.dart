import 'package:flutter/cupertino.dart';

class AddressChanger with ChangeNotifier
{
  
  int _counter = 0 ;
  int get count => _counter;
  displayResult(int v){
    print(_counter);
    _counter = v;
    notifyListeners();
  }

}

