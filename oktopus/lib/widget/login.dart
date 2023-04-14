import 'package:flutter/material.dart';

import '../rotas.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ElevatedButton(
        child: const Text('Entrar'),
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(context, Rotas.home, (Route<dynamic> route) => false);
        },
      ),
    );
  }
}
