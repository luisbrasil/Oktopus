import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/dto/usuario.dart';

class Reviews{
  final dynamic id;
  final Agendamento agendamento;
  final Usuario usuario;
  final String descricao;
  final int estrelas;

  Reviews({
    this.id,
    required this.agendamento,
    required this.usuario,
    required this.descricao,
    required this.estrelas,
  });
}