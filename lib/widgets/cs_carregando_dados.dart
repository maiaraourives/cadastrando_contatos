import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';

class CsCarregandoDados extends StatelessWidget {
  const CsCarregandoDados({
    this.withMessage = false,
    this.height = 40,
    this.message,
    super.key,
  });

  final bool withMessage;
  final String? message;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Image(image: NetworkImage('https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExOWVmOTJhNGEwZGI5ZmFjN2RlOTgyMzk0Mjk1N2ZmMTNmYTQ4M2M1NCZjdD1z/QBvieWhHk6LC8WgeRv/giphy.gif'), height: 300, width: 400),
          ),
          if (withMessage) ...[
            const SizedBox(height: 20),
            Text(
              message ?? 'Carregando Dados',
              textAlign: TextAlign.center,
              style:  TextStyle(
                color: red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
