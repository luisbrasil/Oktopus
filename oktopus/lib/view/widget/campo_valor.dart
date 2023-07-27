import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CampoValor extends StatelessWidget {
  final mascara = 'R\$ ########.##';
  final TextEditingController controle;
  const CampoValor({required this.controle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: controle,
      keyboardType: TextInputType.number,
      inputFormatters: [MaskTextInputFormatter(mask: mascara)],
      validator: (valorDigitado) => ehVazio(valorDigitado),
      decoration: const InputDecoration(
          label: Text('Valor:'),
          hintText: 'R\$0.00'
      ),
    );
  }

  String? ehVazio(String? valorDigitado){
    if(valorDigitado == null || valorDigitado.isEmpty) return 'O campo é obrigatório';
    return null;
  }
}