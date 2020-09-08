import 'package:biodriver/app/modules/home/map/map_widget.dart';
import 'package:biodriver/app/modules/home/sequencia/card_sequencia/card_sequencia_widget.dart';
import 'package:biodriver/app/modules/model/sequencia_model.dart';
import 'package:biodriver/app/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sequencia_controller.dart';

class SequenciaPage extends StatefulWidget {
  final String title;
  final List<Sequencia> sequencia;
  const SequenciaPage({Key key, this.title = "Sequencia", this.sequencia})
      : super(key: key);

  @override
  _SequenciaPageState createState() => _SequenciaPageState();
}

class _SequenciaPageState
    extends ModularState<SequenciaPage, SequenciaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: colorA,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.sequencia.length,
          itemBuilder: (context, index) {
            var seq = widget.sequencia[index];
            return CardSequenciaWidget(
              id: seq.numero,
              estado: seq.estado,
              idClient: seq.nomeCliente,
              municipio: seq.municipio,
              rua: seq.rua,
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                      child: Container(
                        height: sh * 0.6,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: sh * 0.5,
                                color: Colors.white,
                                child: Center(
                                  child: MapWidget(
                                      lat: double.tryParse(seq.lat),
                                      lng: double.tryParse(seq.long),
                                      name: seq.nomeCliente),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      color: colorA,
                                    ),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.navigation,
                                      color: colorA,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
