class Usuario{
  final dynamic id;
  final String nome;
  final String cpf;
  final String email;
  final String urlAvatar;

  Usuario({
    this.id,
    required this.nome,
    required this.cpf,
    required this.email,
    required this.urlAvatar,
  });

  @override
  bool operator ==(other) => other is Usuario && other.id == id;
}