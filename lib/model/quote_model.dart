import 'package:flutter_quotes/repository/local/setup/tbl_quote.dart';

class QuoteModel {
  String author;
  String quote;
  String error;
  String dateSaved;

  QuoteModel({this.author, this.quote, this. error, this.dateSaved});

  static Map<String, dynamic> getClient(QuoteModel quoteModel) {
    Map<String, dynamic> row = {
      // TblOffline.CID: offlineModel.cID,
      TblQuote.QUOTE: quoteModel.quote,
      TblQuote.AUTHOR: quoteModel.author,
      TblQuote.DATESAVED: quoteModel.dateSaved,
    };
    return row;
  }

  static QuoteModel getClientMap(var json) {
    QuoteModel quoteModel = new QuoteModel();
    quoteModel.quote = json[TblQuote.QUOTE];
    quoteModel.author = json[TblQuote.AUTHOR];
    quoteModel.dateSaved = json[TblQuote.DATESAVED];

    return quoteModel;
  }
}
