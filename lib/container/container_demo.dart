import 'package:flutter/material.dart';

class DecoratedBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black38, offset: Offset(3, 3), blurRadius: 3)
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 13),
        child: Text(
          '分享',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
      ),
    );
  }
}

class TransformPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.5),
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.orange,
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
