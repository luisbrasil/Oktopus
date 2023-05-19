import 'package:oktopus/view/dto/servico.dart';
import 'package:oktopus/view/dto/usuario.dart';

class Agendamento{
  final dynamic id;
  final Usuario usuario;
  final Servico servico;
  final DateTime data;

  Agendamento({
    this.id,
    required this.usuario,
    required this.servico,
    required this.data
  });
}