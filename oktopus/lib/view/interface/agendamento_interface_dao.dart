import 'package:oktopus/view/dto/agendamento.dart';

abstract class AgendamentoInterfaceDao{
  Future<Agendamento> salvar(Agendamento agendamento);
  Future<bool> excluir(dynamic id);
  Future<Agendamento> consultar(int id);
  Future<List<Agendamento>> consultarTodos();
}