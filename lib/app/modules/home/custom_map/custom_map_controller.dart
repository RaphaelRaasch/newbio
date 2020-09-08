import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'custom_map_controller.g.dart';

@Injectable()
class CustomMapController = _CustomMapControllerBase with _$CustomMapController;

abstract class _CustomMapControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
