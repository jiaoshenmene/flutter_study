import 'package:flutter_l1/music/base/base.dart';

class MainProvide extends BaseProvide {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notify();
  }

  notify() {
    notifyListeners();
  }
}
