import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'user_store.g.dart';

@Injectable()
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  UserModel user;

  @action
  void setUser(UserModel v) {
    user = v;
  }
}
