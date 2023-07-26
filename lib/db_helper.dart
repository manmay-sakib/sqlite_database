import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  //variables
  static const dbName = "myDatabase.db";
  static const dbVersion = 1;
  static const dbTable = 'myTable';
  static const ColumnId = 'id';
  static const ColumnName = 'name';

  //constructor
  static final DatabaseHelper instance = DatabaseHelper();

  //database initialized
  static Database? _database;

  Future<Database?> get database async {
    _database ??= await intDB();
    return _database;
  }

  intDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  //Database table create method
  Future onCreate(Database db, int version) async {
    db.execute('''  
        CREATE TABLE $dbTable(
        $ColumnId INTEGER PRIMARY KEY,
        $ColumnName TEXT NOT NULL
        )
      ''');
  }

  //insert Method
  insertRecord(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(dbTable, row);
  }

  //Read/query Method
  Future<List<Map<String, dynamic>>> queryRecord() async {
    Database? db = await instance.database;
    return await db!.query(dbTable);
  }

  //update method
  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row[ColumnId];
    return await db!
        .update(dbTable, row, where: '$ColumnId = ?', whereArgs: [id]);
  }

  //delete method
  Future<int> deleteRecord(int id) async {
    Database? db = await instance.database;
    return await db!.delete(dbTable, where: '$ColumnId = ?', whereArgs: [id]);
  }
}
