import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'Expense.dart';

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
    String path = join(documentDirectory.path, 'Expense.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Expense (id INTEGER PRIMARY KEY, name TEXT, type INTEGER, amount INTEGER, day INTEGER, month INTEGER, year INTEGER)');
  }

  Future<Expense> add(Expense expense) async {
    var dbClient = await db;
    expense.id = await dbClient.insert('Expense', expense.toMap());
    return expense;
  }

  Future<List<Expense>> getExpenses() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Expense',
        columns: ['id', 'name', 'amount', 'type', 'day', 'month', 'year']);
    List<Expense> expense = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        expense.add(Expense.fromMap(maps[i]));
      }
    }
    return expense;
  }

  Future<List<Expense>> getAllExpensesByDay(int day) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Expense',
        columns: ['id', 'name', 'amount', 'type', 'day', 'month', 'year'],
        where: 'day = $day');
    List<Expense> expense = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        expense.add(Expense.fromMap(maps[i]));
      }
    }
    return expense;
  }

  Future<int> getExpensesByDay(int day) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Expense',
        columns: ['id', 'name', 'amount', 'type', 'day', 'month', 'year'],
        where: 'day = $day');

    int amountTotal = 0;

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        amountTotal = amountTotal + Expense.fromMap(maps[i]).amount;
      }
    }
    return amountTotal;
  }

  Future<int> getExpensesByMonth(int month) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query('Expense',
        columns: ['id', 'name', 'amount', 'type', 'day', 'month', 'year'],
        where: 'month = $month');

    int amountTotal = 0;

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        amountTotal = amountTotal + Expense.fromMap(maps[i]).amount;
      }
    }
    return amountTotal;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'Expense',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Expense expense) async {
    var dbClient = await db;
    return await dbClient.update(
      'Expense',
      expense.toMap(),
      where: 'id = ?',
      whereArgs: [expense.id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
