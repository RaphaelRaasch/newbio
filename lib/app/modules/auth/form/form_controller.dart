import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'form_controller.g.dart';

@Injectable()
class FormController = _FormControllerBase with _$FormController;

abstract class _FormControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
