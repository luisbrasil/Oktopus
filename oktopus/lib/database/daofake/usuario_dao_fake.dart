// import 'package:oktopus/database/daofake/dados_fake.dart';
// import 'package:oktopus/view/dto/usuario.dart';
// import 'package:oktopus/view/interface/usuario_interface_dao.dart';

// class UsuarioDAOFake implements UsuarioInterfaceDao {
//   @override
//   Future<Usuario> consultar(int id) {
//     return Future.value(usuarios[id - 1]);
//   }

//   @override
//   Future<List<Usuario>> consultarTodos() {
//     return Future.value(usuarios);
//   }

//   @override
//   bool excluir(dynamic id) {
//     print('excluir ${usuarios[id - 1]}');
//     usuarios.remove(usuarios[id - 1]);
//     return true;
//   }

//   @override
//   ListUsuario salvar(Usuario usuario) {
//     if (usuario.id == null) {
//       usuario = Usuario(
//         id: usuarios.length,
//         nome: usuario.nome,
//         cpf: usuario.cpf,
//         email: usuario.email,
//         urlAvatar: usuario.urlAvatar,
//       );
//       usuarios.add(usuario);
//     } else {
//       int i = (usuario.id as int) - 1;
//       usuarios[i] = usuario;
//     }
//     return usuario;
//   }
// }
