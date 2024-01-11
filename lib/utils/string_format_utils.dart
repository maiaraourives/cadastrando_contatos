///CamelCase
///
/// Ex: Uma Frase de Exemplo
String? capitalizeLetter(String? text) {
  if (text == null) {
    return null;
  }

  text = text.trim();
  text = text.toLowerCase();

  if (text.length <= 1) {
    return text.toUpperCase();
  }

  final List<String> words = text.split(' ');

  String capitalizedWords = '';

  for (int i = 0; i < words.length; i++) {
    final word = words[i].trim();

    if (word.isNotEmpty) {
      if (word.length > 2 || i == 0) {
        final String firstLetter = word.substring(0, 1).toUpperCase();
        final String remainingLetters = word.substring(1);

        capitalizedWords += '$firstLetter$remainingLetters ';
      } else {
        capitalizedWords += '$word ';
      }
    }

    capitalizedWords += '';
  }

  return capitalizedWords;
}

String valorNull(String? value, [String? pattern]) {
  if (value == null || value.trim().isEmpty || value == 'null') {
    return pattern ?? 'Sem informação';
  }

  return value;
}
