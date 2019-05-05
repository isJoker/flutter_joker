import 'package:flutter/material.dart';
import 'package:flutter_joker/anim/finish_anim.dart';
import 'finish_anim.dart';

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimationPageState createState() => new _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
          child: RawMaterialButton(
              child: Text('tap'),
              onPressed: () {
                FinishAnimation.show(context);
              })),
    );
  }
}
