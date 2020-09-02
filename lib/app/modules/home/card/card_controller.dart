import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'card_controller.g.dart';

@Injectable()
class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
