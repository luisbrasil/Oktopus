import 'package:oktopus/view/dto/usuario.dart';

abstract class UsuarioInterfaceDao{
  Usuario salvar(Usuario usuario);
  bool excluir(dynamic id);
  Future<Usuario> consultar(int id);
  Future<List<Usuario>> consultarTodos();
}