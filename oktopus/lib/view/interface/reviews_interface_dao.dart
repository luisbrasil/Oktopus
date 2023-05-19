import 'package:oktopus/view/dto/reviews.dart';

abstract class ReviewsInterfaceDao{
  Reviews salvar(Reviews reviews);
  bool excluir(dynamic id);
  Future<Reviews> consultar(int id);
  Future<List<Reviews>> consultarTodos();
}