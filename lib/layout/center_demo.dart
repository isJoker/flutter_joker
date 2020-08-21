import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.red,
          child: Center(
            child: Text('Hello'),
          ),
        ),
        Container(
          height: 100,
          color: Colors.amber,
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Text('Hello'),
          ),
        ),
      ],
    );
  }
}
