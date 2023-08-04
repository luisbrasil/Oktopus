import 'package:oktopus/view/dto/estudio_favorito.dart';

abstract class EstudioFavoritoInterfaceDao {
  Future<EstudioFavorito> salvar(EstudioFavorito estudioFavorito);
  Future<EstudioFavorito> consultarPorUsuario(int usuarioId);
  Future<List<EstudioFavorito>> consultarTodos();
  Future<bool> excluir(dynamic usuarioId, dynamic estudioId);
}
