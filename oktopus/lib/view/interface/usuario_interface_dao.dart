import 'package:oktopus/view/dto/usuario.dart';

abstract class UsuarioInterfaceDao {
  Future<Usuario> salvar(Usuario usuario);
  Future<bool> excluir(dynamic id);
  Future<Usuario> consultar(int id);
  Future<List<Usuario>> consultarTodos();
}
