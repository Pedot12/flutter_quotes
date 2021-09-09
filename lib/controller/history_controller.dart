import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/model/quote_model.dart';
import 'package:flutter_quotes/repository/local/query/lquotes.dart';
import 'package:flutter_quotes/repository/local/setup/db_helper.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';

class HistoryController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxBool _isLoadingEnabled = false.obs;
  Database database;
  List<QuoteModel> quoteModelList;
  


  @override
  Future<void> onInit() async {
    super.onInit();
    database = await DbHelper.getInstance();
    getSaveList();
  }

  void getSaveList() async
  {
    quoteModelList = [];
    isLoadingEnabled = true;
    quoteModelList = await LQuotes.getSaveQuotes(database);
    isLoadingEnabled = false;
  }

  set isLoadingEnabled(bool isLoadingEnabled) {
    _isLoadingEnabled.value = isLoadingEnabled;
    update();
  }

  bool get isLoadingEnabled => _isLoadingEnabled.value;

  
}
