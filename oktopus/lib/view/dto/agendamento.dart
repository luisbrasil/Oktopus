import 'package:oktopus/view/dto/servico.dart';
import 'package:oktopus/view/dto/usuario.dart';

class Agendamento{
  final dynamic id;
  final int usuario;
  final int servico;
  final DateTime data;

  Agendamento({
    this.id,
    required this.usuario,
    required this.servico,
    required this.data
  });

  @override
  bool operator == (other) =>
      other is Agendamento && other.id == id;
}