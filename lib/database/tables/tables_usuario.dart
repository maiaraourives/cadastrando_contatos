class Contato {
  static const String tableContato = 'Contato';
  static const String columnPk = 'pk';
  static const String columnNome = 'nome';
  static const String columnTelefone = 'telefone';
  static const String columnEmail = 'email';

  final String nome;
  final String telefone;
  final String email;

  Contato({required this.nome, required this.telefone, required this.email});

  Map<String, dynamic> toMap() {
    return {'nome': nome, 'telefone': telefone, 'email': email};
  }
}
