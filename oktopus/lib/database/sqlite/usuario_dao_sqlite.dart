import 'package:oktopus/database/sqlite/conexao.dart';
import 'package:oktopus/view/dto/usuario.dart';
import 'package:oktopus/view/interface/usuario_interface_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class UsuarioDAOSQLite implements UsuarioInterfaceDao {
  @override
  Future<Usuario> consultar(int id) async {
    Database db = await Conexao.criar();
    List<Map> maps =
        await db.query('Usuario', where: 'id = ?', whereArgs: [id]);
    if (maps.isEmpty)
      throw Exception('Não foi encontrado registro com este id');
    Map<dynamic, dynamic> resultado = maps.first;
    return converterUsuario(resultado);
  }

  @override
  Future<List<Usuario>> consultarTodos() async {
    Database db = await Conexao.criar();
    List<Usuario> lista =
        (await db.query('usuario')).map<Usuario>(converterUsuario).toList();
    return lista;
  }

  @override
  Future<bool> excluir(id) async {
    Database db = await Conexao.criar();
    var sql = 'DELETE FROM usuario WHERE id = ?';
    int linhasAfetas = await db.rawDelete(sql, [id]);
    return linhasAfetas > 0;
  }

  @override
  Future<Usuario> salvar(Usuario usuario) async {
    Database db = await Conexao.criar();
    String sql;
    if (usuario.id == null) {
      sql = 'INSERT INTO usuario (nome, cpf,email,url_avatar) VALUES (?,?,?,?)';
      int id = await db.rawInsert(
          sql, [usuario.nome, usuario.cpf, usuario.email, usuario.urlAvatar]);
      usuario = Usuario(
          id: id,
          nome: usuario.nome,
          cpf: usuario.cpf,
          email: usuario.email,
          urlAvatar: usuario.urlAvatar);
    } else {
      sql =
          'UPDATE usuario SET nome = ?, cpf =?, email = ?, url_avatar= ? WHERE id = ?';
      db.rawUpdate(sql, [
        usuario.nome,
        usuario.cpf,
        usuario.email,
        usuario.urlAvatar,
        usuario.id
      ]);
    }
    return usuario;
  }

  Usuario converterUsuario(Map<dynamic, dynamic> resultado) {
    return Usuario(
        id: resultado['id'],
        nome: resultado['nome'],
        cpf: resultado['cpf'],
        email: resultado['email'],
        urlAvatar: resultado['url_avatar']);
  }
}
