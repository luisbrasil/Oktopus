// import 'package:oktopus/view/dto/agendamento.dart';
// import 'package:oktopus/view/interface/agendamento_interface_dao.dart';

// class AgendamentoDAOFake implements AgendamentoInterfaceDao{

//   @override
//   Future<Agendamento> consultar(int id) {
//     return Future.value(agendamentos[id-1]);
//   }

//   @override
//   Future<List<Agendamento>> consultarTodos() {
//     return Future.value(agendamentos);
//   }

//   @override
//   bool excluir(dynamic id) {
//     print('excluir ${agendamentos[id-1]}');
//     agendamentos.remove(agendamentos[id-1]);
//     return true;
//   }

//   @override
//   Agendamento salvar(Agendamento agendamento) {
//     if(agendamento.id == null){
//       agendamento = Agendamento( 
//         id: agendamentos.length,
//         usuario: agendamento.usuario,
//         servico: agendamento.servico,
//         data: agendamento.data,
//       );
//       agendamentos.add(agendamento);
//     }else {
//       int i = (agendamento.id as int) -1;
//       agendamentos[i] = agendamento;
//     }

//     return agendamento;
//   }
// }