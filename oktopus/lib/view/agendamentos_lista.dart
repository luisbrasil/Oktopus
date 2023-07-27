import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/agendamento_dao_sqlite.dart';
import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/widget/barra_navegacao.dart';
import 'package:oktopus/view/widget/painel_botoes.dart';

import '../rotas.dart';
import 'widget/botao_adicionar.dart';

class AgendamentosLista extends StatefulWidget {
  AgendamentosLista({Key? key}) : super(key: key);

  @override
  State<AgendamentosLista> createState() => _AgendamentosListaState();
}

class _AgendamentosListaState extends State<AgendamentosLista> {
  AgendamentoDAOSQLite dao = AgendamentoDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista Agendamentos')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.agendamentoForm).then((value)=>buscarAgendamentos())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Future<List<Agendamento>> buscarAgendamentos() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarAgendamentos(),
      builder: (context, AsyncSnapshot<List<Agendamento>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há agendamentos...');
        List<Agendamento> listaAgendamentos = lista.data!;
        return ListView.builder(
          itemCount: listaAgendamentos.length,
          itemBuilder: (context, indice) {
            var agendamento = listaAgendamentos[indice];
            return criarItemLista(context, agendamento);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Agendamento agendamento) {
    return ItemLista(
        agendamento: agendamento,
        alterar: () {
          Navigator.pushNamed(context, Rotas.agendamentoForm, arguments: agendamento).then((value)=>buscarAgendamentos());
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.agendamentoDetalhe, arguments: agendamento);
        },
        excluir: () {
          dao.excluir(agendamento.id);
          buscarAgendamentos();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Agendamento agendamento;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.agendamento,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(agendamento.data.toString()),
      title: Text("Usuário:${agendamento.usuario.nome}"),
      subtitle: Text("Servico:${agendamento.servico.nome}"),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
