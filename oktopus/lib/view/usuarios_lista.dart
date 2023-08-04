import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/usuario_dao_sqlite.dart';
import 'package:oktopus/view/dto/usuario.dart';
import 'package:oktopus/view/widget/barra_navegacao.dart';
import 'package:oktopus/view/widget/foto_usuario.dart';
import 'package:oktopus/view/widget/painel_botoes.dart';

import '../rotas.dart';
import 'widget/botao_adicionar.dart';

class UsuariosLista extends StatefulWidget {
  UsuariosLista({Key? key}) : super(key: key);

  @override
  State<UsuariosLista> createState() => _UsuariosListaState();
}

class _UsuariosListaState extends State<UsuariosLista> {
  UsuarioDAOSQLite dao = UsuarioDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista Usuarios')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.usuarioForm).then((value)=>buscarUsuarios())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Future<List<Usuario>> buscarUsuarios() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarUsuarios(),
      builder: (context, AsyncSnapshot<List<Usuario>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há usuarios...');
        List<Usuario> listaUsuarios = lista.data!;
        return ListView.builder(
          itemCount: listaUsuarios.length,
          itemBuilder: (context, indice) {
            var usuario = listaUsuarios[indice];
            return criarItemLista(context, usuario);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, Usuario usuario) {
    return ItemLista(
        usuario: usuario,
        alterar: () {
          Navigator.pushNamed(context, Rotas.usuarioForm, arguments: usuario).then((value)=>buscarUsuarios());
        },
        detalhes: () {
          Navigator.pushNamed(context, Rotas.usuarioDetalhe, arguments: usuario);
        },
        excluir: () {
          dao.excluir(usuario.id);
          buscarUsuarios();
        });
  }
}

class ItemLista extends StatelessWidget {
  final Usuario usuario;
  final VoidCallback alterar;
  final VoidCallback detalhes;
  final VoidCallback excluir;

  const ItemLista(
      {required this.usuario,
      required this.alterar,
      required this.detalhes,
      required this.excluir,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FotoUsuario(usuario: usuario,),
      title: Text(usuario.nome),
      subtitle: Text(usuario.email),
      trailing: PainelBotoes(alterar: alterar, excluir: excluir),
      onTap: detalhes,
    );
  }
}
