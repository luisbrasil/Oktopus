import 'package:oktopus/view/dto/estudio.dart';

abstract class EstudioInterfaceDao{
  Future<Estudio> salvar(Estudio estudio);
  Future<bool> excluir(dynamic id);
  Future<Estudio> consultar(int id);
  Future<List<Estudio>> consultarTodos();
}