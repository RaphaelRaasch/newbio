// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequencia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SequenciaController on _SequenciaControllerBase, Store {
  final _$latAtom = Atom(name: '_SequenciaControllerBase.lat');

  @override
  double get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(double value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  final _$lngAtom = Atom(name: '_SequenciaControllerBase.lng');

  @override
  double get lng {
    _$lngAtom.reportRead();
    return super.lng;
  }

  @override
  set lng(double value) {
    _$lngAtom.reportWrite(value, super.lng, () {
      super.lng = value;
    });
  }

  final _$positionStreamAtom =
      Atom(name: '_SequenciaControllerBase.positionStream');

  @override
  ObservableStream<dynamic> get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(ObservableStream<dynamic> value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  final _$gestorAtom = Atom(name: '_SequenciaControllerBase.gestor');

  @override
  String get gestor {
    _$gestorAtom.reportRead();
    return super.gestor;
  }

  @override
  set gestor(String value) {
    _$gestorAtom.reportWrite(value, super.gestor, () {
      super.gestor = value;
    });
  }

  final _$doneAtom = Atom(name: '_SequenciaControllerBase.done');

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  final _$completedAtom = Atom(name: '_SequenciaControllerBase.completed');

  @override
  bool get completed {
    _$completedAtom.reportRead();
    return super.completed;
  }

  @override
  set completed(bool value) {
    _$completedAtom.reportWrite(value, super.completed, () {
      super.completed = value;
    });
  }

  final _$initializedAtom = Atom(name: '_SequenciaControllerBase.initialized');

  @override
  bool get initialized {
    _$initializedAtom.reportRead();
    return super.initialized;
  }

  @override
  set initialized(bool value) {
    _$initializedAtom.reportWrite(value, super.initialized, () {
      super.initialized = value;
    });
  }

  final _$clienteAtom = Atom(name: '_SequenciaControllerBase.cliente');

  @override
  ClienteModel get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ClienteModel value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$getClienteAsyncAction =
      AsyncAction('_SequenciaControllerBase.getCliente');

  @override
  Future<dynamic> getCliente(dynamic clienteID) {
    return _$getClienteAsyncAction.run(() => super.getCliente(clienteID));
  }

  final _$getLocationAsyncAction =
      AsyncAction('_SequenciaControllerBase.getLocation');

  @override
  Future<dynamic> getLocation(dynamic gestor) {
    return _$getLocationAsyncAction.run(() => super.getLocation(gestor));
  }

  final _$finalTrackAsyncAction =
      AsyncAction('_SequenciaControllerBase.finalTrack');

  @override
  Future<dynamic> finalTrack(dynamic id) {
    return _$finalTrackAsyncAction.run(() => super.finalTrack(id));
  }

  final _$_SequenciaControllerBaseActionController =
      ActionController(name: '_SequenciaControllerBase');

  @override
  Stream<StreamSubscription<Position>> streamPosition() {
    final _$actionInfo = _$_SequenciaControllerBaseActionController.startAction(
        name: '_SequenciaControllerBase.streamPosition');
    try {
      return super.streamPosition();
    } finally {
      _$_SequenciaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lat: ${lat},
lng: ${lng},
positionStream: ${positionStream},
gestor: ${gestor},
done: ${done},
completed: ${completed},
initialized: ${initialized},
cliente: ${cliente}
    ''';
  }
}
