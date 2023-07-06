import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/review_dao_sqlite.dart';
import 'package:oktopus/view/dto/review.dart';
import 'package:oktopus/view/interface/review_interface_dao.dart';
import 'package:oktopus/view/widget/barra_navegacao.dart';
import 'package:oktopus/view/widget/painel_botoes.dart';

import '../rotas.dart';
import 'widget/botao_adicionar.dart';

class ReviewsLista extends StatefulWidget {
  ReviewsLista({Key? key}) : super(key: key);

  @override
  State<ReviewsLista> createState() => _ReviewsListaState();
}

class _ReviewsListaState extends State<ReviewsLista> {
  ReviewDAOSQLite dao = ReviewDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista Reviews')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.reviewForm)),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Future<List<Review>> buscarReviews() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarReviews(),
      builder: (context, AsyncSnapshot<List<Review>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há reviews...');
        List<Review> listaReviews = lista.data!;
        return ListView.builder(
          itemCount: listaReviews.length,
          itemBuilder: (context, indice) {
            var review = listaReviews[indice];
            return criarItemLista(context, review);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Review review) {
    return ItemLista(
        review: review,
        alterar: () {
          Navigator.pushNamed(context, Rotas.reviewForm, arguments: review)
              .then((value) => buscarReviews());
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.reviewDetalhe, arguments: review);
        },
        excluir: () {
          dao.excluir(review.id);
          buscarReviews();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Review review;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.review,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(review.agendamento.toString()),
      title: Text(review.estrelas.toString() + "Estrelas"),
      subtitle: Text(review.descricao),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
