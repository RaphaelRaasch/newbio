// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motorista_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MotoristaStore on _MotoristaStoreBase, Store {
  final _$motoristaAtom = Atom(name: '_MotoristaStoreBase.motorista');

  @override
  int get motorista {
    _$motoristaAtom.reportRead();
    return super.motorista;
  }

  @override
  set motorista(int value) {
    _$motoristaAtom.reportWrite(value, super.motorista, () {
      super.motorista = value;
    });
  }

  final _$_MotoristaStoreBaseActionController =
      ActionController(name: '_MotoristaStoreBase');

  @override
  void setMotorista(int v) {
    final _$actionInfo = _$_MotoristaStoreBaseActionController.startAction(
        name: '_MotoristaStoreBase.setMotorista');
    try {
      return super.setMotorista(v);
    } finally {
      _$_MotoristaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
motorista: ${motorista}
    ''';
  }
}
