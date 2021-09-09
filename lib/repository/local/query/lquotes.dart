import 'dart:async';

import 'package:flutter_quotes/model/quote_model.dart';
import 'package:flutter_quotes/repository/local/setup/tbl_quote.dart';
import 'package:sqflite/sqflite.dart';

class LQuotes {
  static FutureOr<void> insertChat(
      Database dbase, QuoteModel quoteModel) async {
    Map<String, dynamic> row = QuoteModel.getClient(quoteModel);
    int raw = await dbase.insert(TblQuote.TABLE, row);
    print('response insert TblQuote: ' + raw.toString());
  }

  static Future<List<QuoteModel>> getSaveQuotes(Database dbase) async {
    List<QuoteModel> quoteModelList = [];
    try {
      String query =
          "SELECT * FROM ${TblQuote.TABLE} ORDER BY ${TblQuote.CID} DESC";
      var res = await dbase.rawQuery(query);
      if (res.isNotEmpty) {
        res.forEach((element) {
          quoteModelList.add(QuoteModel.getClientMap(element));
        });
      }
    } catch (e) {
      print(e.toString());
    }
    return quoteModelList;
  }

  static Future<int> countHistory(
    Database dbase,
  ) async {
    try {
      var res = await dbase.query(TblQuote.TABLE);
      return res.isNotEmpty ? res.length : 0;
    } catch (e) {
      print(e);
    }

    return 0;
  }
}
