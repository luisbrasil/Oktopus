import 'package:oktopus/database/sqlite/scriptdb.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Conexao {
  static late Database _database;
  static bool _fechado = true;

  static Future<Database> criar() async {
    if (_fechado) {
      String path = join(await getDatabasesPath(),
          'banco.db');
          deleteDatabase(path); //definindo o camminho do database
      _database = await openDatabase(
        path, // informando o caminho
        version: 1, // versão
        onCreate: (db, v) {
          db.execute(criarUsuario);
          db.execute(criarServico);
          db.execute(criarAgendamento);
          db.execute(criarReview);
          db.execute(criarEstudio);
          db.execute(criarEstudioFavorito);
          insercoesUsuario.forEach(db.execute);
          insercoesServico.forEach(db.execute);
          insercaoAgendamento.forEach(db.execute);
          insercoesReview.forEach(db.execute);
          insercoesEstudio.forEach(db.execute);
          insercoesEstudiosFavorito.forEach(db.execute);
        },
      );
      _fechado = false;
    }
    return _database;
  }
}
