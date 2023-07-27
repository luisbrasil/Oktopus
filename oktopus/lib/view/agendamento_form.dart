import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/agendamento_dao_sqlite.dart';
import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/interface/agendamento_interface_dao.dart';
import 'package:oktopus/view/widget/botao.dart';
import 'package:oktopus/view/widget/campo_data.dart';
import 'package:oktopus/view/widget/campo_opcoes_usuario.dart';
import 'package:oktopus/view/widget/campo_servico.dart';

class AgendamentoForm extends StatefulWidget {
  const AgendamentoForm({Key? key}) : super(key: key);

  @override
  State<AgendamentoForm> createState() => _AgendamentoFormState();
}

class _AgendamentoFormState extends State<AgendamentoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoUsuario = CampoOpcoesUsuario();
  final campoServico = CampoOpcoesServico();
  final campoData = CampoData(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberAgendamentoParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoUsuario,
                campoServico,
                campoData,
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
          var agendamento = preencherDTO();
          AgendamentoInterfaceDao dao = AgendamentoDAOSQLite();
          dao.salvar(agendamento);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberAgendamentoParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Agendamento agendamento = parametro.settings.arguments as Agendamento;
      id = agendamento.id;
      preencherCampos(agendamento);
    }
  }

  Agendamento preencherDTO() {
    return Agendamento(
        id: id,
        usuario: campoUsuario.opcaoSelecionado!,
        servico: campoServico.opcaoSelecionado!,
        data: DateTime.parse(campoData.controle.text));
  }

  void preencherCampos(Agendamento agendamento) {
    campoUsuario.opcaoSelecionado = agendamento.usuario;
    campoServico.opcaoSelecionado = agendamento.servico;
    campoData.controle.text = agendamento.data.toString();
  }
}
