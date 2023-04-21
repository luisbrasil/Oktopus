import 'package:flutter/material.dart';

import '../rotas.dart';

class Busca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buscar estúdios")),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Pesquisar',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Estudio 1'),
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.estudio);
                },
              ),
              ElevatedButton(
                child: const Text('Estudio 2'),
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.estudio);
                },
              ),
              ElevatedButton(
                child: const Text('Estudio 3'),
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.estudio);
                },
              )
            ]),
      ),
    );
  }
}
