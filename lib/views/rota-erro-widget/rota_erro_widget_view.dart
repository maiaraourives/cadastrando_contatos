import 'package:flutter/material.dart';

import '/configs/themes/colors.dart';
import '/widgets/cs_app_bar.dart';
import '/configs/assets/assets_path.dart';
import '/widgets/cs_error.dart';

class RotaErrorWidgetView extends StatelessWidget {
  const RotaErrorWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: CsAppBar(
        title: 'Error',
        color: red,
      ),
      backgroundColor: white,
      body: const Center(
        child: SingleChildScrollView(
          child: CsError(
            text: 'Ocorreu um problema desconhecido',
            image: AssetsPath.ERROR_DATA, actions: [],
          ),
        ),
      ),
    );
  }
}
