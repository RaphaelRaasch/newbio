import 'package:biodriver/app/modules/model/motorista_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'motorista_store.g.dart';

@Injectable()
class MotoristaStore = _MotoristaStoreBase with _$MotoristaStore;

abstract class _MotoristaStoreBase with Store {
  @observable
  int motorista;

  @action
  void setMotorista(int v) {
    motorista = v;
    print("MOTORISTA $motorista");
  }
}
