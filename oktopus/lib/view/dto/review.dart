import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/dto/usuario.dart';

class Review {
  final dynamic id;
  final int agendamento;
  final String descricao;
  final int estrelas;

  Review({
    this.id,
    required this.agendamento,
    required this.descricao,
    required this.estrelas,
  });
}
