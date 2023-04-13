import 'package:flutter/material.dart';

import '../rotas.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ElevatedButton(
        child: const Text('Home'),
        onPressed: () {
          Navigator.pushReplacementNamed(context, Rotas.home);
        },
      ),
    );
  }
}
