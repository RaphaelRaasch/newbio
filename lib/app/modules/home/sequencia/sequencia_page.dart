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
            return CardSequenciaWidget();
          },
        ),
      ),
    );
  }
}
