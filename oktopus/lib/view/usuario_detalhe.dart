import 'package:flutter/material.dart';
import 'package:oktopus/view/widget/foto_usuario.dart';

import 'dto/usuario.dart';

class UsuarioDetalhe extends StatelessWidget {
  const UsuarioDetalhe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Usuario usuario = receberUsuario(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(60),
        children: [
          FotoUsuario(usuario: usuario,raio: 150),
          nome(usuario),
          email(usuario),
          cpf(usuario)
        ],
      ),
      floatingActionButton: botaoVoltar(context),
    );
  }

  Usuario receberUsuario(BuildContext context) {
    var parametro = ModalRoute.of(context);
    if (parametro != null) {
      Usuario usuario = parametro.settings.arguments as Usuario;
      return usuario;
    } else {
      throw Exception('Problemas em receber o usuario');
    }
  }

  Widget nome(Usuario usuario){
    return Center(
        child: Text(
            usuario.nome,
            style: const TextStyle(fontSize: 30)
        )
    );
  }

  Widget email(Usuario usuario){
    return Card(
      child: ListTile(
        title: const Text('E-mail:'),
        onTap: (){},
        subtitle: Text(usuario.email),
      ),
    );
  }

  Widget cpf(Usuario usuario){
    return Card(
      child: ListTile(
        title: const Text('CPF:'),
        onTap: (){},
        subtitle: Text(usuario.cpf),
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
