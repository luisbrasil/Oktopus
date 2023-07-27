import 'package:oktopus/view/dto/servico.dart';

abstract class ServicoInterfaceDao{
  Future<Servico> salvar(Servico servico);
  Future<bool> excluir(dynamic id);
  Future<Servico> consultar(int id);
  Future<List<Servico>> consultarTodos();
}