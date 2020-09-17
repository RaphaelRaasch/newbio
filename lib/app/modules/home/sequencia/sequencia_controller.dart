import 'dart:async';
import 'dart:convert';

import 'package:biodriver/app/modules/model/viagem_model.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
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
      accuracy: LocationAccuracy.bestForNavigation, timeInterval: 5000);

  final UserStore user = Modular.get();

  @observable
  ViagemModel viagem;
  @observable
  ObservableStream positionStream;
  @observable
  String latitude = '';
  @observable
  String longitude = '';
  @observable
  bool navigator = false;

  var count = 0;
  @action
  Stream<Position> streamPosition() {
    StreamSubscription<Position> positionStream = Geolocator()
        .getPositionStream(locationOptions)
        .listen((Position position) {
      var lat = position.latitude.toString();
      var lng = position.longitude.toString();
      print(lat);
      print(lng);
      updateLocation(viagem.id.toString(), lat, lng);
    });

    count = count + 1;
    print(count);
  }

  @action
  Future updateLocation(id, lat, lng) async {
    var response = await http.patch('http://192.168.2.21:8080/api/viagem/$id/',
        body: ({'lat': lat, 'lng': lng}));
    print(response.statusCode);
    print(response.body);
  }

  @action
  Future getLocation(cliente) async {
    Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    var lat = position.latitude;
    var lng = position.longitude;
    if (navigator == false) {
      var response = await http.post('http://192.168.2.21:8080/api/viagem/',
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "lat": lat,
            "lng": lng,
            "motorista": user.user.userId,
            "cliente": cliente
          }));
      navigator = true;
      if (response.statusCode == 201) {
        var decode = json.decode(response.body);
        viagem = ViagemModel.fromJson(decode);
      }
      await Future.delayed(Duration(milliseconds: 200));
      streamPosition();
    } else {
      return;
    }
  }
}
