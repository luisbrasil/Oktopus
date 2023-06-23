import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/agendamento_dao_sqlite.dart';
import 'package:oktopus/view/dto/agendamento.dart';

class CampoOpcoesAgendamento extends StatefulWidget {
  Agendamento? opcaoSelecionado;
  CampoOpcoesAgendamento({Key? key}) : super(key: key);

  @override
  State<CampoOpcoesAgendamento> createState() => _CampoOpcoesAgendamentoState();
}

class _CampoOpcoesAgendamentoState extends State<CampoOpcoesAgendamento> {
  void associarAgendamento(Agendamento agendamento) {
    setState(() {
      widget.opcaoSelecionado = agendamento;
    });
  }

  late Future<List<Agendamento>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = AgendamentoDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dadosBD,
        builder: (BuildContext context, AsyncSnapshot<List<Agendamento>> resultado) {
          if (!resultado.hasData) return const CircularProgressIndicator();
          if (resultado.data == null)
            return const Text('Faça o cadastro de agendamento primeiro.');
          List<Agendamento> agendamentos = resultado.data!;
          List<DropdownMenuItem<Agendamento>> itensAgendamento = agendamentos
              .map((agendamento) =>
                  DropdownMenuItem(value: agendamento, child: Text(agendamento.data.toString())))
              .toList();
          return DropdownButtonFormField<Agendamento>(
              hint: const Text('agendamento onde mora'),
              isExpanded: true,
              items: itensAgendamento,
              value: widget.opcaoSelecionado,
              onChanged: (agendamentoEscolhida) {
                if (agendamentoEscolhida != null) associarAgendamento(agendamentoEscolhida);
              });
        });
  }
}
