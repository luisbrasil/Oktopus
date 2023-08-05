import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/database/sqlite/estudio_dao_sqlite.dart';
import 'package:oktopus/database/sqlite/pessoa_dao_sqlite.dart';
import 'package:oktopus/view/dto/estudio.dart';
import 'package:oktopus/view/dto/estudio_favorito.dart';
import 'package:oktopus/view/dto/usuario.dart';
import 'package:oktopus/view/interface/estudio_favorito_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class EstudioFavoritoDAOSQLite implements EstudioFavoritoInterfaceDao {


  @override
  Future<EstudioFavorito> consultarPorUsuario(int usuarioId) async {
    Database db = await Conexao.criar();
    List<Map> maps = await db.query('estudio_favorito', where: 'usuario_id = ?', whereArgs: [usuarioId]);
    if (maps.isEmpty){
      throw Exception('Não foi encontrado registro com este id');
    }
    Map<dynamic, dynamic> resultado = maps.first;
    return converterEstudioFavorito(resultado);
  }

  @override
  Future<List<EstudioFavorito>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Map<dynamic,dynamic>> resultadoBD = await db.query('estudio_favorito');
    List<EstudioFavorito> lista = [];
    for(var registro in resultadoBD){
      var estudioFavorito = await converterEstudioFavorito(registro);
      lista.add(estudioFavorito);
    }
    return lista;
  }

  @override
  Future<bool> excluir(usuarioId, estudioId) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM estudio_favorito WHERE usuario_id = ? AND estudio_id = ?';
    int linhasAfetas = await db.rawDelete(sql, [usuarioId, estudioId]);
    return linhasAfetas > 0;
  }

  @override
  Future<EstudioFavorito> salvar(EstudioFavorito estudioFavorito) async {
    Database db = await Conexao.criar();
    String sql;

      sql =
      'INSERT INTO estudio_favorito (usuario_id, estudio_id) VALUES (?,?)';
      await db.rawInsert(
          sql, [estudioFavorito.usuario.id, estudioFavorito.estudio.id]);
      estudioFavorito = EstudioFavorito(
          usuario: estudioFavorito.usuario,
          estudio: estudioFavorito.estudio,
          dataAdicionado: estudioFavorito.dataAdicionado);

    return estudioFavorito;
  }

  Future<EstudioFavorito> converterEstudioFavorito(Map<dynamic, dynamic> resultado) async {
    Usuario usuario = await UsuarioDAOSQLite().consultar(resultado['usuario_id']);
    Estudio estudio = await EstudioDAOSQLite().consultar(resultado['estudio_id']);
    return EstudioFavorito(
        estudio: estudio,
        usuario: usuario,
        dataAdicionado: DateTime.parse(resultado['data_adicionado']));
  }
}
