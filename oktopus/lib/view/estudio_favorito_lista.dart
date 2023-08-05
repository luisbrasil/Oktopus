import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/estudio_favorito_dao_sqlite.dart';
import 'package:oktopus/view/dto/estudio_favorito.dart';
import 'package:oktopus/view/widget/barra_navegacao.dart';
import 'package:oktopus/view/widget/painel_botoes.dart';

import '../rotas.dart';
import 'widget/botao_adicionar.dart';

class EstudioFavoritosLista extends StatefulWidget {
  EstudioFavoritosLista({Key? key}) : super(key: key);

  @override
  State<EstudioFavoritosLista> createState() => _EstudioFavoritosListaState();
}

class _EstudioFavoritosListaState extends State<EstudioFavoritosLista> {
  EstudioFavoritoDAOSQLite dao = EstudioFavoritoDAOSQLite();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista EstudioFavoritos')),
        body: criarLista(context),
        floatingActionButton: BotaoAdicionar(
            acao: () => Navigator.pushNamed(context, Rotas.estudioFavoritoForm)
                .then((value) => buscarEstudioFavoritos())),
        bottomNavigationBar: const BarraNavegacao(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked);
  }

  Future<List<EstudioFavorito>> buscarEstudioFavoritos() {
    setState(() {});
    return dao.consultarTodos();
  }

  Widget criarLista(BuildContext context) {
    return FutureBuilder(
      future: buscarEstudioFavoritos(),
      builder: (context, AsyncSnapshot<List<EstudioFavorito>> lista) {
        if (!lista.hasData) return const CircularProgressIndicator();
        if (lista.data == null) return const Text('Não há estudioFavoritos...');
        List<EstudioFavorito> listaEstudioFavoritos = lista.data!;
        return ListView.builder(
          itemCount: listaEstudioFavoritos.length,
          itemBuilder: (context, indice) {
            var estudioFavorito = listaEstudioFavoritos[indice];
            return criarItemLista(context, estudioFavorito);
          },
        );
      },
    );
  }

  Widget criarItemLista(BuildContext context, EstudioFavorito estudioFavorito) {
    return ItemLista(
        estudioFavorito: estudioFavorito,
        excluir: () {
          dao.excluir(estudioFavorito.usuario.id, estudioFavorito.estudio.id);
          buscarEstudioFavoritos();
        });
  }
}

class ItemLista extends StatelessWidget {
  final EstudioFavorito estudioFavorito;
  final VoidCallback excluir;

  const ItemLista(
      {required this.estudioFavorito,
        required this.excluir,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FractionallySizedBox(
        widthFactor: 0.25, // Set the width factor to 25% (0.25)
        child: Text("Usuário:${estudioFavorito.usuario.nome}"),
      ),
      title: Text("Estudio:${estudioFavorito.estudio.nome}"),
      trailing: PainelBotoes(excluir: excluir),
    );
  }
}
