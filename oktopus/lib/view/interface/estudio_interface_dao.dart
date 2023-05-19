import 'package:oktopus/view/dto/estudio.dart';

abstract class EstudioInterfaceDao{
  Estudio salvar(Estudio estudio);
  bool excluir(dynamic id);
  Future<Estudio> consultar(int id);
  Future<List<Estudio>> consultarTodos();
}