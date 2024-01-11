import 'dart:async';

import 'package:flutter/material.dart';

import '/configs/assets/assets_path.dart';
import '/configs/routes/local_routes.dart';
import '/services/navigation_service.dart';
import '/services/service_locator.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  SplashScreenViewState createState() => SplashScreenViewState();
}

class SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();

    _splash();
  }

  void _splash() async {
    Future.delayed(const Duration(seconds: 4), () {
      getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.TELA_INICIAl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(AssetsPath.ABERTURA, fit: BoxFit.fill),
            ),
          ],
        ),
      ),
    );
  }
}
