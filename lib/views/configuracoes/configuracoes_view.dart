import 'package:flutter/material.dart';
import 'package:open_settings/open_settings.dart';

import '/widgets/cs_configuracoes.dart';
import '/widgets/cs_app_bar.dart';

class ConfiguracoesView extends StatefulWidget {
  const ConfiguracoesView({super.key});

  @override
  State<ConfiguracoesView> createState() => _ConfiguracoesViewState();
}

class _ConfiguracoesViewState extends State<ConfiguracoesView> {

  /// Abre as configurações de rede
  Future<void> _openWifiSettings() async {
    try {
      await OpenSettings.openWIFISetting();
    } catch (_) {
      const Text(
        'Falha ao abrir as configurações',
        style: TextStyle(color: Color.fromRGBO(244, 67, 54, 1)),
      );
    }
  }

  /// Abre as configurações de localização
  Future<void> _openLocationSettings() async {
    try {
      await OpenSettings.openLocationSourceSetting();
    } catch (_) {
      const Text(
        'Falha ao abrir a localização',
        style: TextStyle(color: Color.fromRGBO(244, 67, 54, 1)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: const CsAppBar(title: 'Configurações'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          children: [
            const Text('Permissões', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(244, 67, 54, 1))),
            const SizedBox(height: 10),
            CsConfiguracoes(
              icon: Icons.location_on,
              text: 'Acesso a localização',
              onTap: _openLocationSettings,
            ),
            CsConfiguracoes(
              icon: Icons.wifi,
              text: 'Configurações do Wi-fi',
              onTap: _openWifiSettings,
            ),
          ],
        ),
      ),
    );
  }
}
