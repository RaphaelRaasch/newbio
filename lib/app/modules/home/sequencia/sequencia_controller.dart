import 'dart:async';

import 'package:biodriver/app/modules/model/viagem_model.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sequencia_controller.g.dart';

@Injectable()
class SequenciaController = _SequenciaControllerBase with _$SequenciaController;

abstract class _SequenciaControllerBase with Store {
  Geolocator geolocator = Geolocator();
  LocationOptions locationOptions = LocationOptions(
      accuracy: LocationAccuracy.bestForNavigation, timeInterval: 1);
  final UserStore userStore = Modular.get();
  Firestore firestore;
  @observable
  double lat;
  @observable
  double lng;
  @observable
  ObservableStream positionStream;
  @observable
  String gestor;
  @observable
  bool done = true;

  @action
  Stream<Position> streamPosition() {
      StreamSubscription<Position> positionStream = geolocator
          .getPositionStream(locationOptions)
          .listen((Position position) {
        lat = position.latitude;
        lng = position.longitude;
        Firestore.instance
            .collection('userLocate')
            .document('Motorista ${userStore.user.userId}')
            .updateData({
          'first_name': userStore.user.firstName,
          'last_name': userStore.user.lastName,
          'gestor': gestor,
          'latitude': lat,
          'longitude': lng,
        });
      });
    }

  @action
  Future getLocation() async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    lat = position.latitude;
    lng = position.longitude;
    Firestore.instance
        .collection('userLocate')
        .document('Motorista ${userStore.user.userId}')
        .setData(
      {
        'gestor': gestor,
        'latitude': lat,
        'longitude': lng,
      },
    );
    streamPosition();
  }
}
