import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';
import '/configs/routes/local_routes.dart';

class CsMenu extends StatelessWidget {
  const CsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [pink, red], begin: Alignment.bottomCenter, end: Alignment.topCenter),
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
                        backgroundColor: red,
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
                      Text('Usuário', style: TextStyle(color: white, fontSize: 20.0)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {},
                        trailing: Icon(Icons.home, color: white),
                        title: Text('Home', style: TextStyle(color: white)),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.CADASTRANDO_CONTATOS),
                        trailing: Icon(Icons.add, color: white),
                        title: Text('Cadastro', style: TextStyle(color: white)),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.EDITAR_DADOS),
                        trailing: Icon(Icons.edit, color: white),
                        title: Text('Editar', style: TextStyle(color: white)),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.EXIBIR_DADOS),
                        trailing: Icon(Icons.phone_android, color: white),
                        title: Text('Exibir', style: TextStyle(color: white)),
                      ),
                      ListTile(
                        onTap: () => Navigator.pushNamed(context, LocalRoutes.CONFIGURACOES),
                        trailing: Icon(Icons.settings, color: white),
                        title: Text('Configurações', style: TextStyle(color: white, )),
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
