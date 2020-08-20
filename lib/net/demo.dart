import 'package:flutter/material.dart';

class RouteDemo1 extends StatefulWidget {
  final String text;

  RouteDemo1({Key key, this.text}) : super(key: key);

  @override
  _RouteDemo1State createState() => new _RouteDemo1State(text: this.text);
}

class _RouteDemo1State extends State<RouteDemo1> {
  _RouteDemo1State({Key key, @required this.text}) : super();
  final String text;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("demo"),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(args),
              ),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "Demo1页面返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
