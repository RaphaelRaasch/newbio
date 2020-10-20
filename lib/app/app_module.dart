import 'modules/store/motorista_store.dart';
import 'modules/store/user_store.dart';
import 'package:biodriver/app/modules/auth/auth_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:biodriver/app/app_widget.dart';
import 'package:biodriver/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MotoristaStore()),
        Bind((i) => UserStore()),
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: AuthModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
