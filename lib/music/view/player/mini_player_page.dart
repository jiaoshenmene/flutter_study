import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_l1/music/viewmodel/player/player_provide.dart';
import 'package:flutter_l1/music/base/base.dart';

class MiniPlayerPage extends PageProvideNode {
  PlayerProvide provide = PlayerProvide();

  MiniPlayerPage() {
    mProviders.provide(Provider<PlayerProvide>.value(provide));
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _MiniPlayerContentPage(provide);
  }
}

class _MiniPlayerContentPage extends StatefulWidget {
  PlayerProvide provide = PlayerProvide();

  _MiniPlayerContentPage(this.provide);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MiniPlayerState();
  }
}

class _MiniPlayerState extends State<_MiniPlayerContentPage>
    with TickerProviderStateMixin<_MiniPlayerContentPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Text');
  }
}
