import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/servico_dao_sqlite.dart';
import 'package:oktopus/view/dto/servico.dart';

class CampoOpcoesServico extends StatefulWidget {
  Servico? opcaoSelecionado;
  CampoOpcoesServico({Key? key}) : super(key: key);

  @override
  State<CampoOpcoesServico> createState() => _CampoOpcoesServicoState();
}

class _CampoOpcoesServicoState extends State<CampoOpcoesServico> {
  void associarServico(Servico servico) {
    setState(() {
      widget.opcaoSelecionado = servico;
    });
  }

  late Future<List<Servico>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = ServicoDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dadosBD,
        builder: (BuildContext context, AsyncSnapshot<List<Servico>> resultado) {
          if (!resultado.hasData) return const CircularProgressIndicator();
          if (resultado.data == null)
            return const Text('Faça o cadastro de servico primeiro.');
          List<Servico> servicos = resultado.data!;
          List<DropdownMenuItem<Servico>> itensServico = servicos
              .map((servico) =>
              DropdownMenuItem(value: servico, child: Text(servico.nome)))
              .toList();
          return DropdownButtonFormField<Servico>(
              hint: const Text('Servico:'),
              isExpanded: true,
              items: itensServico,
              value: widget.opcaoSelecionado,
              onChanged: (servicoEscolhida) {
                if (servicoEscolhida != null) associarServico(servicoEscolhida);
              });
        });
  }
}
