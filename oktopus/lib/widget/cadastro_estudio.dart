import 'package:flutter/material.dart';

class CadastroEstudio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ElevatedButton(
        child: const Text('Cadastrar Estúdio'),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
    );
  }
}
