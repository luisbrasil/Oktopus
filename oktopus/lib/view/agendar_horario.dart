import 'package:flutter/material.dart';

import '../../rotas.dart';

class AgendarHorario extends StatelessWidget {
  AgendarHorario({super.key});

  DateTime dataAtual = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Agendar Horário")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      initialDate: dataAtual,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100));
                },
                child: const Text('Seleciona o Dia')),
            const Spacer(),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                icon: const Icon(Icons.calendar_today),
                label: const Text('Confirmar Agendamento'),
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.agendarHorario);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
