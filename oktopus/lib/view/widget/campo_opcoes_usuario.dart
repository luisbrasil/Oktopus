import 'package:flutter/material.dart';
import 'package:oktopus/database/sqlite/usuario_dao_sqlite.dart';
import 'package:oktopus/view/dto/usuario.dart';

class CampoOpcoesUsuario extends StatefulWidget {
  Usuario? opcaoSelecionado;
  CampoOpcoesUsuario({Key? key}) : super(key: key);

  @override
  State<CampoOpcoesUsuario> createState() => _CampoOpcoesUsuarioState();
}

class _CampoOpcoesUsuarioState extends State<CampoOpcoesUsuario> {
  void associarUsuario(Usuario usuario) {
    setState(() {
      widget.opcaoSelecionado = usuario;
    });
  }

  late Future<List<Usuario>> dadosBD;

  @override
  void initState() {
    super.initState();
    dadosBD = UsuarioDAOSQLite().consultarTodos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dadosBD,
        builder: (BuildContext context, AsyncSnapshot<List<Usuario>> resultado) {
          if (!resultado.hasData) return const CircularProgressIndicator();
          if (resultado.data == null)
            return const Text('Faça o cadastro de usuario primeiro.');
          List<Usuario> usuarios = resultado.data!;
          List<DropdownMenuItem<Usuario>> itensUsuario = usuarios
              .map((usuario) =>
              DropdownMenuItem(value: usuario, child: Text(usuario.nome)))
              .toList();
          return DropdownButtonFormField<Usuario>(
              hint: const Text('Usuario:'),
              isExpanded: true,
              items: itensUsuario,
              value: widget.opcaoSelecionado,
              onChanged: (usuarioEscolhida) {
                if (usuarioEscolhida != null) associarUsuario(usuarioEscolhida);
              });
        });
  }
}
