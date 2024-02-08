// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/configs/assets/assets_path.dart';
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
  final nomeController = TextEditingController();
  final numeroController = TextEditingController();
  final emailController = TextEditingController();

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
        nomeController.text = "";
        numeroController.text = "";
        emailController.text = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: const CsAppBar(
        title: 'Edição de dados',
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
                suffixIcon: CsIconButton(
                  icon: const CsIcon(icon: Icons.delete, color: Color.fromRGBO(255, 255, 255, 1)),
                  onPressed: () {
                    dao.delete(nomeController.text.trim()).then(
                      (c) {
                        load();
                      },
                    );
                  },
                ),
                controller: nomeController,
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
                          icon: const CsIcon(icon: Icons.edit, color: Color.fromRGBO(33, 150, 243, 1)),
                          editar: () => setState(
                            () {
                              nomeController.text = contatos[index].nome;
                              numeroController.text = contatos[index].telefone;
                              emailController.text = contatos[index].email;
                              showDialog<String>(
                                context: context,
                                builder: (_) => CsAlertDialogEdit(
                                  nome: nomeController,
                                  numero: numeroController,
                                  email: emailController,
                                  salvar: () {
                                    if (contatos != '') {
                                      var c = Contato(
                                        nome: nomeController.text,
                                        telefone: numeroController.text,
                                        email: emailController.text,
                                      );

                                      dao.update(c, contatos[index].nome).then((value) {
                                        load();
                                      });

                                      Navigator.pop(context);
                                    }
                                  },
                                  deletar: () {
                                    dao.delete(nomeController.text.trim()).then(
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
