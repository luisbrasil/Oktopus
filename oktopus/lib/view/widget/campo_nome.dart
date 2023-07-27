import 'package:flutter/material.dart';

class CampoNome extends StatelessWidget {
  final qtdeMinimaCaracteres = 1;
  final TextEditingController controle;
  const CampoNome({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.text,
      validator: (valorDigitado) {
        String? msnErro =
            ehVazio(valorDigitado) ?? temMinimoCaracteres(valorDigitado);
        return msnErro;
      },
      decoration: const InputDecoration(
          label: Text('Nome:'), hintText: 'Informe o nome'),
    );
  }

  String? ehVazio(String? valorDigitado) {
    if (valorDigitado == null || valorDigitado.isEmpty) {
      return 'O campo é obrigatório';
    }
    return null;
  }

  String? temMinimoCaracteres(String? valorDigitado) {
    if (valorDigitado!.length < qtdeMinimaCaracteres) {
      return 'O campo deve possuir pelo menos 1 caracter';
    }
    return null;
  }
}
