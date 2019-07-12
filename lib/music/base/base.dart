import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:rxdart/rxdart.dart';

class BaseProvide with ChangeNotifier {
  CompositeSubscription compositeSubscription = CompositeSubscription();

  addSubscription(StreamSubscription subscription) {
    compositeSubscription.add(subscription);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    compositeSubscription.dispose();
  }
}

abstract class PageProvideNode extends StatelessWidget {
  final Providers mProviders = Providers();

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ProviderNode(child: buildContent(context), providers: mProviders);
  }
}
