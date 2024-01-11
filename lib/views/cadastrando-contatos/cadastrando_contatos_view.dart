// ignore_for_file: unrelated_type_equality_checks

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
  final _nomeController = TextEditingController();
  final _numeroController = TextEditingController();
  final _emailController = TextEditingController();

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
        _nomeController.text = '';
        _numeroController.text = '';
        _emailController.text = '';
      });
    });
  }

  Future<void> _enviar({bool localAuth = false}) async {
    if (localAuth || _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (Contato != '') {
        var c = Contato(
          nome: _nomeController.text,
          telefone: _numeroController.text,
          email: _emailController.text,
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
                  labelText: 'Nome',
                  hintText: 'Insira seu nome',
                  suffixIcon: const CsIcon(icon: Icons.person),
                  keyboardType: TextInputType.name,
                  validator: Validator.nome,
                  controller: _nomeController,
                  inputFormatters: FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                ),
                const SizedBox(height: 20),
                CsTextFormField(
                  labelText: 'Número',
                  hintText: 'Insira seu número',
                  suffixIcon: const CsIcon(icon: Icons.phone_android),
                  keyboardType: TextInputType.phone,
                  validator: Validator.numero,
                  controller: _numeroController,
                  inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  maxLength: 20,
                ),
                const SizedBox(height: 10),
                CsTextFormField(
                  labelText: 'Email',
                  hintText: 'Insira seu email',
                  suffixIcon: const CsIcon(icon: Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.email,
                  controller: _emailController,
                  inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
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
