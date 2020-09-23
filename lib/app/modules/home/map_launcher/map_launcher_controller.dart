import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'map_launcher_controller.g.dart';

@Injectable()
class MapLauncherController = _MapLauncherControllerBase
    with _$MapLauncherController;

abstract class _MapLauncherControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
