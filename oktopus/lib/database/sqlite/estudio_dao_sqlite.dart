import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/view/dto/estudio.dart';
import 'package:oktopus/view/interface/estudio_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class EstudioDAOSQLite implements EstudioInterfaceDao {
  @override
  Future<Estudio> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
    await db.query('estudio', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty) {
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return converterEstudio(resultado);
  }

  @override
  Future<List<Estudio>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Estudio> lista = (await db.query('estudio'))
        .map<Estudio>(converterEstudio)
        .toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM estudio WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Estudio> salvar(Estudio estudio) async {
    Database db = await Conexao.criar();
    String sql;
    if (estudio.id == null) {
      sql = 'INSERT INTO estudio (nome, descricao) VALUES (?,?)';
      int id = await db.rawInsert(
          sql, [estudio.nome, estudio.descricao]);
      estudio = Estudio(
          id: id,
          nome: estudio.nome,
          descricao: estudio.descricao);
    } else {
      sql =
      'UPDATE estudio SET nome = ?, descricao = ? WHERE id = ?';
      db.rawUpdate(sql, [
        estudio.nome,
        estudio.descricao,
        estudio.id
      ]);
    }
    return estudio;
  }

  Estudio converterEstudio(Map<dynamic, dynamic> resultado) {
    return Estudio(
        id: resultado['id'],
        nome: resultado['nome'],
        descricao: resultado['descricao']);
  }
}
