import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  // private field for this class
  int _counter = 0;
  // constructor of this class
  CounterModel(this._counter);
  // getter method to get the value of counter
  int get counter => _counter;
  // function to increment the counter value
  void incrementCounter() {
    _counter++;

    // notify to update the UI
    notifyListeners();
    print("after notifylisteners");
  }
}
