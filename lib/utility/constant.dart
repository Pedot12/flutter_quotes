import 'package:intl/intl.dart';

class Constant{
  // RETURN
  static const RETURN = 'Result';
  static const MSG = 'Msg';
  static const VALUE = 'value';


  static String dateView({dateData}) {
    var date = DateTime.parse(dateData);
    DateFormat format = DateFormat("yyyy-MM-dd hh:mm a");
    return format.format(date).toString();
  }
}