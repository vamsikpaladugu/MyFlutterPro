import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HCheckup {
  int id;

  String desc;
  String dat;

  String title;

  String type;

  HCheckup(this.id, this.desc, this.dat, this.title, this.type); //For medic

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'desc': desc,
      'dat': dat,
      'title': title,
      'type': type,
    };

    print('map');

    print(map);

    return map;
  }

  HCheckup.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    desc = map['desc'];
    dat = map['dat'];
    title = map['title'];
    type = map['type'];
  }

  @override
  String toString() {
    return 'HCheckup{id: $id, desc: $desc, dat: $dat, title: $title}';
  }
}

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
    String path = join(documentDirectory.path, 'HCheckup.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE HCheckup (id INTEGER PRIMARY KEY, desc TEXT, dat TEXT, title TEXT, type TEXT)');
  }

  Future<HCheckup> add(HCheckup entry) async {
    var dbClient = await db;
    entry.id = await dbClient.insert('HCheckup', entry.toMap());
    return entry;
  }

  Future<List<HCheckup>> getAllEntrysByType(String dmy) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('HCheckup',
        columns: ['id', 'desc', 'dat', 'title', 'type'], where: 'dmy = $dmy');
    List<HCheckup> entry = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        entry.add(HCheckup.fromMap(maps[i]));
      }
    }
    return entry;
  }

  Future<List<HCheckup>> getAllEntrys(String type) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('HCheckup',
        columns: ['id', 'desc', 'dat', 'title'],
        where: 'type = ?',
        whereArgs: [type]);
    List<HCheckup> entry = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        entry.add(HCheckup.fromMap(maps[i]));

        print(HCheckup.fromMap(maps[i]));
      }
    }
    return entry;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'HCheckup',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(HCheckup entry) async {
    var dbClient = await db;
    return await dbClient.update(
      'HCheckup',
      entry.toMap(),
      where: 'id = ?',
      whereArgs: [entry.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  getMedications() {}
}
