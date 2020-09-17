import 'dart:convert';

import 'package:biodriver/app/modules/model/mtr_item_model.dart';
import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableFuture<List<MtrItemModel>> observableFuture;
  @observable
  ObservableList<Sequencia> clientList = <Sequencia>[].asObservable();
  @observable
  ObservableList<MtrItemModel> listMtr = <MtrItemModel>[].asObservable();

  @action
  Future getMtr() async {
    var response = await http.get('http://192.168.2.21:8080/api/mtritems/');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      listMtr.clear();
      data.forEach(
        (element) async {
          listMtr.add(MtrItemModel.fromJson(element));
        },
      );
      return listMtr;
    }
  }

  exit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Modular.to.pushReplacementNamed('/auth');
  }
}
