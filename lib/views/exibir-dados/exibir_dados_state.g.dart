// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exibir_dados_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExibirDadosState on _ExibirDadosState, Store {
  Computed<bool>? _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_ExibirDadosState.error'))
      .value;
  Computed<bool>? _$loadingDataComputed;

  @override
  bool get loadingData =>
      (_$loadingDataComputed ??= Computed<bool>(() => super.loadingData,
              name: '_ExibirDadosState.loadingData'))
          .value;

  late final _$_errorAtom =
      Atom(name: '_ExibirDadosState._error', context: context);

  @override
  bool get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(bool value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_loadingDataAtom =
      Atom(name: '_ExibirDadosState._loadingData', context: context);

  @override
  bool get _loadingData {
    _$_loadingDataAtom.reportRead();
    return super._loadingData;
  }

  @override
  set _loadingData(bool value) {
    _$_loadingDataAtom.reportWrite(value, super._loadingData, () {
      super._loadingData = value;
    });
  }

  late final _$_ExibirDadosStateActionController =
      ActionController(name: '_ExibirDadosState', context: context);

  @override
  void setError({required bool value}) {
    final _$actionInfo = _$_ExibirDadosStateActionController.startAction(
        name: '_ExibirDadosState.setError');
    try {
      return super.setError(value: value);
    } finally {
      _$_ExibirDadosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingData({required bool value}) {
    final _$actionInfo = _$_ExibirDadosStateActionController.startAction(
        name: '_ExibirDadosState.setLoadingData');
    try {
      return super.setLoadingData(value: value);
    } finally {
      _$_ExibirDadosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_ExibirDadosStateActionController.startAction(
        name: '_ExibirDadosState.resetState');
    try {
      return super.resetState();
    } finally {
      _$_ExibirDadosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
loadingData: ${loadingData}
    ''';
  }
}
