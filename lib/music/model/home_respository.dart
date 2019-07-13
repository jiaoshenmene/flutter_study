import 'package:flutter_l1/music/api/net_utils.dart';
import 'package:flutter_l1/music/base/app_config.dart';
import 'package:flutter_l1/music/data/base.dart';
import 'package:rxdart/rxdart.dart';

class HomeService {
  // 获取列表
  Observable<BaseResponse> getSongs(
      dynamic request, Map<String, dynamic> query) {
    var url = 'api/song/list';
    var response = post(url, body: request, queryParameters: query);
    return response;
  }
}

class HomeRepo {
  final HomeService _remote = HomeService();

  Observable<BaseResponse> getSongs(Map<String, dynamic> query) {
    return _remote.getSongs(null, query);
  }
}
