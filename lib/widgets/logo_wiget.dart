import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0)),
        ),
        child: Icon(Icons.format_quote_sharp, size: 80, color: Colors.white,),
      
    );
  }
}