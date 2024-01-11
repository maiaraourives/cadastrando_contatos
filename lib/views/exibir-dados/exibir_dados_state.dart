// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'exibir_dados_state.g.dart';

class ExibirDadosState = _ExibirDadosState with _$ExibirDadosState;

abstract class _ExibirDadosState with Store {
  @observable
  bool _error = false;

  @observable
  bool _loadingData = false;

  @computed
  bool get error => _error;

  @computed
  bool get loadingData => _loadingData;

  @action
  void setError({required bool value}) {
    _error = value;
  }

  @action
  void setLoadingData({required bool value}) {
    _loadingData = value;

    if (value) {
      _error = false;
    }
  }

  @action
  void resetState() {
    _loadingData = false;
    _error = false;
  }
}
