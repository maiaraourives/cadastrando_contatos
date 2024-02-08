import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/cards/card_exibicao.dart';
import '../../widgets/cs_header.dart';
import '../../configs/assets/assets_path.dart';
import '../../database/cadastro/db_cadastro.dart';
import '../../database/tables/tables_usuario.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_elevated_button.dart';
import '../../widgets/cs_error.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import 'exibir_dados_state.dart';

class ExibirDadosView extends StatefulWidget {
  const ExibirDadosView({super.key});

  @override
  ExibirDadosViewState createState() => ExibirDadosViewState();
}

class ExibirDadosViewState extends State<ExibirDadosView> {
  final nomeController = TextEditingController();
  final numeroController = TextEditingController();
  final emailController = TextEditingController();

  final DBCadastro dao = DBCadastro();

  List<Contato> contatos = [];

  // List<Contato> contatosComErro = []; // List to store contacts with errors

  final _stateView = ExibirDadosState();

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
    //  try {
    //   contatosComErro = await dao.insertBatchWithErrors(); // Fetch contacts with errors
    // } catch (err) {
    //   _stateView.setError(value: true);
    // } finally {
    //   _stateView.setLoadingData(value: false);
    // }
  }

  void openFilterDialog() async {
    await FilterListDialog.display<Contato>(
      context,
      listData: contatos,
      selectedListData: contatos,
      choiceChipLabel: (contatos) => contatos!.nome,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (contatos, query) {
        return contatos.nome.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          contatos = List.from(list!);
        });

        Navigator.pop(context);
      },
      choiceChipBuilder: (context, contatos, isSelected) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected! ? const Color.fromRGBO(244, 67, 54, 1) : Colors.grey[300]!,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            contatos!.nome.toString(),
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        );
      },
    );
  }

  ExibirDadosViewState() {
    dao.connect().then((value) {
      load();
    });
  }

  load() {
    dao.list().then(
      (value) {
        setState(() {
          contatos = value;
          nomeController.text = '';
          numeroController.text = '';
          emailController.text = '';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: CsAppBar(
        title: 'Exibir dados',
        actions: [
          CsIconButton(
            icon: const CsIcon(icon: Icons.search, color: Color.fromRGBO(255, 255, 255, 1)),
            onPressed: openFilterDialog,
          ),
        ],
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
              const CsHeader(title: 'Lista de contatos'),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  itemCount: contatos.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardExibicao(
                          nome: contatos[index].nome,
                          numero: contatos[index].telefone,
                          email: contatos[index].email,
                        ),
                      ],
                    );
                  },
                ),
              ),
              // const CsHeader(title: 'Lista de contatos com erro'),
              // //Contatos com erro
              // Expanded(
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: contatosComErro.length,
              //     itemBuilder: (context, index) {
              //       return Column(
              //         children: [
              //           CardExibicao(
              //             nome: contatosComErro[index].nome,
              //             numero: contatosComErro[index].telefone,
              //             email: contatosComErro[index].email,
              //           ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
