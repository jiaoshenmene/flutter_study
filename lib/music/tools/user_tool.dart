import 'package:flutter_l1/music/base/const_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserTools {
  static UserTools _instance;

  static Future<UserTools> get instance async {
    return await getInstance();
  }

  static Future<UserTools> getInstance() async {
    if (_instance == null) {
      _instance = UserTools();
      await _instance._init();
    }
    return _instance;
  }

  static SharedPreferences _spf;

  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static bool _beforCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  // 储存用户数据
  Future<bool> setUserData(Map<String, dynamic> user) {
    if (_beforCheck()) return null;
    var jsonStr = json.encode(user);
    return _spf.setString(ConstConfig.CURRENT_USERDATA, jsonStr);
  }

  // 获取数据
  dynamic getUserData() {
    var mapStr = _spf.getString(ConstConfig.CURRENT_USERDATA);
    if (mapStr != null) {
      var map = json.decode(mapStr);
      return map;
    } else {
      return null;
    }
  }

  String getUserId() {
    var userData = this.getUserData();
    if (userData != null) {
      var user = userData as Map<String, dynamic>;
      return user['userId'];
    } else {
      return '';
    }
  }

  String getUserToken() {
    var userData = this.getUserData();
    if (userData != null) {
      var user = userData as Map<String, dynamic>;
      return user['token'];
    } else {
      return '';
    }
  }

  // 更新用户头像
  Future<Map<String, dynamic>> updateUserIcon(String icon) async {
    var userData = this.getUserData();
    if (userData != null) {
      var user = userData as Map<String, dynamic>;
      user['userPic'] = icon;
      await this.setUserData(user);
      return user;
    } else {
      return {};
    }
  }

  // 删除数据
  Future<bool> deleteUserData() {
    return _spf.setString(ConstConfig.CURRENT_USERDATA, null);
  }
}
