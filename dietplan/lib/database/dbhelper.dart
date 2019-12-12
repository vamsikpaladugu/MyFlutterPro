import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'entry.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Entry.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Entry (id INTEGER PRIMARY KEY, icon INTEGER, type INTEGER, calc INTEGER, time TEXT, dmy TEXT)');
  }

  Future<Entry> add(Entry entry) async {
    var dbClient = await db;
    entry.id = await dbClient.insert('Entry', entry.toMap());
    return entry;
  }

  Future<List<Entry>> getAllEntrysByDay(String dmy) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Entry',
        columns: ['id', 'icon', 'calc', 'type', 'time', 'dmy'],
        where: 'dmy = $dmy');
    List<Entry> entry = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        entry.add(Entry.fromMap(maps[i]));
      }
    }
    return entry;
  }

  Future<List<Entry>> getAllEntrys(String dmy) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Entry',
        columns: ['id', 'icon', 'calc', 'type', 'time', 'dmy'],
        where: 'dmy = ?',
        whereArgs: [dmy]);
    List<Entry> entry = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        entry.add(Entry.fromMap(maps[i]));

        print(Entry.fromMap(maps[i]));
      }
    }
    return entry;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'Entry',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Entry entry) async {
    var dbClient = await db;
    return await dbClient.update(
      'Entry',
      entry.toMap(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
