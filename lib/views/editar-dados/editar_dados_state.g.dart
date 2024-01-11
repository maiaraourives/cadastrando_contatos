// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editar_dados_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EditarDadosState on _EditarDadosState, Store {
  Computed<bool>? _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_EditarDadosState.error'))
      .value;
  Computed<bool>? _$loadingDataComputed;

  @override
  bool get loadingData =>
      (_$loadingDataComputed ??= Computed<bool>(() => super.loadingData,
              name: '_EditarDadosState.loadingData'))
          .value;

  late final _$_errorAtom =
      Atom(name: '_EditarDadosState._error', context: context);

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
      Atom(name: '_EditarDadosState._loadingData', context: context);

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

  late final _$_EditarDadosStateActionController =
      ActionController(name: '_EditarDadosState', context: context);

  @override
  void setError({required bool value}) {
    final _$actionInfo = _$_EditarDadosStateActionController.startAction(
        name: '_EditarDadosState.setError');
    try {
      return super.setError(value: value);
    } finally {
      _$_EditarDadosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingData({required bool value}) {
    final _$actionInfo = _$_EditarDadosStateActionController.startAction(
        name: '_EditarDadosState.setLoadingData');
    try {
      return super.setLoadingData(value: value);
    } finally {
      _$_EditarDadosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetState() {
    final _$actionInfo = _$_EditarDadosStateActionController.startAction(
        name: '_EditarDadosState.resetState');
    try {
      return super.resetState();
    } finally {
      _$_EditarDadosStateActionController.endAction(_$actionInfo);
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
