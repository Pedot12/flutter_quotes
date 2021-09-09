import 'dart:convert';
import 'dart:io';

import 'package:flutter_quotes/model/quote_model.dart';
import 'package:flutter_quotes/utility/constant.dart';
import 'package:http/http.dart';

class Squotes {
  static Future<Map> getQuote() async {
    Map<String, dynamic> result;

    try {

      
      String url = 'https://api.quotable.io/random';
      var response = await get(Uri.parse(url),
          headers: {HttpHeaders.acceptHeader: 'application/json'});
           final responseJson = json.decode(response.body);
          

      if (response.statusCode == 200) {
        print('Result body ${response.body.toString()}');
        QuoteModel quoteModel = new QuoteModel();
        quoteModel.quote = responseJson['content'];
        quoteModel.author = responseJson['author'];

        result = {
          Constant.RETURN: true,
          Constant.MSG: 'Success',
          Constant.VALUE: quoteModel,
        };
      } else {
        result = {
          Constant.RETURN: false,
          Constant.MSG: 'Opps Something went wrong!',
        };
      }
    } catch (e) {
      result = {
        Constant.RETURN: false,
        Constant.MSG: 'Error ${e.toString()}',
      };
    }

    return result;
  }
}
