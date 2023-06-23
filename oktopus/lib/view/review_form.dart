import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/review_dao_sqlite.dart';
import 'package:oktopus/view/dto/review.dart';
import 'package:oktopus/view/interface/review_interface_dao.dart';
import 'package:oktopus/view/widget/botao.dart';
import 'package:oktopus/view/widget/campo_descricao.dart';
import 'package:oktopus/view/widget/campo_estrelas.dart';
import 'package:oktopus/view/widget/campo_opcoes_agendamento.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({Key? key}) : super(key: key);

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoAgendamento = CampoOpcoesAgendamento();
  final campoDescricao = CampoDescricao(controle: TextEditingController());
  final campoEstrelas = CampoEstrelas(controle: TextEditingController());
  
  @override
  Widget build(BuildContext context) {
    receberReviewParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoAgendamento,
                campoDescricao,
                campoEstrelas,
                criarBotao(context),
              ],
            )));
  }

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var review = preencherDTO();
          ReviewInterfaceDao dao = ReviewDAOSQLite();
          dao.salvar(review);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberReviewParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Review review = parametro.settings.arguments as Review;
      id = review.id;
      preencherCampos(review);
    }
  }

  Review preencherDTO() {
    return Review(
        id: id,
        agendamento: campoAgendamento.opcaoSelecionado!,
        descricao: campoDescricao.controle.text,
        estrelas: int.parse(campoEstrelas.controle.text));
  }

  void preencherCampos(Review review) {
    campoAgendamento.opcaoSelecionado = review.agendamento;
    campoDescricao.controle.text = review.descricao;
    campoEstrelas.controle.text = review.estrelas.toString();
  }
}
