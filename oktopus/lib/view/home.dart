import 'package:flutter/material.dart';

import '../../rotas.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            Card(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: SizedBox(
                  width: 250,
                  height: 200,
                  child: Image.asset('images/estudioteste.png', fit: BoxFit.cover),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.estudio);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Meus Agendamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar Estúdios',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, Rotas.agendamentos);
              break;
            case 1:
              Navigator.pushNamed(context, Rotas.busca);
              break;
          }
        },
      ),
    );
  }
}