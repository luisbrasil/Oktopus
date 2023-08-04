import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/view/dto/servico.dart';
import 'package:oktopus/view/interface/servico_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class ServicoDAOSQLite implements ServicoInterfaceDao {
  @override
  Future<Servico> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('Servico', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty){
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return converterServico(resultado);
  }

  @override
  Future<List<Servico>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('servico');
    List<Servico> lista = [];
    for(var registro in resultadoBD){
      var servico = await converterServico(registro);
      lista.add(servico);
    }
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM servico WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Servico> salvar(Servico servico) async {
    Database db = await Conexao.criar();
    String sql;
    if (servico.id == null) {
      sql =
      'INSERT INTO servico (estudio_id, nome, descricao, valor) VALUES (?,?,?,?)';
      int id = await db.rawInsert(
          sql, [servico.estudio, servico.nome, servico.descricao, servico.valor]);
      servico = Servico(
          id: id,
          estudio: servico.estudio,
          nome: servico.nome,
          descricao: servico.descricao,
          valor: servico.valor);
    } else {
      sql =
      'UPDATE servico SET estudio_id = ?, nome =?, descricao =?, valor = ? WHERE id = ?';
      db.rawUpdate(sql,
          [servico.estudio, servico.nome, servico.descricao, servico.valor, servico.id]);
    }
    return servico;
  }

  Future<Servico> converterServico(Map<dynamic, dynamic> resultado) async {
    return Servico(
        id: resultado['id'],
        estudio: resultado['estudio_id'],
        nome: resultado['nome'],
        descricao: resultado['descricao'],
        valor: resultado['valor']);
  }
}
