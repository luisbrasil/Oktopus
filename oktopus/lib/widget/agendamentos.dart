import 'package:flutter/material.dart';

class Agendamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus agendamentos")),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              )
            ]),
      ),
    );
  }
}
