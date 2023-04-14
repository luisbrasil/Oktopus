import 'package:flutter/material.dart';

import '../rotas.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introdução')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, Rotas.login);
              },
            ),
            ElevatedButton(
              child: const Text('Cadastrar-se'),
              onPressed: () {
                Navigator.pushNamed(context, Rotas.cadastroUsuario);
              },
            )
          ]
        ),
      ),
    );
  }
}
