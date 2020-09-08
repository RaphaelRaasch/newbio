import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'map_controller.g.dart';

@Injectable()
class MapController = _MapControllerBase with _$MapController;

abstract class _MapControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
