import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/dialog/failure_dialog.dart';
import 'package:flutter_quotes/dialog/success_dialog.dart';
import 'package:flutter_quotes/model/quote_model.dart';
import 'package:flutter_quotes/repository/local/query/lquotes.dart';
import 'package:flutter_quotes/repository/local/setup/db_helper.dart';
import 'package:flutter_quotes/repository/server/squotes.dart';
import 'package:flutter_quotes/utility/constant.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class MainScreenController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxBool _isLoadingEnabled = false.obs;
  QuoteModel quoteModel;
  Database database;
  String error;
  int totalHistory = 0;

  @override
  Future<void> onInit() async {
    super.onInit();

    database = await DbHelper.getInstance();
    exectQuotes();
    countHistory();
  }

  void countHistory() async{
    updateCountHis = await LQuotes.countHistory(database);
  }

  void exectQuotes() async {
    isLoadingEnabled = true;
    Map<String, dynamic> result = await Squotes.getQuote();
    if (result[Constant.RETURN]) {
      updateQuoteModel = result[Constant.VALUE];
    } else {
      error = result[Constant.MSG];
    }
    isLoadingEnabled = false;
  }

  void saveQuote(BuildContext context) async {
    try {
      DateTime now = new DateTime.now();
      quoteModel.dateSaved = Constant.dateView(dateData: now.toString());

      await LQuotes.insertChat(database, quoteModel);
      // show dialog
      showSuccessDialog(
          context: context,
          close: () {
            countHistory();
            Navigator.pop(context);
          },
          message: 'New Quote saved');
    } catch (e) {
      showFailureDialog(
          context: context,
          close: () {
            Navigator.pop(context);
          },
          message: 'Cant save this time, please wait!');
    }
  }

  set isLoadingEnabled(bool isLoadingEnabled) {
    _isLoadingEnabled.value = isLoadingEnabled;
    update();
  }

  bool get isLoadingEnabled => _isLoadingEnabled.value;

  set updateCountHis(int totalHistorys) {
    totalHistory = totalHistorys;
    update();
  }

  int get updateCountHis => totalHistory;

  set updateQuoteModel(QuoteModel quoteModels) {
    quoteModel = quoteModels;
    update();
  }



  QuoteModel get updateQuoteModel => quoteModel;
}
