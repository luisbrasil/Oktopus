import 'package:flutter/material.dart';

import '../rotas.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            child: const Text('Estúdio Destaque'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.estudio);
            },
          ),
          ElevatedButton(
            child: const Text('Meus Agendamentos'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.agendamentos);
            },
          ),
          ElevatedButton(
            child: const Text('Buscar Estúdios'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.busca);
            },
          )
        ]),
      ),
    );
  }
}
