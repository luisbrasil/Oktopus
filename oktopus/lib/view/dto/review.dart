import 'package:oktopus/view/dto/agendamento.dart';

class Review {
  final dynamic id;
  final Agendamento agendamento;
  final String descricao;
  final int estrelas;

  Review({
    this.id,
    required this.agendamento,
    required this.descricao,
    required this.estrelas,
  });

  @override
  bool operator ==(other) => other is Review && other.id == id;
}
