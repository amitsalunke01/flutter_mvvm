import 'package:flutter/material.dart';


class DialogViewModel extends ChangeNotifier {
  String _addingData1 = "";
  String _addingData2 = "";

  String? get addingData1 => _addingData1;

  String? get addingData2 => _addingData2;

  void setData1(String addData) {
    _addingData1 = addData;
    print('${_addingData1}');
  }

  void setData2(String addData) {
    _addingData2 = addData;
    print('${_addingData2}');
  }

  Future<bool> addUser() async {
    if (isValid()) {
      print("Notify");
      notifyListeners();
      return true;
    } else {
      print("Enter text");
      return false;
    }
  }

  bool isValid() {
    if (_addingData1.toString() == "" && _addingData2.toString() == "") {
      print("Dialog Shared model : data 1 is empty");
      return false;
    } else {
      return true;
    }
  }
}
