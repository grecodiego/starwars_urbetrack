import 'package:flutter/material.dart';

class SwitchModel extends ChangeNotifier {
  bool _switchValue = false;

  bool get switchValue => _switchValue;

  void changeValue(value) {
    _switchValue = !value;
    notifyListeners();
  }
}
