import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configs/routes/local_routes.dart';
import 'router_app.dart';
import 'services/navigation_service.dart';
import 'services/service_locator.dart';
import 'views/rota-erro-widget/rota_erro_widget_view.dart';
import 'widgets/no_glow_effect.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      setupServiceLocator();

      //Bloqueia a orientação do dispositivo como "Somente Retrato"
      SystemChrome.setPreferredOrientations(
        const [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );

      //Rota de erro(Para não aparecer o erro de tela vermelha para o usuário)
      ErrorWidget.builder = (errorDetails) {
        return const RotaErrorWidgetView();
      };

      runApp(const CadastroContatos());
    },
    (error, stackTrack) {},
  );
}

class CadastroContatos extends StatelessWidget {
  const CadastroContatos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const NoGlowEffect(),
          child: child!,
        );
      },
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Contatos',
      themeMode: ThemeMode.light,
      color: const Color.fromRGBO(255, 255, 255, 1),
      initialRoute: LocalRoutes.SPLASH_SCREEN,
      onGenerateRoute: RouterApp.onGenerateRoute,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }
}
