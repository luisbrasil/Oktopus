import 'package:flutter/material.dart';

import '../rotas.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introdução')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem-vindo ao Oktopus",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Entrar'),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Rotas.login);
              },
            ),
          ]
        ),
      ),
    );
  }
}
