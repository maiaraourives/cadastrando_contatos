import 'package:flutter/material.dart';

import '/configs/assets/assets_path.dart';
import '/widgets/cs_informacoes.dart';

class CardExibicao extends StatelessWidget {
  const CardExibicao({
    required this.nome,
    required this.numero,
    required this.email,
    this.editar,
    this.deletar,
    super.key,
  });

  final String nome;
  final String numero;
  final String email;
  final void Function()? editar;
  final void Function()? deletar;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color.fromRGBO(90, 90, 90, 1),
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(244, 67, 54, 1),
                        radius: 49,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(AssetsPath.USER, fit: BoxFit.fill, width: double.infinity),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CsInformacoes(
                    nome: nome,
                    numero: numero,
                    email: email,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
