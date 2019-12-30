import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:be_alive/parameters.dart';
import 'package:be_alive/auth_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays ([]);
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'BeAlive',
      theme: ThemeData(
          primaryColorLight: BeColors.green,
          primaryColor: BeColors.primary,
          primaryColorDark: BeColors.darkGreen),
      home: AuthPage(),
    );
  }
}
