import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_l1/music/base/app_config.dart';
import 'package:flutter_l1/music/base/base.dart';
import 'package:flutter_l1/music/data/song.dart';
import 'package:flutter_l1/music/model/home_respository.dart';
import 'package:flutter_l1/music/tools/player_tool.dart';

class HomeProvide extends BaseProvide {
  int _page = 0;

  int get page => _page;

  set page(int value) {
    _page = value;
  }

  final subjectMore = BehaviorSubject<bool>();

  bool _hasMore = false;

  bool get hasMore => _hasMore;

  set hasMore(bool value) {
    _hasMore = value;
    subjectMore.add(hasMore);
  }

  List<Song> _dataArr = [];

  List<Song> get dataArr => _dataArr;

  set dataArr(List<Song> value) {
    _dataArr = value;
  }

  notify() {
    notifyListeners();
  }

  final HomeRepo _repo = HomeRepo();

  Observable getSongs(bool isRefresh) {
    isRefresh ? this.page = 0 : this.page++;
    var query = {
      'page': this.page,
      'pageSize': 30,
      'orderkey': 'imgUrl',
      'sequence': true,
      'searchKey': '',
      'userId': AppConfig.userTools.getUserId()
    };

    return _repo
        .getSongs(query)
        .doOnData((result) {
          print(result.data);
          if (isRefresh) {
            this.dataArr.clear();
          }
          var arr = result.data as List;
          this.dataArr.addAll(arr.map((map) => Song.fromJson(map)));

          this.hasMore = result.total > this.dataArr.length;

          this.notify();
        })
        .doOnError((e, stacktrace) {})
        .doOnListen(() {})
        .doOnDone(() {});
  }
}
