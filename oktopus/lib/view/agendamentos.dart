import 'package:flutter/material.dart';

class Agendamentos extends StatelessWidget {
  const Agendamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus agendamentos"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: const Text('Agendamento 1'),
            onPressed: () {
            },
          ),
          ElevatedButton(
            child: const Text('Agendamento 2'),
            onPressed: () {
            },
          ),
          ElevatedButton(
            child: const Text('Agendamento 3'),
            onPressed: () {
            },
          ),
        ],
      ),
    );
  }
}
