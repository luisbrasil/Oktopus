import 'package:flutter/material.dart';

import 'dto/agendamento.dart';

class AgendamentoDetalhe extends StatelessWidget {
  const AgendamentoDetalhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Agendamento agendamento = receberAgendamento(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(60),
        children: [
          usuario(agendamento),
          servico(agendamento),
          data(agendamento)
        ],
      ),
      floatingActionButton: botaoVoltar(context),
    );
  }

  Agendamento receberAgendamento(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null) {
      Agendamento agendamento = parametro.settings.arguments as Agendamento;
      return agendamento;
    } else {
      throw Exception('Problemas em receber o agendamento');
    }
  }

  Widget usuario(Agendamento agendamento){
    return Card(
      child: ListTile(
        title: const Text('Usuário:'),
        onTap: (){},
        subtitle: Text(agendamento.usuario.nome),
      ),
    );
  }

  Widget servico(Agendamento agendamento){
    return Card(
      child: ListTile(
        title: const Text('Servico:'),
        onTap: (){},
        subtitle: Text(agendamento.servico.nome),
      ),
    );
  }

  Widget data(Agendamento agendamento){
    return Card(
      child: ListTile(
        title: const Text('Data:'),
        onTap: (){},
        subtitle: Text(agendamento.data.toString()),
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
