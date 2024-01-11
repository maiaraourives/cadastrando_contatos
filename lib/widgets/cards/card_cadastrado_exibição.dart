import 'package:flutter/material.dart';

import '/configs/assets/assets_path.dart';
import '/configs/themes/colors.dart';
import '/widgets/cs_informacoes.dart';

class CardCadastradoExibicao extends StatelessWidget {
  const CardCadastradoExibicao({
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
      color: white2,
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
                      backgroundColor: grey,
                      child: CircleAvatar(
                        backgroundColor: red,
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
