import 'package:biodriver/app/modules/home/card/card_widget.dart';
import 'package:biodriver/app/modules/store/user_store.dart';
import 'package:biodriver/app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  UserStore userStore = Modular.get();

  @override
  void initState() {
    controller.getMtr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = userStore.user;
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
        backgroundColor: colorA,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              controller.exit();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (controller.listMtr.isEmpty) {
            return Center(
              child: Text('Nenhuma Mtr Cadastrada'),
            );
          } else {
            return Container(
              height: sh,
              child: controller.listMtr.isEmpty
                  ? Center(
                      child: Text('SEM MTRS CONFIGURADAS'),
                    )
                  : ListView.builder(
                      itemCount: controller.listMtr.length,
                      itemBuilder: (context, index) {
                        var list = controller.listMtr[index];
                        return CardWidget(
                          title: list.mtr.alias,
                          caminhao: list.mtr.caminhao,
                          onTap: () {
                            Modular.link.pushNamed(
                              '/sequencia',
                              arguments: list.sequencia,
                            );
                          },
                        );
                      },
                    ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getMtr();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
