import 'package:flutter/material.dart';

import '../../rotas.dart';

class Busca extends StatelessWidget {
  const Busca({super.key});

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
              ElevatedButton(
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
              ElevatedButton(
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
            ]),
      ),
    );
  }
}
