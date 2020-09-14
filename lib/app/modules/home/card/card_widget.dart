import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final title;
  final caminhao;
  final onTap;

  const CardWidget({
    @required this.title,
    @required this.caminhao,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sw * 0.01, vertical: sh * 0.01),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: sw * 0.02,
            vertical: sh * 0.01,
          ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: sh * 0.02),
              ),
              SizedBox(
                height: sh * 0.03,
              ),
              Text(
                'Caminhao: $caminhao',
                style: TextStyle(fontSize: sh * 0.02),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
