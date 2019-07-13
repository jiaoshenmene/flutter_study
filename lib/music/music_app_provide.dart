import 'package:flutter_l1/music/base/base.dart';

class MainProvide extends BaseProvide {
  factory MainProvide() => _getInstance();

  static MainProvide get instance => _getInstance();
  static MainProvide _instance;

  static MainProvide _getInstance() {
    if (_instance == null) {
      _instance = new MainProvide._internal();
    }
    return _instance;
  }

  MainProvide._internal() {
    // 初始化
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    notify();
  }

  bool _showMini = false;

  bool get showMini => _showMini;

  set showMini(bool value) {
    _showMini = value;
    notify();
  }

  notify() {
    notifyListeners();
  }
}
