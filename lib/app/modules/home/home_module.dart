import 'map_launcher/map_launcher_controller.dart';
import 'map/map_controller.dart';
import 'custom_map/custom_map_controller.dart';
import 'sequencia/card_sequencia/card_sequencia_controller.dart';
import 'package:biodriver/app/modules/home/sequencia/sequencia_page.dart';

import 'sequencia/sequencia_controller.dart';

import 'card/card_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => MapLauncherController()),
        Bind((i) => MapController()),
        Bind((i) => CustomMapController()),
        Bind((i) => CardSequenciaController()),
        Bind((i) => SequenciaController()),
        Bind((i) => CardController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter(
          '/sequencia',
          child: (_, args) => SequenciaPage(sequencia: args.data),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
