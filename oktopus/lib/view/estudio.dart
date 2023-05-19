import 'package:flutter/material.dart';

import '../../rotas.dart';

class Estudio extends StatelessWidget {
  const Estudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Estudio Exemplo"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Rotas.reviews);
            },
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Rotas.chat);
            },
            icon: const Icon(Icons.chat),
          ),
        ],
      ),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 300,
            height: 80,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              icon: const Icon(Icons.calendar_today),
              label: const Text('Agendar Horário'),
              onPressed: () {
                Navigator.pushNamed(context, Rotas.agendarHorario);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
