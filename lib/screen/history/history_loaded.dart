import 'package:flutter/material.dart';
import 'package:flutter_quotes/adapter/history_adapter.dart';
import 'package:flutter_quotes/controller/history_controller.dart';

class HistoryLoaded extends StatelessWidget {
  HistoryLoaded({
    Key key,
    this.controller,
  }) : super(key: key);

  final HistoryController controller;

  @override
  Widget build(BuildContext context) {
    return 
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 84,
          child: ListView.builder(
            itemCount: controller.quoteModelList.length,
            itemBuilder: (context, index) {
              return HistoryAdapter(quoteModel: controller.quoteModelList[index],);
            },
          ),
        );
  }
}
