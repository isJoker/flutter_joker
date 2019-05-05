import 'package:flutter/material.dart';

/// container示例界面
class ContainerDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ContainerDemoPageState();
}

class _ContainerDemoPageState extends State<ContainerDemoPage> {
  @override
  Widget build(BuildContext context) {
    Expanded imageExpanded(String img) {
      return Expanded(
          child: new Container(
        decoration: new BoxDecoration(
            border: new Border.all(width: 10.0, color: Colors.deepOrange),
            borderRadius: const BorderRadius.all(const Radius.circular(8.0))),
        margin: const EdgeInsets.all(4.0),
        child: new Image.asset(img),
      ));
    }

    var container = new Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              imageExpanded('asset/images/icon1.png'),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    border: Border.all(width: 1.0, color: Colors.deepOrange),
                    borderRadius:
                        BorderRadius.all(const Radius.circular(15.0))),
                child: Text(
                  '文本文本文本',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
              imageExpanded('asset/images/icon1.png'),
            ],
          ),
          new Row(
            children: <Widget>[
              imageExpanded('asset/images/icon1.png'),
              imageExpanded('asset/images/icon1.png'),
              imageExpanded('asset/images/icon1.png'),
            ],
          ),
          new Row(
            children: <Widget>[
              imageExpanded('asset/images/icon1.png'),
            ],
          )
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Container Page demo'),
      ),
      body: new Center(
        child: container,
      ),
    );
  }
}
