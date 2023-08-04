import 'package:oktopus/view/dto/estudio.dart';
import 'package:oktopus/view/dto/usuario.dart';

class EstudioFavorito{
  final Estudio estudio;
  final Usuario usuario;
  final DateTime dataAdicionado;

  EstudioFavorito({
    required this.estudio,
    required this.usuario,
    required this.dataAdicionado
  });

  @override
  bool operator ==(other) => other is EstudioFavorito && other.estudio == estudio && other.usuario == usuario;
}