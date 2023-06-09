import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/interface/agendamento_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class AgendamentoDAOSQLite implements AgendamentoInterfaceDao {
  @override
  Future<Agendamento> consultar(int id) async {
    Database db = await Conexao.criar();
    Map resultado = (await db.query('Agendamento', where: 'id = ?', whereArgs: [id])).first;
    if (resultado.isEmpty){
      throw Exception('Não foi encontrado registro com este id');
    }
    return converterAgendamento(resultado);
  }

  @override
  Future<List<Agendamento>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Agendamento> lista =
        (await db.query('agendamento')).map<Agendamento>(converterAgendamento).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM agendamento WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Agendamento> salvar(Agendamento agendamento) async {
    Database db = await Conexao.criar();
    String sql;
    if (agendamento.id == null) {
      sql =
          'INSERT INTO agendamento (usuario_id, servico_id, data) VALUES (?,?,?)';
      int id = await db.rawInsert(
          sql, [agendamento.usuario, agendamento.servico, agendamento.data]);
      agendamento = Agendamento(
          id: id,
          usuario: agendamento.usuario,
          servico: agendamento.servico,
          data: agendamento.data);
    } else {
      sql =
          'UPDATE agendamento SET usuario_id = ?, servico_id = ?, data = ? WHERE id = ?';
      db.rawUpdate(sql,
          [agendamento.usuario, agendamento.servico, agendamento.data, agendamento.id]);
    }
    return agendamento;
  }

  Agendamento converterAgendamento(Map<dynamic, dynamic> resultado) {
    return Agendamento(
        id: resultado['id'],
        usuario: resultado['usuario_id'],
        servico: resultado['servico_id'],
        data: DateTime.parse(resultado['data']));
  }
}
