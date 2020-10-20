import 'dart:convert';

import 'package:biodriver/app/modules/model/motorista_model.dart';
import 'package:biodriver/app/modules/model/user_model.dart';
import 'package:biodriver/app/modules/store/motorista_store.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

const AUTH_URL = 'http://multidev.com.br/biotrack/auth-token/';

abstract class _AuthControllerBase with Store {
  final UserStore userStore;
  final MotoristaStore motoristaStore;

  _AuthControllerBase(this.userStore, this.motoristaStore);
  @observable
  bool ispassword = false;
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool error = false;

  @observable
  bool loading = false;

  @action
  void viewPassword() => ispassword = !ispassword;

  @action
  Future login(context, snackbar) async {
    try {
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
        setToken(userStore.user.token, email, password);
        
        print(userStore.user.email);

        Modular.to.pushReplacementNamed('/home');
        loading = false;
      } else {
        error = true;
        loading = false;
        return;
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(snackbar);
      print(e);
      loading = false;
    }
  }

  setToken(token, email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    print(email);
    print(password);

    await prefs.setString('token', token);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }
}
