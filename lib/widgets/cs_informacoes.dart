import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';

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
             Text(
              'Nome: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: red),
            ),
            Flexible(
              child: Text(
                nome,
                maxLines: 1,
                style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
             Text(
              'Número: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: red),
            ),
            Flexible(
              child: Text(
                numero,
                maxLines: 1,
                style:  TextStyle(fontWeight: FontWeight.w500, color: grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Row(
          children: [
             Text(
              'Email: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: red),
            ),
            Flexible(
              child: Text(
                email,
                maxLines: 2,
                style:  TextStyle(fontWeight: FontWeight.w500, color: grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
