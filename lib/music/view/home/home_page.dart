import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_l1/music/viewmodel/home/home_provide.dart';
import 'package:flutter_l1/music/base/base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends PageProvideNode {
  HomeProvide _provide = HomeProvide();

  HomePage() {
    mProviders.provide(Provider<HomeProvide>.value(_provide));
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _HomeContentPage(_provide);
  }
}

class _HomeContentPage extends StatefulWidget {
  HomeProvide _provide;

  _HomeContentPage(this._provide);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<_HomeContentPage>
    with TickerProviderStateMixin<_HomeContentPage> {
  final _subscriptions = CompositeSubscription();

  HomeProvide _provide;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _provide ??= widget._provide;
    print('首页 创建');
    _loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('首页释放');
  }

  _loadData([bool isRefresh = true]) {
    var s = _provide
        .getSongs(isRefresh)
        .doOnListen(() {})
        .doOnCancel(() {})
        .listen((data) {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('推荐歌曲'),
        leading:
            IconButton(icon: Icon(Icons.my_location), onPressed: _pushSaved),
        centerTitle: true,
      ),
    );
  }

  _pushSaved() {}
}
