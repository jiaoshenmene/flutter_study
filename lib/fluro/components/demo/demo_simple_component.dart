import 'package:flutter/material.dart';
import 'package:flutter_l1/fluro/helpers/color_helpers.dart';

class DemoSimpleComponent extends StatelessWidget {
  final String message;
  final Color color;
  final String result;

  DemoSimpleComponent(
      {this.message, this.color = const Color(0xFFFFFFFF), this.result});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/acc_boom.png'),
            color: ColorHelpers.blackOrWhiteContrastColor(color),
            width: 260.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 15),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorHelpers.blackOrWhiteContrastColor(color),
                  height: 2.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: 42.0),
              child: FlatButton(
                highlightColor:
                    ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(17),
                splashColor:
                    ColorHelpers.blackOrWhiteContrastColor(color).withAlpha(34),
                onPressed: () {
                  if (result == null) {
                    Navigator.pop(context);
                  } else {
                    Navigator.pop(context, result);
                  }
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: ColorHelpers.blackOrWhiteContrastColor(color),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
