import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/controller/main_screen_controller.dart';
import 'package:flutter_quotes/routes/routes.dart';

class QuotesTabWidget extends StatelessWidget {
  const QuotesTabWidget({Key key, this.controller}) : super(key: key);

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: (Container(
        margin: EdgeInsets.only(left: 10, right: 15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                    onPressed: () {
                      controller.exectQuotes();
                    }, icon: Icon(Icons.replay_rounded)),
             IconButton(
                    onPressed: () {
                      controller.saveQuote(context);
                    }, icon: Icon(Icons.download_outlined)),
            Badge(
                badgeContent: Text(
                  controller.totalHistory.toString(),
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500),
                ),
                child: IconButton(onPressed: () {
                  Navigator.pushNamed(context, Routes.SCREEN_HISTORY);
                }, icon: Icon(Icons.history))),
          ],
        ),
      )),
    );
  }
}
