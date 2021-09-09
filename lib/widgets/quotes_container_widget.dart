import 'package:flutter/material.dart';
import 'package:flutter_quotes/controller/main_screen_controller.dart';

class QuotesContainerWidget extends StatelessWidget {
  const QuotesContainerWidget({Key key, this.controller}) : super(key: key);

  final MainScreenController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
              topLeft: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0)),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
               if (controller.isLoadingEnabled)
              Container(
                child: CircularProgressIndicator(),
              ),
              if (!controller.isLoadingEnabled)
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                  '${controller.quoteModel != null ? controller.quoteModel.quote :
                  controller.error}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    wordSpacing: 2.5
                  ),
                ),
              ),
              if (!controller.isLoadingEnabled)
              SizedBox(
                height: 15,
              ),
              if (!controller.isLoadingEnabled)
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0)),
                ),
                alignment: Alignment.bottomRight,
                child: Text(
                  '${controller.quoteModel != null ? controller.quoteModel.author :
                  'No Author'}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
