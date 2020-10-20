import 'package:flutter/material.dart';

class CardSequenciaWidget extends StatelessWidget {
  final id;
  final nome;
  final idClient;
  final rua;
  final municipio;
  final estado;
  final onLongPress;

  const CardSequenciaWidget({
    Key key,
    this.id,
    this.nome,
    this.idClient,
    this.rua,
    this.municipio,
    this.estado,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sh * 0.01, horizontal: sw * 0.02),
      child: GestureDetector(
        onLongPress: onLongPress,
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: sw * 0.06, vertical: sh * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(sw * 0.03),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                color: Colors.black26,
                offset: Offset(2, 2),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$nome #$id'),
                ],
              ),
              SizedBox(
                height: sh * 0.02,
              ),
              Container(
                width: sw * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$rua, $municipio, $estado'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
