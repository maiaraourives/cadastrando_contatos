class ContatosModel {
  ContatosModel.fromMapp(Map data) {
    _nome = data['nome'];
    _numero = data['numero'];
    _email = data['email'];
  }

  late String? _nome;
  late String? _numero;
  late String? _email;

  void setNome(String? nome) {
    _nome = nome;
  }

  String? get nome => _nome;

  void setNumero(String? numero) {
    _numero = numero;
  }

  String? get numero => _numero;

  void setEmail(String? email) {
    _email = email;
  }

  String? get email => _email;
}
