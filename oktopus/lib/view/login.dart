import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../../rotas.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          heightFactor: 0.5,
          child: Column(
            children: [
              const Text(
                'Oktopus',
                style: TextStyle(
                  fontSize: 24, // Set the font size to 24
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'E-mail:', border: UnderlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Senha:', border: UnderlineInputBorder()),
                obscureText: true,
              ),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Entrar'),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Rotas.home, (Route<dynamic> route) => false);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Cadastrar-se'),
                    onPressed: () {
                      Navigator.pushNamed(context, Rotas.cadastroUsuario);
                    },
                  ),
                )
              ]),
              Expanded(
                  child: ElevatedButton(
                child: const Text('Gerenciar Usuários'),
                onPressed: () {
                  Navigator.pushNamed(
                      context, Rotas.usuariosLista);
                },
              )),
              const Spacer(),
              Expanded(
                  child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Rotas.home, (Route<dynamic> route) => false);
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
