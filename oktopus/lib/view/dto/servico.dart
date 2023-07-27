import 'package:oktopus/view/dto/estudio.dart';

class Servico{
  final dynamic id;
  final int estudio;
  final String nome;
  final String descricao;
  final double valor;

  Servico({
    this.id,
    required this.estudio,
    required this.nome,
    required this.descricao,
    required this.valor,
  });

  @override
  bool operator ==(other) => other is Servico && other.id == id;
}