import 'package:oktopus/view/dto/agendamento.dart';
import 'package:oktopus/view/dto/servico.dart';
import 'package:oktopus/view/dto/usuario.dart';
import 'package:oktopus/view/dto/estudio.dart';
import 'package:oktopus/view/dto/review.dart';

List<Agendamento> agendamentos = [
  Agendamento(usuario: usuarios[0], servico: servicos[0], data: DateTime.now()),
  Agendamento(usuario: usuarios[1], servico: servicos[1], data: DateTime.now()),
  Agendamento(usuario: usuarios[2], servico: servicos[2], data: DateTime.now()),
  Agendamento(usuario: usuarios[3], servico: servicos[3], data: DateTime.now())
];

List<Usuario> usuarios = [
  Usuario(
      id: 1,
      nome: 'Pedro Kusiak',
      email: 'pedrokusiak@gmail.com',
      cpf: "664.334.260-00",
      urlAvatar:
          'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png'),
  Usuario(
      id: 2,
      nome: 'Vinicius Koiti',
      email: 'viniciuskoiti@gmail.com',
      cpf: '289.957.110-94',
      urlAvatar:
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'),
  Usuario(
      id: 3,
      nome: 'Felipe da Hora',
      email: 'lipedahora@gmail.com',
      cpf: '034.071.910-90',
      urlAvatar:
          'https://cdn.pixabay.com/photo/2017/04/30/11/42/hijab-2272708_1280.png'),
  Usuario(
      id: 4,
      nome: 'Santyero',
      email: 'sandero@gmail.com',
      cpf: '585.892.160-47',
      urlAvatar:
          'https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_1280.png'),
];

List<Estudio> estudios = [
  Estudio(id: 1, nome: "Tinker's Workshop", descricao: "Estudio técnico"),
  Estudio(id: 2, nome: "Lula's Tainting", descricao: "Só o polvão"),
  Estudio(id: 3, nome: "ColorMaster", descricao: "Estudio bing chilling"),
  Estudio(id: 4, nome: "Fura Pé", descricao: "Venha furar seu pé")
];

List<Servico> servicos = [
  Servico(
      estudio: estudios[0],
      nome: "Tatuagem nas Costas",
      descricao: "30x50",
      valor: 700),
  Servico(
      estudio: estudios[1],
      nome: "Tatuagem econômica",
      descricao: "5x5",
      valor: 50),
  Servico(
      estudio: estudios[2],
      nome: "Tatuagem Chinesa",
      descricao: "BING CHILLING",
      valor: 100),
  Servico(
      estudio: estudios[3],
      nome: "Piercing no dedão do pé",
      descricao: "Não dói",
      valor: 70),
];

List<Review> reviews = [
  Review(agendamento: 0, descricao: "muito bom joinha", estrelas: 5),
  Review(
      agendamento: 1,
      descricao: "maluco meteu uma tatuagem de chiclete",
      estrelas: 2),
  Review(agendamento: 2, descricao: "冰淇淋", estrelas: 5),
  Review(agendamento: 3, descricao: "doeu pakas", estrelas: 1),
];
