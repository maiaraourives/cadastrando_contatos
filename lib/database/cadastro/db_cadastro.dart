// ignore_for_file: depend_on_referenced_packages

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import '../tables/tables_usuario.dart';

class DBCadastro {
  static const String databaseNome = 'Cadastro.db';
  late Future<Database> database;

  Future connect() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, databaseNome);
    database = openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) {
        return db.execute(
          "CREATE TABLE IF NOT EXISTS ${Contato.tableContato} ( "
          "${Contato.columnPk} INTEGER PRIMARY KEY, "
          "${Contato.columnNome} TEXT NOT NULL, "
          "${Contato.columnTelefone} TEXT NOT NULL, "
          "${Contato.columnEmail} TEXT )",
        );
      },
    );
  }

  Future<List<Contato>> list() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(Contato.tableContato);

    return List.generate(maps.length, (i) {
      return Contato(
        nome: maps[i][Contato.columnNome],
        telefone: maps[i][Contato.columnTelefone],
        email: maps[i][Contato.columnEmail],
      );
    });
  }

  Future<void> insert(Contato contato) async {
    final Database db = await database;

    await db.insert(
      Contato.tableContato,
      contato.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Contato contato, String antigoNome) async {
    final db = await database;
    await db.update(
      Contato.tableContato,
      contato.toMap(),
      where: "${Contato.columnNome} = ?",
      whereArgs: [antigoNome],
    );
  }

  Future<void> delete(String contato) async {
    final db = await database;
    await db.delete(
      Contato.tableContato,
      where: "${Contato.columnNome} = ? ",
      // where: "${Contato.columnNome} LIKE '%?%' ",
      whereArgs: [contato],
    );
  }
}
