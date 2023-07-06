class Estudio{
  final dynamic id;
  final String nome;
  final String descricao;

  Estudio({
    this.id,
    required this.nome,
    required this.descricao
  });

  @override
  bool operator ==(other) => other is Estudio && other.id == id;
}