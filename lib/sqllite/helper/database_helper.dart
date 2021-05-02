import 'dart:async';

import 'package:infotechkurs/sqllite/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;

  Database _database;

  String _tableName = 'user';
  String _columnId = 'Id';
  String _columnName = 'name';

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      print('database boş');
      _databaseHelper = DatabaseHelper.internal();
      return _databaseHelper;
    } else {
      print('database zaten var');
      return _databaseHelper;
    }
  }

  DatabaseHelper.internal();

  _getDatabase() async {
    if (_database == null) {
      print('database oluşturuluyor.');
      _database = await _intilaizeDatabase();
      return _database;
    } else {
      print('DAtabase zaten var');
      return _database;
    }
  }

  _intilaizeDatabase() async {
    print('database initilazr ediliyor');
    var projectPath = await getApplicationDocumentsDirectory();

    String dbPath = join(projectPath.path, 'user.db');

    Database userDb =
        await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return userDb;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    print('TAblo oluşturuluyor');
    var sql =
        'CREATE TABLE $_tableName ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT,$_columnName TEXT )';
    await db.execute(sql);
  }

  addUser(User user) async {
    print('Kullanıcı oluşturuluyor.');
    var db = await _getDatabase();
    await db.insert(_tableName, user.toMap());
  }

  Future getUser() async {
    var db = await _getDatabase();
    var user = await db.query(_tableName, orderBy: '$_columnId ASC');
    return user;
  }
}
