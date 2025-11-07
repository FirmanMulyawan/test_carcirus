import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseCarManager {
  DatabaseCarManager._private();

  static final DatabaseCarManager instance = DatabaseCarManager._private();

  Database? _db;

  Future<Database> get db async {
    // ignore: prefer_conditional_assignment
    if (_db == null) {
      _db = await _initDB();
    }

    return _db!;
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, 'car.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE car (
            id INTEGER PRIMARY KEY NOT NULL,
            date TEXT NOT NULL,
            time TEXT NOT NULL,
            image TEXT NOT NULL,
            type TEXT NOT NULL,
            name TEXT NOT NULL,
            price TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}
