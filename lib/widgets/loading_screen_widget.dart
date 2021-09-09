
import 'package:flutter/material.dart';


class LoadingScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-84,
      child: Center(
        child: loadingIndicator(context,
            backgroundColor: Colors.white, textColor: Colors.black),
      ),
    );
  }


  static Widget loadingIndicator(BuildContext context,
      {String text, Color textColor, Color backgroundColor}) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: backgroundColor == null ? Color(0x88000000) : backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 25),
          Text(
            text == null ? 'Please wait' : text,
            style:
                TextStyle(color: textColor == null ? Colors.white : textColor),
          )
        ],
      ),
    );
  }
}

