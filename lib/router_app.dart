import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'configs/routes/local_routes.dart';
import 'views/cadastrando-contatos/cadastrando_contatos_view.dart';
import 'views/configuracoes/configuracoes_view.dart';
import 'views/editar-dados/editar_dados_view.dart';
import 'views/exibir-dados/exibir_dados_view.dart';
import 'views/splash-screen/splash_screen_view.dart';
import 'views/tela-inicial/tela_inicial_view.dart';
import 'widgets/cs_app_bar.dart';
import 'widgets/cs_elevated_button.dart';
import 'widgets/cs_error.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.TELA_INICIAl:
        return _PageBuilder(
          child: const TelaInicialView(),
          settings: settings,
        );

      case LocalRoutes.SPLASH_SCREEN:
        return _PageBuilder(
          child: const SplashScreenView(),
          settings: settings,
        );

      case LocalRoutes.CADASTRANDO_CONTATOS:
        return _PageBuilder(
          child: const CadastrandoContatosView(),
          settings: settings,
        );

      case LocalRoutes.EDITAR_DADOS:
        return _PageBuilder(
          child: const EditarDadosView(),
          settings: settings,
        );

      case LocalRoutes.EXIBIR_DADOS:
        return _PageBuilder(
          child: const ExibirDadosView(),
          settings: settings,
        );

      case LocalRoutes.CONFIGURACOES:
        return _PageBuilder(
          child: const ConfiguracoesView(),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const _RotaInexistenteView(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  ///Responsável pelo efeito de 'fade transition' entre as transições de telas
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, secAnimation, child) {
            MediaQueryData data = MediaQuery.of(context);

            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Observer(
                builder: (_) {
                  return MediaQuery(
                    data: data.copyWith(
                      alwaysUse24HourFormat: true,
                    ),
                    child: child,
                  );
                },
              ),
            );
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}

class _RotaInexistenteView extends StatelessWidget {
  const _RotaInexistenteView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: const CsAppBar(title: 'Ops! Ocorreu um erro'),
      body: Center(
        child: SingleChildScrollView(
          child: CsError(
            text: 'Desculpe, a página que você está procurando não foi encontrada. Relate o seu problema abrindo um chamado no botão abaixo!',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
