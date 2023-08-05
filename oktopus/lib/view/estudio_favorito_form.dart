import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/estudio_favorito_dao_sqlite.dart';
import 'package:oktopus/view/dto/estudio_favorito.dart';
import 'package:oktopus/view/interface/estudio_favorito_interface_dao.dart';
import 'package:oktopus/view/widget/botao.dart';
import 'package:oktopus/view/widget/campo_opcoes_estudio.dart';
import 'package:oktopus/view/widget/campo_opcoes_usuario.dart';

class EstudioFavoritoForm extends StatefulWidget {
  const EstudioFavoritoForm({Key? key}) : super(key: key);

  @override
  State<EstudioFavoritoForm> createState() => _EstudioFavoritoFormState();
}

class _EstudioFavoritoFormState extends State<EstudioFavoritoForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoUsuario = CampoOpcoesUsuario();
  final campoEstudio = CampoOpcoesEstudio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoUsuario,
                campoEstudio,
                criarBotao(context),
              ],
            )
        )
    );
  }

  Widget criarBotao(BuildContext context) {
    return Botao(
      context: context,
      salvar: () {
        var formState = formKey.currentState;
        if (formState != null && formState.validate()) {
          var estudioFavorito = preencherDTO();
          EstudioFavoritoInterfaceDao dao = EstudioFavoritoDAOSQLite();
          dao.salvar(estudioFavorito);
          Navigator.pop(context);
        }
      },
    );
  }

  EstudioFavorito preencherDTO() {
    return EstudioFavorito(
        usuario: campoUsuario.opcaoSelecionado!,
        estudio: campoEstudio.opcaoSelecionado!);
  }
}
