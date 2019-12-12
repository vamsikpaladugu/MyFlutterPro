import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'journal.dart';

class DBProvider {
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
    String path = join(documentDirectory.path, 'Journal.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Journal (id INTEGER PRIMARY KEY, title TEXT, dat TEXT, dQuery TEXT, desc TEXT)');
  }

  Future<Journal> add(Journal journal) async {
    var dbClient = await db;
    journal.id = await dbClient.insert('Journal', journal.toMap());
    return journal;
  }

  Future<List<Journal>> getJournals() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Journal',
        columns: ['id', 'title', 'dat', 'dQuery', 'desc'],
        orderBy: 'dQuery desc');
    List<Journal> journal = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        journal.add(Journal.fromMap(maps[i]));
      }
    }
    return journal;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'Journal',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
