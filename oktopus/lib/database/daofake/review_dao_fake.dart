// import 'package:oktopus/database/daofake/dados_fake.dart';
// import 'package:oktopus/view/dto/review.dart';
// import 'package:oktopus/view/interface/review_interface_dao.dart';

// class ReviewDAOFake implements ReviewInterfaceDao {
//   @override
//   Future<Review> consultar(int id) {
//     return Future.value(reviews[id - 1]);
//   }

//   @override
//   Future<List<Review>> consultarTodos() {
//     return Future.value(reviews);
//   }

//   @override
//   bool excluir(dynamic id) {
//     print('excluir ${reviews[id - 1]}');
//     reviews.remove(reviews[id - 1]);
//     return true;
//   }

//   @override
//   Review salvar(Review review) {
//     if (review.id == null) {
//       review = Review(
//         id: reviews.length,
//         agendamento: review.agendamento,
//         descricao: review.descricao,
//         estrelas: review.estrelas,
//       );
//       reviews.add(review);
//     } else {
//       int i = (review.id as int) - 1;
//       reviews[i] = review;
//     }
//     return review;
//   }
// }
