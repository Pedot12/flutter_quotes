import 'package:flutter_quotes/repository/local/setup/tbl_quote.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _database;
  static DbHelper instance = new DbHelper._();
  DbHelper._();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  static Future<Database> getInstance() async {
    if (instance == null || instance.database == null) {
      instance = new DbHelper._();
    }
    return instance.database;
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "Quotes.db");
    Database resDB = await openDatabase(path, version: 1, onOpen: (db) {
      _onCreate(db, 1);
    }, onCreate: _onCreate);

    return resDB;
  }

  Future<void> _onCreate(Database db, int version) async {
    // await TblPerson.create(db);
    await TblQuote.create(db);
    print('created TblQuote'); 
  }

  static Future<bool> isTableExist(Database database, String tableName) async {
    try {
      bool result = false;
      String query = "SELECT name FROM sqlite_master WHERE type ='table'";
      List<Map> resultSet = await database.rawQuery(query);
      for (Map map in resultSet) {
        if (tableName == map['name']) {
          result = true;
          break;
        }
      }
      return result;
    } catch (e) {
      print('error in table exist: ' + e.toString());
    }
    return false;
  }

  static Future<bool> isColumnExist(
      Database database, String tableName, String columnName) async {
    bool result = false;
    String query = "PRAGMA table_info(" + tableName + ")";
    List<Map> resultSet = await database.rawQuery(query);
    for (Map map in resultSet) {
      if (columnName == map['name']) {
        result = true;
        break;
      }
    }
    return result;
  }
}
