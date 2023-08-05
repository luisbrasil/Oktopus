import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/estudio_dao_sqlite.dart';
import 'package:oktopus/view/dto/estudio.dart';

class CampoOpcoesEstudio extends StatefulWidget {
  Estudio? opcaoSelecionado;
  CampoOpcoesEstudio({Key? key}) : super(key: key);

  @override
  State<CampoOpcoesEstudio> createState() => _CampoOpcoesEstudioState();
}

class _CampoOpcoesEstudioState extends State<CampoOpcoesEstudio> {
  void associarEstudio(Estudio estudio) {
    setState(() {
      widget.opcaoSelecionado = estudio;
    });
  }

  late Future<List<Estudio>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = EstudioDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dadosBD,
        builder: (BuildContext context, AsyncSnapshot<List<Estudio>> resultado) {
          if (!resultado.hasData) return const CircularProgressIndicator();
          if (resultado.data == null)
            return const Text('Faça o cadastro de um estudio primeiro.');
          List<Estudio> estudios = resultado.data!;
          List<DropdownMenuItem<Estudio>> itensEstudio = estudios
              .map((estudio) =>
              DropdownMenuItem(value: estudio, child: Text(estudio.nome)))
              .toList();
          return DropdownButtonFormField<Estudio>(
              hint: const Text('Estudio:'),
              isExpanded: true,
              items: itensEstudio,
              value: widget.opcaoSelecionado,
              onChanged: (estudioEscolhida) {
                if (estudioEscolhida != null) associarEstudio(estudioEscolhida);
              });
        });
  }
}
