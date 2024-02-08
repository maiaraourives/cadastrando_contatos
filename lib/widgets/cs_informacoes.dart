import 'package:flutter/material.dart';

class CsInformacoes extends StatelessWidget {
  const CsInformacoes({required this.nome, required this.numero, required this.email, super.key});

  final String nome;
  final String numero;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Nome: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(244, 67, 54, 1)),
            ),
            Flexible(
              child: Text(
                nome,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Color.fromRGBO(90, 90, 90, 1)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Text(
              'Número: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(244, 67, 54, 1)),
            ),
            Flexible(
              child: Text(
                numero,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(90, 90, 90, 1)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Text(
              'Email: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color.fromRGBO(244, 67, 54, 1)),
            ),
            Flexible(
              child: Text(
                email,
                maxLines: 2,
                style: const TextStyle(fontWeight: FontWeight.w500, color: Color.fromRGBO(90, 90, 90, 1)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
