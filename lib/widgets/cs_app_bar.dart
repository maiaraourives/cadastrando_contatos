import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';

class CsAppBar extends StatelessWidget with PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.preferredSize = const Size.fromHeight(65),
    this.roundedRectangleBorder,
    this.elevation = 3,
    this.actions,
    this.leading,
    super.key,
    this.color,
  });

  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final RoundedRectangleBorder? roundedRectangleBorder;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color color = this.color ?? Colors.transparent;
    return AppBar(
      backgroundColor: color,
      elevation: 0.0,
      toolbarHeight: 70,
      title: FittedBox(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          gradient: LinearGradient(colors: [red, pink], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
      ),
      actions: actions,
      leading: leading,
    );
  }
}
