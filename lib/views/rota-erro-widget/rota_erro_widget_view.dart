import 'package:flutter/material.dart';

import '/widgets/cs_app_bar.dart';
import '/configs/assets/assets_path.dart';
import '/widgets/cs_error.dart';

class RotaErrorWidgetView extends StatelessWidget {
  const RotaErrorWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CsAppBar(
        title: 'Error',
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: SingleChildScrollView(
          child: CsError(
            text: 'Ocorreu um problema desconhecido',
            image: AssetsPath.ERROR_DATA,
            actions: [],
          ),
        ),
      ),
    );
  }
}
