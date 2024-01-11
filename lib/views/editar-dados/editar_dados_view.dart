// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/configs/assets/assets_path.dart';
import '/configs/themes/colors.dart';
import '/database/cadastro/db_cadastro.dart';
import '/database/tables/tables_usuario.dart';
import '/widgets//cs_alert_dialog_edit.dart';
import '/widgets/cards/card_cadastrado.dart';
import '/widgets/cs_app_bar.dart';
import '/widgets/cs_elevated_button.dart';
import '/widgets/cs_error.dart';
import '/widgets/cs_icon.dart';
import '/widgets/cs_icon_button.dart';
import '/widgets/cs_text_form_field_pesquisa.dart';
import 'editar_dados_state.dart';

class EditarDadosView extends StatefulWidget {
  const EditarDadosView({super.key});

  @override
  EditarDadosViewState createState() => EditarDadosViewState();
}

class EditarDadosViewState extends State<EditarDadosView> {
  final _nomeController = TextEditingController();
  final _numeroController = TextEditingController();
  final _emailController = TextEditingController();

  final DBCadastro dao = DBCadastro();

  List<Contato> contatos = [];

  final _stateView = EditarDadosState();

  @override
  void initState() {
    super.initState();

    _buscarContatos();
  }

  @override
  void dispose() {
    _stateView.resetState();

    super.dispose();
  }

  void _buscarContatos() async {
    _stateView.setLoadingData(value: true);

    try {} catch (err) {
      _stateView.setError(value: true);
    } finally {
      _stateView.setLoadingData(value: false);
    }
  }

  EditarDadosViewState() {
    dao.connect().then((value) {
      load();
    });
  }

  load() {
    dao.list().then((value) {
      setState(() {
        contatos = value;
        _nomeController.text = "";
        _numeroController.text = "";
        _emailController.text = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CsAppBar(
        title: 'Edição de dados',
        color: red,
      ),
      body: Observer(
        builder: (_) {
          if (_stateView.loadingData) {
            return const Image(
              image: NetworkImage(
                'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExOWVmOTJhNGEwZGI5ZmFjN2RlOTgyMzk0Mjk1N2ZmMTNmYTQ4M2M1NCZjdD1z/QBvieWhHk6LC8WgeRv/giphy.gif',
              ),
              height: 300,
              width: 400,
            );
          }

          if (_stateView.error) {
            return CsError(
              text: 'Ocorreu um erro desconhecido. Por favor, tente novamente ou entre em contato com o suporte!',
              image: AssetsPath.ERROR_DATA,
              actions: [
                CsElevatedButton(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.8,
                  label: 'Tentar Novamente',
                  onPressed: _buscarContatos,
                ),
              ],
            );
          }

          return Column(
            children: [
              CsTextFormFieldPesquisa(
                hintText: 'Digite o contato que deseja excluir',
                inputFormatters: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                suffixIcon: CsIconButton(
                  icon: CsIcon(icon: Icons.delete, color: white),
                  onPressed: () {
                    dao.delete(_nomeController.text.trim()).then(
                      (c) {
                        load();
                      },
                    );
                  },
                ),
                controller: _nomeController,
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: contatos.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardCadastrado(
                          nome: contatos[index].nome,
                          numero: contatos[index].telefone,
                          email: contatos[index].email,
                          icon: CsIcon(icon: Icons.edit, color: blue),
                          editar: () => setState(
                            () {
                              _nomeController.text = contatos[index].nome;
                              _numeroController.text = contatos[index].telefone;
                              _emailController.text = contatos[index].email;
                              showDialog<String>(
                                context: context,
                                builder: (_) => CsAlertDialogEdit(
                                  nome: _nomeController,
                                  numero: _numeroController,
                                  email: _emailController,
                                  salvar: () {
                                    if (contatos != '') {
                                      var c = Contato(
                                        nome: _nomeController.text,
                                        telefone: _numeroController.text,
                                        email: _emailController.text,
                                      );
                                      dao.insert(c).then(
                                        (value) {
                                          load();
                                        },
                                      );

                                      Navigator.pop(context);
                                    }
                                  },
                                  deletar: () {
                                    dao.delete(_nomeController.text.trim()).then(
                                      (c) {
                                        load();
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
