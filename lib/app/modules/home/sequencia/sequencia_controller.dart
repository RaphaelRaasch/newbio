import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sequencia_controller.g.dart';

@Injectable()
class SequenciaController = _SequenciaControllerBase with _$SequenciaController;

abstract class _SequenciaControllerBase with Store {
  @action
  Future setLatLng(idClient) async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('POSITION: ${position.latitude}');
    print('POSITION: ${position.longitude}');
    var lat = position.latitude.toString();
    var lng = position.longitude.toString();

    var response = await http.patch(
      'http://multidev.com.br/biotrack/api/clientes/$idClient/',
      body: {'latitude': lat, 'longitude': lng},
    );
    print(response.statusCode);
    print(response.body);
  }
}
