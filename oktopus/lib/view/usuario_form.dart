import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/usuario_dao_sqlite.dart';
import 'package:oktopus/view/dto/usuario.dart';
import 'package:oktopus/view/interface/usuario_interface_dao.dart';
import 'package:oktopus/view/widget/botao.dart';
import 'package:oktopus/view/widget/campo_cpf.dart';
import 'package:oktopus/view/widget/campo_email.dart';
import 'package:oktopus/view/widget/campo_nome.dart';
import 'package:oktopus/view/widget/campo_url_avatar.dart';

class UsuarioForm extends StatefulWidget {
  const UsuarioForm({Key? key}) : super(key: key);

  @override
  State<UsuarioForm> createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {
  final formKey = GlobalKey<FormState>();
  dynamic id;
  final campoNome = CampoNome(controle: TextEditingController());
  final campoEmail = CampoEmail(controle: TextEditingController());
  final campoCpf = CampoCpf(controle: TextEditingController());
  final campoUrlAvatar = CampoUrlAvatar(controle: TextEditingController());

  @override
  Widget build(BuildContext context) {
    receberUsuarioParaAlteracao(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro')),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                campoNome,
                campoEmail,
                campoCpf,
                campoUrlAvatar,
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
          var usuario = preencherDTO();
          UsuarioInterfaceDao dao = UsuarioDAOSQLite();
          dao.salvar(usuario);
          Navigator.pop(context);
        }
      },
    );
  }

  void receberUsuarioParaAlteracao(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null && parametro.settings.arguments != null) {
      Usuario usuario = parametro.settings.arguments as Usuario;
      id = usuario.id;
      preencherCampos(usuario);
    }
  }

  Usuario preencherDTO() {
    return Usuario(
        id: id,
        nome: campoNome.controle.text,
        email: campoEmail.controle.text,
        cpf: campoCpf.controle.text,
        urlAvatar: campoUrlAvatar.controle.text);
  }

  void preencherCampos(Usuario usuario) {
    campoNome.controle.text = usuario.nome;
    campoEmail.controle.text = usuario.email;
    campoCpf.controle.text = usuario.cpf;
    campoUrlAvatar.controle.text = usuario.urlAvatar;
  }
}
