import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_l1/music/music_app_provide.dart';
import 'package:flutter_l1/music/base/base.dart';
import 'package:flutter_l1/music/music_app_provide.dart';
import 'package:flutter_l1/music/view/home/home_page.dart';
import 'package:flutter_l1/music/view/mine/mine_page.dart';
import 'package:flutter_l1/music/view/old/old_page.dart';
import 'package:flutter_l1/music/view/player/mini_player_page.dart';

class MusicApp extends PageProvideNode {
  MainProvide _provide = MainProvide.instance;

  MusicApp() {
    mProviders.provide(Provider<MainProvide>.value(_provide));
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _AppContentPage(_provide);
  }
}

class _AppContentPage extends StatefulWidget {
  MainProvide provide;

  _AppContentPage(this.provide);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppState();
  }
}

class _AppState extends State<_AppContentPage>
    with TickerProviderStateMixin<_AppContentPage> {
  MainProvide _mainProvide;

  TabController _controller;

  HomePage _home = HomePage();
  OldPage _old = OldPage();
  MinePage _mine = MinePage();
  MiniPlayerPage _miniPage = MiniPlayerPage();

  Animation<double> _animationMini;
  AnimationController _miniController;
  final _tranTween = Tween<double>(begin: 1, end: 0);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _mainProvide = widget.provide;

    _controller = TabController(length: 3, vsync: this);

    _miniController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animationMini =
        CurvedAnimation(parent: _miniController, curve: Curves.linear);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('app 释放');
  }

  ontap(int index) {
    _mainProvide.currentIndex = index;
    _controller.animateTo(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        overflow: Overflow.visible,
        children: <Widget>[_initTabBarView(), _initMiniPlayer()],
      ),
      bottomNavigationBar: _initBottomNavigationBar(),
    );
  }

  Provide<MainProvide> _initTabBarView() {
    return Provide<MainProvide>(
      builder: (BuildContext context, Widget child, MainProvide value) {
        return IndexedStack(
            index: _mainProvide.currentIndex,
            children: <Widget>[
              _home,
              _old,
              _mine,
            ]);
      },
    );
  }

  Provide<MainProvide> _initMiniPlayer() {
    return Provide<MainProvide>(
      builder: (BuildContext context, Widget child, MainProvide value) {
        return Visibility(
            visible: _mainProvide.showMini,
            child: FadeTransition(
              opacity: _tranTween.animate(_animationMini),
              child: Container(
                width: 80,
                height: 100,
                child: _miniPage,
              ),
            ));
      },
    );
  }

  Provide<MainProvide> _initBottomNavigationBar() {
    return Provide<MainProvide>(
        builder: (BuildContext context, Widget child, MainProvide value) {
      return Theme(
        data: ThemeData(
            canvasColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.grey))),
        child: BottomNavigationBar(
            fixedColor: Colors.black,
            currentIndex: _mainProvide.currentIndex,
            onTap: ontap,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_video), title: Text('推荐')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.music_note), title: Text('经典')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), title: Text('我的'))
            ]),
      );
    });
  }
}
