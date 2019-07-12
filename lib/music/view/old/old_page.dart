import 'package:flutter/material.dart';

import 'package:provide/provide.dart';

import 'package:flutter_l1/music/viewmodel/Old/Old_provide.dart';
import 'package:flutter_l1/music/base/base.dart';

class OldPage extends PageProvideNode {
  OldPage() {
    mProviders.provide(Provider<OldProvide>.value(OldProvide()));
  }

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return _OldContentPage();
  }
}

class _OldContentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OldState();
  }
}

class _OldState extends State<_OldContentPage>
    with TickerProviderStateMixin<_OldContentPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('经典'),
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
