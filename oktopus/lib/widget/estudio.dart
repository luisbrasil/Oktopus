import 'package:flutter/material.dart';

import '../rotas.dart';

class Estudio extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Estudio Exemplo")),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            child: const Text('Agendar Horário'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.agendarHorario);
            },
          ),
          ElevatedButton(
            child: const Text('Reviews'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.reviews);
            },
          ),
          ElevatedButton(
            child: const Text('Chat'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.chat);
            },
          )
        ]),
      ),
    );
  }
}
