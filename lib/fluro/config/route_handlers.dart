import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:flutter_l1/fluro/components/home//home_component.dart';
import 'package:flutter_l1/fluro/helpers/color_helpers.dart';
import 'package:flutter_l1/fluro/components/demo/demo_simple_component.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeComponent();
});

var demoRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String message = params['message']?.first;
  String colorHex = params['color_hex']?.first;
  String result = params['result']?.first;

  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = Color(ColorHelpers.fromHexString(colorHex));
  }
  return DemoSimpleComponent(
    message: message,
    color: color,
    result: result,
  );
});

var demoFunctionHandler = Handler(
  type: HandlerType.function,
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String message = params['message']?.first;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Hey Hey!',
            style: TextStyle(
                color: Color(0xFF00D6F7),
                fontFamily: 'Lazer84',
                fontSize: 22.0),
          ),
          content: Text('$message'),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text('Ok'),
              ),
            )
          ],
        );
      },
    );
  },
);

var deepLinkHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String colorHex = params['color_hex']?.first;
  String result = params['result']?.first;
  Color color = Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = Color(ColorHelpers.fromHexString(colorHex));
  }
  return DemoSimpleComponent(
    message: 'DEEEEEP LINK!!!',
    color: color,
    result: result,
  );
});
