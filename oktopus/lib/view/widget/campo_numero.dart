import 'package:flutter/material.dart';

class CampoNumero extends StatelessWidget {
  final TextEditingController controle;
  const CampoNumero({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration(
          label: Text('Número:'),
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }
}