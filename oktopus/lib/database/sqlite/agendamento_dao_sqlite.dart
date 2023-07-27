import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/database/sqlite/pessoa_dao_sqlite.dart';
import 'package:oktopus/database/sqlite/servico_dao_sqlite.dart';
import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/dto/servico.dart';
import 'package:oktopus/view/dto/usuario.dart';
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
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('agendamento');
    List<Agendamento> lista = [];
    for(var registro in resultadoBD){
      var agendamento = await converterAgendamento(registro);
      lista.add(agendamento);
    }
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

  Future<Agendamento> converterAgendamento(Map<dynamic, dynamic> resultado) async {
    Usuario usuario = await UsuarioDAOSQLite().consultar(resultado['usuario_id']);
    Servico servico = await ServicoDAOSQLite().consultar(resultado['servico_id']);
    return Agendamento(
        id: resultado['id'],
        usuario: usuario,
        servico: servico,
        data: DateTime.parse(resultado['data']));
  }
}
