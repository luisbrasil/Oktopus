import 'package:flutter/material.dart';

import '../rotas.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ElevatedButton(
        child: const Text('Estúdio Destaque'),
        onPressed: () {
          Navigator.pushNamed(context, Rotas.estudio);
        },
      ),
    );
  }
}
