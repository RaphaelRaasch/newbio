import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'sequencia_controller.g.dart';

@Injectable()
class SequenciaController = _SequenciaControllerBase with _$SequenciaController;

abstract class _SequenciaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
