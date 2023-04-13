import 'package:flutter/material.dart';

import '../rotas.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Introdução')),
      body: ElevatedButton(
        child: const Text('Login'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Rotas.login);
        },
      ),
    );
  }
}