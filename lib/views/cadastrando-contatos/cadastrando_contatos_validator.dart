class Validator {
  static String? nome(String? nome) {
    if (nome!.isEmpty) {
      return 'Informe um nome';
    }

    return null;
  }

  static String? numero(String? numero) {
    if (numero!.isEmpty) {
      return 'Informe um número';
    }

    return null;
  }

  static String? email(String? email) {
    if (email!.isEmpty) {
      return 'Informe um email';
    }

    return null;
  }
}
