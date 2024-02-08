import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/configs/themes/colors.dart';
import 'cs_icon.dart';
import 'cs_text_form_field.dart';

class CsAlertDialogEdit extends StatefulWidget {
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
  State<CsAlertDialogEdit> createState() => _CsAlertDialogEditState();
}

class _CsAlertDialogEditState extends State<CsAlertDialogEdit> {
  ///[Mask]
  final telefoneMask = TextInputMask(mask: '(99) 99999-9999');
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: white,
      elevation: 5,
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.width * 1.1,
        width: 350,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.pink], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
              ),
              child: const Text(
                'Atualizando dados',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.75,
                minWidth: MediaQuery.of(context).size.width * 0.75,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
              child: Column(
                children: [
                  CsTextFormField(
                    label: 'Nome',
                    hintText: 'Insira seu nome',
                    suffixIcon: const CsIcon(icon: Icons.person),
                    keyboardType: TextInputType.name,
                    controller: widget.nome,
                  ),
                  const SizedBox(height: 20),
                  CsTextFormField(
                    label: 'Número',
                    hintText: 'Insira seu número',
                    suffixIcon: const CsIcon(icon: Icons.phone_android),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      telefoneMask,
                    ],
                    controller: widget.numero,
                    maxLength: 20,
                  ),
                  const SizedBox(height: 10),
                  CsTextFormField(
                    label: 'Email',
                    hintText: 'Insira seu email',
                    suffixIcon: const CsIcon(icon: Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    controller: widget.email,
                    inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('Salvar', style: TextStyle(color: blue, fontSize: 16, fontWeight: FontWeight.w500)),
                          TextButton(
                            onPressed: widget.salvar,
                            child: CsIcon(icon: Icons.check_rounded, color: blue),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Text('Deletar', style: TextStyle(color: red, fontSize: 16, fontWeight: FontWeight.w500)),
                          TextButton(
                            onPressed: widget.deletar,
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
      ),
    );
  }
}
