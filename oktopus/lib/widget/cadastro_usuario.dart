import 'package:flutter/material.dart';

class CadastroUsuario extends StatelessWidget {
  const CadastroUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cadastro de Usuário')),
        body: Center(
          child: Form(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Nome:', border: UnderlineInputBorder()),
                  ),
                      Spacer(),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'E-mail:', border: UnderlineInputBorder()),
                  ),
                      Spacer(),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Senha:', border: UnderlineInputBorder()),
                    obscureText: true,
                  ),
                      Spacer(),
                  ElevatedButton(
                    child: const Text('Cadastrar-se'),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                ]),
              )),
        ));
  }
}
