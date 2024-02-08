import 'package:cadastrando_contatos/widgets/cs_icon.dart';
import 'package:flutter/material.dart';

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
      splashColor: const Color.fromRGBO(252, 252, 252, 1),
      hoverColor: const Color.fromRGBO(252, 252, 252, 1),
      highlightColor: const Color.fromRGBO(252, 252, 252, 1),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            CsIcon(icon: icon),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Color.fromRGBO(90, 90, 90, 1),
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
