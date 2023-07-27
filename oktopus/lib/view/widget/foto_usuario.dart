import 'package:flutter/material.dart';
import 'package:oktopus/view/dto/usuario.dart';

class FotoUsuario extends StatelessWidget {
  final Usuario usuario;
  final double? raio;

  const FotoUsuario({required this.usuario, this.raio, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = usuario.urlAvatar;
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(
            backgroundImage: NetworkImage(url),
            radius: raio,
          )
        : const CircleAvatar(child: Icon(Icons.person));
  }
}