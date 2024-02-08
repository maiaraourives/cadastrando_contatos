import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

class CsElevatedButton extends StatelessWidget {
  const CsElevatedButton({
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.outlined = false,
    this.backgroundColor,
    this.height = 45,
    this.icon,
    super.key,
  });

  const CsElevatedButton.outlined({
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.backgroundColor,
    this.outlined = true,
    this.height = 45,
    this.icon,
    super.key,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool outlined;
  final String label;
  final Widget? icon;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: height,
      width: width,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(colors: [Color.fromARGB(255, 255, 99, 87), Color.fromARGB(255, 238, 73, 128)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon ?? Container(),
        clipBehavior: Clip.none,
        label: AutoSizeText(
          label.toUpperCase(),
          style: const TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w800),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((_) {
            if (backgroundColor != null) {
              return backgroundColor;
            }

            if (outlined) {
              // ignore: deprecated_member_use
              return theme.backgroundColor;
            }

            return Colors.transparent;
          }),
          textStyle: MaterialStateProperty.resolveWith((_) {
            if (outlined) {
              return const TextStyle(fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.w800);
            }

            // ignore: deprecated_member_use
            return theme.textTheme.button;
          }),
          elevation: MaterialStateProperty.all(2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        ),
      ),
    );
  }
}
