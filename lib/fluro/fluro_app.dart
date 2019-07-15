import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './config/routes.dart';
import './config/application.dart';

class FluroApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FluroAppState();
}

class _FluroAppState extends State<FluroApp> {
  _FluroAppState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final app = MaterialApp(
      title: 'Fluro',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: Application.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}
