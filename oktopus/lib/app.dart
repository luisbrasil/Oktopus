import 'package:flutter/material.dart';
import 'package:oktopus/rotas.dart';
import 'package:oktopus/widget/agendamento.dart';
import 'package:oktopus/widget/busca.dart';
import 'package:oktopus/widget/cadastro_estudio.dart';
import 'package:oktopus/widget/cadastro_usuario.dart';
import 'package:oktopus/widget/chat.dart';
import 'package:oktopus/widget/estudio.dart';
import 'package:oktopus/widget/home.dart';
import 'package:oktopus/widget/index.dart';
import 'package:oktopus/widget/login.dart';
import 'package:oktopus/widget/reviews.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        '/': (context) => Index(),
        Rotas.login: (context) => Login(),
        Rotas.home: (context) => Home(),
        Rotas.cadastroUsuario: (context) => CadastroUsuario(),
        Rotas.agendamento: (context) => Agendamento(),
        Rotas.busca: (context) => Busca(),
        Rotas.cadastroEstudio: (context) => CadastroEstudio(),
        Rotas.chat: (context) => Chat(),
        Rotas.estudio: (context) => Estudio(),
        Rotas.reviews: (context) => Reviews()
      },
    );
  }
}
