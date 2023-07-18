import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:tools_app/models/history_model.dart';
export 'package:tools_app/models/history_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    // path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // path
    final path = join(documentsDirectory.path, 'HistoryDb.db');

    // crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (db, version) async {
        await db.execute('''
					CREATE TABLE History(
						id INTEGER PRIMARY KEY,
						prompt TEXT,
						result TEXT
					);
				''');
      },
    );
  }

// INSERT
  Future<int> nuevoHistory(HistoryModel nuevoHistory) async {
    final db = await database;
    final res = await db.insert('History', nuevoHistory.toMap());
    // es el ID del ultimo registro insertado
    return res;
  }

// GET
  Future<HistoryModel?> getHistoyById(int id) async {
    final db = await database;
    final res = await db.query('History', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? HistoryModel.fromMap(res.first) : null;
  }

  Future<List<HistoryModel>?> getAllHistory() async {
    final db = await database;
    final res = await db.query('History');
    return res.isNotEmpty
        ? res.map((e) => HistoryModel.fromMap(e)).toList()
        : [];
  }


  // UPDATE
  Future<int> updateHistory(HistoryModel nuevoHistory) async {
    final db = await database;
    final res = await db.update('History', nuevoHistory.toMap(),
        where: 'id = ?', whereArgs: [nuevoHistory.id]);
    return res;
  }

  // DELETE
  Future<int> deleteHistory(int id) async {
    final db = await database;
    final res = await db.delete('History', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM History');
    return res;
  }
}
