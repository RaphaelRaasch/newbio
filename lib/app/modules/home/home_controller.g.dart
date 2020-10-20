// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$observableFutureAtom =
      Atom(name: '_HomeControllerBase.observableFuture');

  @override
  ObservableFuture<List<MtrItemModel>> get observableFuture {
    _$observableFutureAtom.reportRead();
    return super.observableFuture;
  }

  @override
  set observableFuture(ObservableFuture<List<MtrItemModel>> value) {
    _$observableFutureAtom.reportWrite(value, super.observableFuture, () {
      super.observableFuture = value;
    });
  }

  final _$clientListAtom = Atom(name: '_HomeControllerBase.clientList');

  @override
  ObservableList<Sequencia> get clientList {
    _$clientListAtom.reportRead();
    return super.clientList;
  }

  @override
  set clientList(ObservableList<Sequencia> value) {
    _$clientListAtom.reportWrite(value, super.clientList, () {
      super.clientList = value;
    });
  }

  final _$listMtrAtom = Atom(name: '_HomeControllerBase.listMtr');

  @override
  ObservableList<MtrItemModel> get listMtr {
    _$listMtrAtom.reportRead();
    return super.listMtr;
  }

  @override
  set listMtr(ObservableList<MtrItemModel> value) {
    _$listMtrAtom.reportWrite(value, super.listMtr, () {
      super.listMtr = value;
    });
  }

  final _$listUserAtom = Atom(name: '_HomeControllerBase.listUser');

  @override
  ObservableList<MotoristaModel> get listUser {
    _$listUserAtom.reportRead();
    return super.listUser;
  }

  @override
  set listUser(ObservableList<MotoristaModel> value) {
    _$listUserAtom.reportWrite(value, super.listUser, () {
      super.listUser = value;
    });
  }

  final _$getMtrAsyncAction = AsyncAction('_HomeControllerBase.getMtr');

  @override
  Future<dynamic> getMtr() {
    return _$getMtrAsyncAction.run(() => super.getMtr());
  }

  @override
  String toString() {
    return '''
observableFuture: ${observableFuture},
clientList: ${clientList},
listMtr: ${listMtr},
listUser: ${listUser}
    ''';
  }
}
