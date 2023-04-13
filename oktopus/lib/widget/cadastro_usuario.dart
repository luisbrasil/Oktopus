import 'package:flutter/material.dart';

import '../rotas.dart';

class CadastroUsuario extends StatelessWidget {
  const CadastroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuário')),
      body: ElevatedButton(
        child: const Text('Cadastrar-se'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Rotas.index);
        },
      ),
    );
  }
}
