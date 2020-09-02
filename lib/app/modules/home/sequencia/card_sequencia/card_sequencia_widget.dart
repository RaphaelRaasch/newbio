import 'package:flutter/material.dart';

class CardSequenciaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sh * 0.01, horizontal: sw * 0.02),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: sw * 0.06, vertical: sh * 0.02),
        height: sh * 0.2,
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1'),
                Text('11106'),
              ],
            ),
            SizedBox(
              height: sh * 0.03,
            ),
            Container(
              width: sw * 0.6,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rua: '),
                      Text('Numero: '),
                    ],
                  ),
                  Text('')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
