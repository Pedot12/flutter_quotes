import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/controller/history_controller.dart';
import 'package:flutter_quotes/screen/history/history_loaded.dart';
import 'package:flutter_quotes/widgets/loading_screen_widget.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Sales Report'),),
      key: controller.scaffoldKey,
      
      body: SingleChildScrollView(
      child: GetBuilder<HistoryController>(
            init: controller,
            builder: (_) {
              return Column(
                children: [
                  if(controller.isLoadingEnabled)
                  LoadingScreenWidget(),

                  if(!controller.isLoadingEnabled)
                  if(controller.quoteModelList != null)
                  HistoryLoaded(controller: controller,)
                 
                ],
              );
              
            }),
    ),
    );
  }
}