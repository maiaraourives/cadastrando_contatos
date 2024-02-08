// ignore_for_file: unrelated_type_equality_checks

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/configs/routes/local_routes.dart';
import '/configs/themes/colors.dart';
import '/database/cadastro/db_cadastro.dart';
import '/database/tables/tables_usuario.dart';
import '/services/navigation_service.dart';
import '/services/service_locator.dart';
import '/widgets/cs_app_bar.dart';
import '/widgets/cs_elevated_button.dart';
import '/widgets/cs_icon.dart';
import '/widgets/cs_text_form_field.dart';
import 'cadastrando_contatos_validator.dart';

class CadastrandoContatosView extends StatefulWidget {
  const CadastrandoContatosView({super.key});

  @override
  State<CadastrandoContatosView> createState() => _CadastrandoContatosViewState();
}

class _CadastrandoContatosViewState extends State<CadastrandoContatosView> {
  final nomeController = TextEditingController();
  final numeroController = TextEditingController();
  final emailController = TextEditingController();

  ///[Mask]
  final telefoneMask = TextInputMask(mask: '(99) 99999-9999');

  final _formKey = GlobalKey<FormState>();

  final DBCadastro dao = DBCadastro();

  List<Contato> contatos = [];

  _CadastrandoContatosViewState() {
    dao.connect().then((value) {
      load();
    });
  }

  load() {
    dao.list().then((value) {
      setState(() {
        contatos = value;
        nomeController.text = '';
        numeroController.text = '';
        emailController.text = '';
      });
    });
  }

  Future<void> _enviar({bool localAuth = false}) async {
    if (localAuth || _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (Contato != '') {
        var c = Contato(
          nome: nomeController.text,
          telefone: numeroController.text,
          email: emailController.text,
        );
        dao.insert(c).then((value) {
          load();
        });
        getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.TELA_INICIAl);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: const CsAppBar(title: 'Cadastro de dados'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CsTextFormField(
                  label: 'Nome',
                  hintText: 'Insira seu nome',
                  suffixIcon: const CsIcon(icon: Icons.person),
                  keyboardType: TextInputType.name,
                  validator: Validator.nome,
                  controller: nomeController,
                ),
                const SizedBox(height: 20),
                CsTextFormField(
                  label: 'Número',
                  hintText: 'Insira seu número',
                  suffixIcon: const CsIcon(icon: Icons.phone_android),
                  keyboardType: TextInputType.phone,
                  validator: Validator.numero,
                  controller: numeroController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    telefoneMask,
                  ],
                  maxLength: 20,
                ),
                const SizedBox(height: 10),
                CsTextFormField(
                  label: 'Email',
                  hintText: 'Insira seu email',
                  suffixIcon: const CsIcon(icon: Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.email,
                  controller: emailController,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                ),
                const SizedBox(height: 20),
                CsElevatedButton(onPressed: _enviar, label: 'Enviar dados'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
