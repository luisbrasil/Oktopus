import 'package:flutter/material.dart';

import '../rotas.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            child: const Text('Entrar'),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Rotas.home, (Route<dynamic> route) => false);
            },
          ),
          ElevatedButton(
            child: const Text('Cadastrar-se'),
            onPressed: () {
              Navigator.pushNamed(context, Rotas.cadastroUsuario);
            },
          )
        ]),
      ),
    );
  }
}
