import 'package:oktopus/view/dto/review.dart';

abstract class ReviewInterfaceDao{
  Review salvar(Review reviews);
  bool excluir(dynamic id);
  Future<Review> consultar(int id);
  Future<List<Review>> consultarTodos();
}