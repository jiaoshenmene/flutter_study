import 'package:flutter/material.dart';
import 'package:flutter_l1/statefull_group_page.dart';
import 'package:flutter_l1/flutter_layout_page.dart';
import 'package:flutter_l1/music/music_app.dart';

import 'package:flutter_l1/music/base/app_config.dart';

import 'package:flutter_l1/platform_channel/platform_channel.dart';
import 'package:flutter_l1/platform_view/platform_view.dart';
import 'package:flutter_l1/fluro/fluro_app.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        'ful': (BuildContext context) => StateFullGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'musicapp': (BuildContext context) => MusicApp(),
        'channel': (BuildContext context) => PlatformChannel(),
        'channel_view': (BuildContext context) => PlatformView(),
        'fluro_app': (BuildContext context) => FluroApp()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppConfig.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: RouteNavigator(),
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RouteNavigator();
}

class _RouteNavigator extends State<RouteNavigator> {
  bool byName = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'} 通过路由名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('StatefulWidget与基组件', StateFullGroup(), 'ful'),
          _item('Flutter布局', FlutterLayoutPage(), 'layout'),
          _item('MusicAPP', MusicApp(), 'musicapp'),
          _item('channel', PlatformChannel(), 'musicapp'),
          _item('channel_view', PlatformView(), 'channel_view'),
          _item('fluro_app', FluroApp(), 'fluro_app'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
