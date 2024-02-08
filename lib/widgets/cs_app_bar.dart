import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.actions,
    this.leading,
    this.preferredSize = const Size.fromHeight(65),
    this.elevation = 8,
    super.key,
  });

  @override
  final Size preferredSize;

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 70,
      title: FittedBox(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.pink], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      actions: actions,
      leading: leading,
    );
  }
}
