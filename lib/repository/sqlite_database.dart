import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

const scripts = {
  1: ''' CREATE TABLE IF NOT EXISTS contatos (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          sobreName TEXT,
          apelido TEXT,
          telefone TEXT,
          email TEXT,
          dataNascimento TEXT,
          informacoes TEXT,
          imageUrl TEXT
          );'''
};

class SQLTEDatabase {
  static Database? _db;

  Future<Database> obterDB() async {
    if (_db == null) {
      return await iniciarDB();
    }
    return _db!;
  }

  Future<Database> iniciarDB() async {
    String pathDB = path.join(await getDatabasesPath(), "lista_contatos.db");
    // await deleteDatabase(path);
    var db = await openDatabase(
      pathDB,
      version: scripts.length,
      onCreate: (db, version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
    );
    return db;
  }
}
