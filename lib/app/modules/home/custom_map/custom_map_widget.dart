import 'package:flutter/material.dart';

class CustomMapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    return AlertDialog(
      title: Text('Teste'),
      content: Container(
        height: sh * 0.2,
        color: Colors.blue,
      ),
    );
  }
}
