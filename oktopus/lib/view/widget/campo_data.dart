import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CampoData extends StatefulWidget {
  final TextEditingController controle;
  const CampoData({required this.controle, Key? key}) : super(key: key);

  @override
  _CampoDataState createState() => _CampoDataState();
}

class _CampoDataState extends State<CampoData> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: Locale("pt", "BR"), // Customize the locale if needed
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controle.text = DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: widget.controle,
      onTap: () {
        _selectDate(context);
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'O campo é obrigatório';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Data:',
        hintText: 'dd/mm/yyyy',
      ),
    );
  }
}