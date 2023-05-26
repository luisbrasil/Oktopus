import 'package:flutter/material.dart';

import 'dto/review.dart';

class ReviewDetalhe extends StatelessWidget {
  const ReviewDetalhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Review review = receberReview(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(60),
        children: [
          agendamento(review),
          descricao(review),
          estrelas(review),
        ],
      ),
      floatingActionButton: botaoVoltar(context),
    );
  }

  Review receberReview(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null) {
      Review review = parametro.settings.arguments as Review;
      return review;
    } else {
      throw Exception('Problemas em receber o review');
    }
  }

  Widget agendamento(Review review) {
    return const Center(
        child: Text("Agendamento Teste", style: const TextStyle(fontSize: 30)));
  }

  Widget estrelas(Review review) {
    return Card(
      child: ListTile(
        title: const Text('Estrelas:'),
        onTap: () {},
        subtitle: Text(review.estrelas.toString()),
      ),
    );
  }

  Widget descricao(Review review) {
    return Card(
      child: ListTile(
        title: const Text('Descrição:'),
        onTap: () {},
        subtitle: Text(review.descricao),
      ),
    );
  }

  Widget botaoVoltar(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }
}
