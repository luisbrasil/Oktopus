import 'package:oktopus/view/dto/servico.dart';

abstract class ServicoInterfaceDao{
  Servico salvar(Servico servico);
  bool excluir(dynamic id);
  Future<Servico> consultar(int id);
  Future<List<Servico>> consultarTodos();
}