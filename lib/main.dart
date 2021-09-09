// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_quotes/routes/routes.dart';
import 'package:flutter_quotes/screen/history/history_screen.dart';
import 'package:flutter_quotes/screen/main_screen.dart';

import 'initail_loaded.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      // initial is loading
      initialRoute: Routes.SCREEN_INITIAL,
      routes: {
        Routes.SCREEN_INITIAL: (context) => InitialLoaded(),
        Routes.SCREEN_MAIN: (context) => MainScreen(),
        Routes.SCREEN_HISTORY: (context) => HistoryScreen(),
      },
    );
  }
}
