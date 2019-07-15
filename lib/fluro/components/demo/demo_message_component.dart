import 'package:flutter/material.dart';

class DemoMessageComponent extends StatelessWidget {
  final String message;
  final Color color;

  DemoMessageComponent(Key key, this.message,
      [this.color = const Color(0xFFFFFFFF)])
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: this.color,
      child: Center(
        child: Text(
          message,
          style: TextStyle(fontFamily: 'Lazer84'),
        ),
      ),
    );
  }
}
