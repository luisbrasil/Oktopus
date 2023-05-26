import 'package:oktopus/view/dto/review.dart';

abstract class ReviewInterfaceDao {
  Future<Review> salvar(Review reviews);
  Future<bool> excluir(dynamic id);
  Future<Review> consultar(int id);
  Future<List<Review>> consultarTodos();
}
