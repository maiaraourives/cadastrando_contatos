import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';


class CsError extends StatelessWidget {
  const CsError({required this.text, this.image, required this.actions, super.key});

  final List<Widget>? actions;
  final String? image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network( 'https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif', width: double.maxFinite, height: 400),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style:  TextStyle(color: grey, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Container(margin: const EdgeInsets.all(5), child: Column(children: actions!)),
        ],
      ),
    );
  }
}
