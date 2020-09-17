// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequencia_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SequenciaController on _SequenciaControllerBase, Store {
  final _$viagemAtom = Atom(name: '_SequenciaControllerBase.viagem');

  @override
  ViagemModel get viagem {
    _$viagemAtom.reportRead();
    return super.viagem;
  }

  @override
  set viagem(ViagemModel value) {
    _$viagemAtom.reportWrite(value, super.viagem, () {
      super.viagem = value;
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

  final _$latitudeAtom = Atom(name: '_SequenciaControllerBase.latitude');

  @override
  String get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(String value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  final _$longitudeAtom = Atom(name: '_SequenciaControllerBase.longitude');

  @override
  String get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(String value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  final _$updateLocationAsyncAction =
      AsyncAction('_SequenciaControllerBase.updateLocation');

  @override
  Future<dynamic> updateLocation(dynamic id, dynamic lat, dynamic lng) {
    return _$updateLocationAsyncAction
        .run(() => super.updateLocation(id, lat, lng));
  }

  final _$getLocationAsyncAction =
      AsyncAction('_SequenciaControllerBase.getLocation');

  @override
  Future<dynamic> getLocation(dynamic cliente) {
    return _$getLocationAsyncAction.run(() => super.getLocation(cliente));
  }

  final _$_SequenciaControllerBaseActionController =
      ActionController(name: '_SequenciaControllerBase');

  @override
  Stream<Position> streamPosition() {
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
viagem: ${viagem},
positionStream: ${positionStream},
latitude: ${latitude},
longitude: ${longitude}
    ''';
  }
}
