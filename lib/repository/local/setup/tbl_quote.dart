import 'package:sqflite/sqflite.dart';

import 'db_helper.dart';

class TblQuote {
  static const String TABLE = 'TblQuote';
  static const String CID = 'cID';
  static const String QUOTE = 'QUOTE';
  static const String AUTHOR = 'AUTHOR';
  static const String DATESAVED = 'DATESAVED';

  static Future<void> create(Database db) async {
    bool isExist = await DbHelper.isTableExist(db, TABLE);
    if (!isExist) {
      await db.execute(_createTblQuote());
    }

    if (!await DbHelper.isColumnExist(db, TABLE, DATESAVED)) {
      await db.execute(_createColumnDATESAVED());
    }
  }

  static String _createTblQuote() {
    return "CREATE TABLE $TABLE ("
        "$CID INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$QUOTE              TEXT,"
        "$AUTHOR             TEXT"
        ")";
  }

  static String _createColumnDATESAVED() {
    return "ALTER TABLE $TABLE ADD COLUMN $DATESAVED TEXT";
  }
}
