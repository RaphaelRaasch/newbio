import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'card_sequencia_controller.g.dart';

@Injectable()
class CardSequenciaController = _CardSequenciaControllerBase
    with _$CardSequenciaController;

abstract class _CardSequenciaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
