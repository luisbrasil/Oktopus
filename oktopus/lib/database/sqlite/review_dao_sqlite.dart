import 'package:oktopus/database/sqlite/agendamento_dao_sqlite.dart';
import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/dto/review.dart';
import 'package:oktopus/view/interface/review_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class ReviewDAOSQLite implements ReviewInterfaceDao {
  @override
  Future<Review> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('Review', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterReview(resultado);
  }

  @override
  Future<List<Review>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('review');
    List<Review> lista = [];
    for(var registro in resultadoBD){
      var review = await converterReview(registro);
      lista.add(review);
    }
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM review WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Review> salvar(Review review) async {
    Database db = await Conexao.criar();
    String sql;
    if (review.id == null) {
      sql =
          'INSERT INTO review (agendamento, descricao,estrelas) VALUES (?,?,?)';
      int id = await db.rawInsert(
          sql, [review.agendamento, review.descricao, review.estrelas]);
      review = Review(
          id: id,
          agendamento: review.agendamento,
          descricao: review.descricao,
          estrelas: review.estrelas);
    } else {
      sql =
          'UPDATE review SET agendamento = ?, descricao =?, estrelas = ? WHERE id = ?';
      db.rawUpdate(sql,
          [review.agendamento, review.descricao, review.estrelas, review.id]);
    }
    return review;
  }

  Future<Review> converterReview(Map<dynamic, dynamic> resultado) async {
    Agendamento agendamento = await AgendamentoDAOSQLite().consultar(resultado['agendamento_id']);
    return Review(
        id: resultado['id'],
        agendamento: resultado['agendamento'],
        descricao: resultado['descricao'],
        estrelas: resultado['estrelas']);
  }
}
