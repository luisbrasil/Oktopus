import 'package:oktopus/view/dto/agendamento.dart';

abstract class AgendamentoInterfaceDao{
  Agendamento salvar(Agendamento agendamento);
  bool excluir(dynamic id);
  Future<Agendamento> consultar(int id);
  Future<List<Agendamento>> consultarTodos();
}