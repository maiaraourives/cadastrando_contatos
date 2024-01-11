import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/configs/themes/colors.dart';

class CsTextFormFieldPesquisa<T> extends StatelessWidget {
  const CsTextFormFieldPesquisa({
    this.hintText,
    this.labelText,
    this.maxLength,
    this.validator,
    this.obscureText = false,
    this.autocorrect = true,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.keyboardType,
    this.enabled = true,
    this.inputFormatters,
    super.key,
  });

  final bool enabled;
  final int? maxLength;
  final String? hintText;
  final bool autocorrect;
  final bool obscureText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputFormatter? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: black,
      style: TextStyle(color: white),
      decoration: InputDecoration(
        fillColor: red,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: white, fontWeight: FontWeight.w400, letterSpacing: 1),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: red), borderRadius: BorderRadius.circular(0)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: red), borderRadius: BorderRadius.circular(0)),
      ),
      onTap: onTap,
      maxLength: maxLength,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: [
        if (inputFormatters != null) ...[
          inputFormatters!,
        ],
      ],
      onChanged: onChanged, //Atualiza o valor do campo NA HORA
      onSaved: onSaved, //Atualiza o valor do campo APÓS o submit
      enabled: enabled, //Desabilita o campo
    );
  }
}
