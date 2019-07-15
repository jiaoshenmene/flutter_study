import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';

import 'package:flutter_l1/fluro/components/home//home_component.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeComponent();
});
