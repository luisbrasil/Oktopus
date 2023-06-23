import 'package:flutter/material.dart';
import 'package:oktopus/rotas.dart';
import 'package:oktopus/view/agendamentos.dart';
import 'package:oktopus/view/agendar_horario.dart';
import 'package:oktopus/view/busca.dart';
import 'package:oktopus/view/cadastro_usuario.dart';
import 'package:oktopus/view/chat.dart';
import 'package:oktopus/view/estudio.dart';
import 'package:oktopus/view/home.dart';
import 'package:oktopus/view/index.dart';
import 'package:oktopus/view//login.dart';
import 'package:oktopus/view/review_detalhe.dart';
import 'package:oktopus/view/review_form.dart';
import 'package:oktopus/view/reviews_lista.dart';

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
        Rotas.agendarHorario: (context) => AgendarHorario(),
        Rotas.busca: (context) => Busca(),
        Rotas.chat: (context) => Chat(),
        Rotas.estudio: (context) => Estudio(),
        Rotas.reviews: (context) => ReviewsLista(),
        Rotas.reviewForm: (context) => ReviewForm(),
        Rotas.reviewDetalhe: (context) => ReviewDetalhe(),
        Rotas.agendamentos: (context) => Agendamentos(),
      },
    );
  }
}
