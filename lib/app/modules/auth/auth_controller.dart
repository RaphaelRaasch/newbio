import 'dart:convert';

import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

const AUTH_URL = 'https://multidev.com.br/biotrack/auth-token/';

abstract class _AuthControllerBase with Store {
  final UserStore userStore;

  _AuthControllerBase(this.userStore);
  @observable
  bool ispassword = false;
  @observable
  String email = '';
  @observable
  String password = '';

  @observable
  bool loading = false;
  @action
  void viewPassword() => ispassword = !ispassword;

  @action
  Future login() async {
    loading = true;
    var response = await http.post(
      AUTH_URL,
      body: ({'username': email, 'password': password}),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var user = UserModel.fromJson(data);
      userStore.setUser(user);
      print(userStore.user.email);

      Modular.to.pushReplacementNamed('/home');
      loading = false;
    } else {
      loading = false;
      return;
    }
  }
}
