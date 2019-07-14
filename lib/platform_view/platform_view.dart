import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';

class PlatformView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Platform View',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: MyHomePage(title: 'Platform View'),
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
  static const MethodChannel _methodChannel =
      MethodChannel('samples.flutter.io/platform_view');

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _launchPlatformCount() async {
    final int platformCounter =
        await _methodChannel.invokeMethod('switchView', _counter);
    setState(() {
      _counter = platformCounter;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(18.0),
                    child: RaisedButton(
                        child: Platform.isIOS
                            ? Text('Continue in iOS view')
                            : Text('Continue in Android view'),
                        onPressed: _launchPlatformCount),
                  )
                ],
              ),
            )),
            Container(
              padding: EdgeInsets.only(bottom: 15, left: 5),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/flutter-mark-square-64.png',
                    scale: 1.5,
                  ),
                  Text(
                    'Flutter',
                    style: TextStyle(fontSize: 30.0),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
}
