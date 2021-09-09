import 'package:flutter/material.dart';
import 'package:flutter_quotes/controller/main_screen_controller.dart';
import 'package:flutter_quotes/widgets/quotes_container_widget.dart';
import 'package:flutter_quotes/widgets/quotes_tab_widget.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  final MainScreenController controller = Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      key: controller.scaffoldKey,
      body: Container(
        child: GetBuilder<MainScreenController>(
            init: controller,
            builder: (_) {
              return Stack(
                children: [
                  QuotesContainerWidget(
                    controller: controller,
                  ),
                  QuotesTabWidget(
                    controller: controller,
                  )
                ],
              );
            }),
      ),
    );
  }
}
