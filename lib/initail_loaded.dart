import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_quotes/repository/local/setup/db_helper.dart';
import 'package:flutter_quotes/routes/routes.dart';
import 'package:flutter_quotes/widgets/logo_wiget.dart';
import 'package:sqflite/sqflite.dart';

class InitialLoaded extends StatefulWidget {
  @override
  _InitialLoadedState createState() => _InitialLoadedState();
}

class _InitialLoadedState extends State<InitialLoaded> {
  bool _isVisible = false;
  Database database;
  @override
  void initState(){
    super.initState();
   
    SchedulerBinding.instance.addPostFrameCallback((_) => execInit());
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: _isVisible ? 1.0 : 0.0,
          child: LogoWidget(),
          onEnd: nextPage,
        ),
      ),
    );
  }

  void execInit() async {
     database = await DbHelper.getInstance();
    setState(() {
      _isVisible = true;
    });
  }

void nextPage() async {
  Navigator.pushReplacementNamed(context, Routes.SCREEN_MAIN);
}
}
