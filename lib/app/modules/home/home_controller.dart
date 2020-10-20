import 'dart:convert';

import 'package:biodriver/app/modules/model/motorista_model.dart';
import 'package:biodriver/app/modules/model/mtr_item_model.dart';
import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:biodriver/app/modules/store/motorista_store.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final MotoristaStore motoristaStore = Modular.get();
  final UserStore userStore = Modular.get();
  @observable
  ObservableFuture<List<MtrItemModel>> observableFuture;
  @observable
  ObservableList<Sequencia> clientList = <Sequencia>[].asObservable();
  @observable
  ObservableList<MtrItemModel> listMtr = <MtrItemModel>[].asObservable();
  @observable
  ObservableList<MotoristaModel> listUser = <MotoristaModel>[].asObservable();

  @action
  Future getMtr() async {
    var respmot = await http.get(
        'http://multidev.com.br/biotrack/api/motoristas/?user=${userStore.user.userId.toString()}');
    var mdata = json.decode(respmot.body) as List;
    listUser.clear();
    mdata.forEach(
      (element) async {
        listUser.add(MotoristaModel.fromJson(element(0)));
      },
    );
    var idmotorista = listUser.first.idMultidev;
    print('IDMOTORISTA $idmotorista');
    var response = await http.get(
        'http://multidev.com.br/biotrack/api/mtritems/?motorista=$idmotorista');
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
