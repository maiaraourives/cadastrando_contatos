import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/configs/themes/colors.dart';
import 'cs_icon.dart';
import 'cs_text_form_field.dart';

class CsAlertDialogEdit extends StatelessWidget {
  const CsAlertDialogEdit({
    required this.nome,
    required this.numero,
    required this.email,
    required this.salvar,
    required this.deletar,
    super.key,
  });

  final TextEditingController? nome;
  final TextEditingController? numero;
  final TextEditingController? email;
  final void Function()? salvar;
  final void Function()? deletar;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Atualizando dados',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: red, fontWeight: FontWeight.w500, letterSpacing: 0.5),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(
              children: [
                CsTextFormField(
                  labelText: 'Nome',
                  hintText: 'Insira seu nome',
                  suffixIcon: const CsIcon(icon: Icons.person),
                  keyboardType: TextInputType.name,
                  inputFormatters: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  controller: nome,
                ),
                const SizedBox(height: 20),
                CsTextFormField(
                  labelText: 'Número',
                  hintText: 'Insira seu número',
                  suffixIcon: const CsIcon(icon: Icons.phone_android),
                  keyboardType: TextInputType.phone,
                  inputFormatters: FilteringTextInputFormatter.digitsOnly,
                  controller: numero,
                  maxLength: 20,
                ),
                const SizedBox(height: 10),
                CsTextFormField(
                  labelText: 'Email',
                  hintText: 'Insira seu email',
                  suffixIcon: const CsIcon(icon: Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  inputFormatters: FilteringTextInputFormatter.singleLineFormatter,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('Salvar', style: TextStyle(color: blue, fontSize: 16, fontWeight: FontWeight.w500)),
                        TextButton(
                          onPressed: salvar,
                          child: CsIcon(icon: Icons.check_rounded, color: blue),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Text('Deletar', style: TextStyle(color: red, fontSize: 16, fontWeight: FontWeight.w500)),
                        TextButton(
                          onPressed: deletar,
                          child: const CsIcon(icon: Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
