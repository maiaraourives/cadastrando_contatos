import 'package:cadastrando_contatos/widgets/cs_icon.dart';
import 'package:flutter/material.dart';

import '../configs/themes/colors.dart';

class CsConfiguracoes extends StatelessWidget {
  const CsConfiguracoes({
    required this.icon,
    required this.text,
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;
  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: white2,
      hoverColor: white2,
      highlightColor: white2,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            CsIcon(icon: icon),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: grey,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
