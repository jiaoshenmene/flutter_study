import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_l1/music/viewmodel/mine/mine_provide.dart';
import 'package:flutter_l1/music/base/base.dart';

class MinePage extends PageProvideNode {
  MinePage() {
    mProviders.provide(Provider<MineProvide>.value(MineProvide()));
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _MineContentPage();
  }
}

class _MineContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineState();
  }
}

class _MineState extends State<_MineContentPage>
    with TickerProviderStateMixin<_MineContentPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Music'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
