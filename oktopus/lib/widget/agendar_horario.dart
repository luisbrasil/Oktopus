import 'package:flutter/material.dart';

import '../rotas.dart';

class AgendarHorario extends StatelessWidget {
  const AgendarHorario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendar Horário")),
      body: ElevatedButton(
        child: const Text('Confirmar Agendamento'),
        onPressed: () {
          Navigator.popAndPushNamed(context, Rotas.agendamentos);
        },
      ),
    );
  }
}
