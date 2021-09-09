import 'package:flutter/material.dart';
import 'package:flutter_quotes/model/quote_model.dart';

class HistoryAdapter extends StatelessWidget {
  const HistoryAdapter({Key key, this.quoteModel}) : super(key: key);

  final QuoteModel quoteModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, right: 12, bottom: 12),
        child: Column(
          children: [
            Container(
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
              Container(
                alignment: Alignment.topRight,
                child: Text(
                 quoteModel.dateSaved,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),

               SizedBox(
                height: 5,
              ),

              Container(
                 margin: EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                child: Text(
                 quoteModel.quote,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    wordSpacing: 2.5
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                  quoteModel.author,
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
          ],
        ),
      ),
    );
  }
}
