import 'package:flutter/material.dart';

class ListViewCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ListViewCardState();
}

class _ListViewCardState extends State<ListViewCard> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 30; i++) {
      list.add(new Card(
        child: getChild(i),
        elevation: 5.0, //设置阴影
        clipBehavior: Clip.antiAlias, //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))), //设置圆角
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ListView Demo'),
      ),
      body: new Center(
        child: new ListView(
          children: list,
        ),
      ),
    );
  }

  Column getChild(int i) {
    return new Column(
      children: <Widget>[
        new Image.asset(
          'asset/images/icon4.png',
        ),
        new ListTile(
          title: new Text(
            'title$i',
            style: _itemTextStyle,
          ),
          subtitle: new Text('A'),
          leading: i % 3 == 0
              ? new Icon(
                  Icons.theaters,
                  color: Colors.blue,
                )
              : new Icon(
                  Icons.restaurant,
                  color: Colors.blue,
                ),
        ),
      ],
    );
  }
}

TextStyle _itemTextStyle =
    new TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0);
