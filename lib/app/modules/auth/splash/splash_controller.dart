import 'dart:convert';

import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

const AUTH_URL = 'https://multidev.com.br/biotrack/auth-token/';

abstract class _SplashControllerBase with Store {
  final UserStore userStore;

  _SplashControllerBase(this.userStore);
  @observable
  bool loading = false;
  @action
  Future login(email, password) async {
    try {
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
    } catch (e) {}
  }
}
