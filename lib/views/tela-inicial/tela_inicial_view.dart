// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';
import '/widgets/menu/cs_menu.dart';

class TelaInicialView extends StatefulWidget {
  const TelaInicialView({super.key});

  @override
  State<TelaInicialView> createState() => _TelaInicialView();
}

class _TelaInicialView extends State<TelaInicialView> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CsMenu(),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: const Duration(microseconds: 5000),
            curve: Curves.easeIn,
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((6) * val),
                child: ClipRRect(
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: red,
                      elevation: 0.0,
                      toolbarHeight: 70,
                      title: const FittedBox(
                        child: Text(
                          'Tela inicial',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      centerTitle: true,
                    ),
                    backgroundColor: white,
                    body: Center(
                      child: ListView(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: const Image(image: NetworkImage('https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif'), height: 300, width: 400),
                                ),
                                DefaultTextStyle(
                                  style: TextStyle(fontSize: 25, color: grey, fontWeight: FontWeight.bold, letterSpacing: 1),
                                  child: AnimatedTextKit(
                                    animatedTexts: [WavyAnimatedText('Seja Bem-vindo')],
                                    isRepeatingAnimation: true,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
