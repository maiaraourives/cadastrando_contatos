import 'package:flutter/material.dart';

import '/configs/routes/local_routes.dart';

class CsMenu extends StatelessWidget {
  const CsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromRGBO(233, 30, 99, 1), Color.fromRGBO(244, 67, 54, 1)], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
        ),
        SafeArea(
          child: Container(
            width: 200.0,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: const Color.fromRGBO(244, 67, 54, 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image: NetworkImage('https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif'),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Usuário', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 17)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        trailing: const Icon(Icons.home, color: Color.fromRGBO(255, 255, 255, 1)),
                        title: const Text('Home', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.CADASTRANDO_CONTATOS),
                        trailing: const Icon(Icons.add, color: Color.fromRGBO(255, 255, 255, 1)),
                        title: const Text('Cadastro', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.EDITAR_DADOS),
                        trailing: const Icon(Icons.edit, color: Color.fromRGBO(255, 255, 255, 1)),
                        title: const Text('Editar', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.EXIBIR_DADOS),
                        trailing: const Icon(Icons.phone_android, color: Color.fromRGBO(255, 255, 255, 1)),
                        title: const Text('Exibir', style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1))),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.CONFIGURACOES),
                        trailing: const Icon(Icons.settings, color: Color.fromRGBO(255, 255, 255, 1)),
                        title: const Text(
                          'Configurações',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
