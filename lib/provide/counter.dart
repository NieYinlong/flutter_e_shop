import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int value = 0;
  increment() {
    value++;
    notifyListeners(); // 通知观察者
  }

  subFunc() {
    value--;
    notifyListeners();
  }
}