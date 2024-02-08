import 'package:flutter/material.dart';

class CsIcon extends StatelessWidget {
  const CsIcon({
    required this.icon,
    this.size = 24,
    this.color,
    super.key,
  });

  final IconData? icon;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? const Color.fromRGBO(244, 67, 54, 1);

    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
