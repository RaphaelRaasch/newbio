import 'dart:async';
import 'dart:convert';
import 'package:biodriver/app/modules/model/cliente_model_model.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sequencia_controller.g.dart';

@Injectable()
class SequenciaController = _SequenciaControllerBase with _$SequenciaController;

abstract class _SequenciaControllerBase with Store {
  Geolocator geolocator = Geolocator();
  LocationOptions locationOptions = LocationOptions(
      accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 5);
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
  @observable
  bool completed = false;
  @observable
  bool initialized = false;
  @observable
  ClienteModel cliente = ClienteModel();
  @action
  Future getCliente(clienteID) async {
    var response = await http
        .get('http://multidev.com.br/biotrack/api/clientes/$clienteID/');
    var decode = json.decode(response.body);
    cliente = ClienteModel.fromJson(decode);
    print(response.statusCode);
  }

  @action
  Stream<StreamSubscription<Position>> streamPosition() {
    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      lat = position.latitude;
      lng = position.longitude;
      Firestore.instance
          .collection('userLocate')
          .document('Gestor ${cliente.gestao}')
          .updateData({
        'latitude': lat,
        'longitude': lng,
      });
    });
  }

  @action
  Future getLocation(gestor) async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    lat = position.latitude;
    lng = position.longitude;
    Firestore.instance
        .collection('userLocate')
        .document('Gestor ${cliente.gestao}')
        .setData(
      {
        'latitude': lat,
        'longitude': lng,
        'first_name': userStore.user.firstName,
        'last_name': userStore.user.lastName,
        'initilized': true,
        'completed': completed,
      },
    );
    initialized = true;
    streamPosition();
  }

  @action
  Future finalTrack(id) async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    lat = position.latitude;
    lng = position.longitude;
    Firestore.instance
        .collection('userLocate')
        .document('Gestor ${cliente.gestao}')
        .updateData(
      {
        'completed': completed,
      },
    );
    completed = false;
    initialized = false;
    var response = await http
        .delete('http://multidev.com.br/biotrack/api/sequencias/$id/');
    print(response.statusCode);
    print(response.body);
  }
}
