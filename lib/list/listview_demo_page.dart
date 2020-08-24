import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = <Widget>[];
    for (int i = 0; i < 30; i++) {
      list.add(new ListTile(
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
        trailing: Icon(
          Icons.add_circle,
          color: Colors.red,
        ),
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('position-->$i')));
        },
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
}

TextStyle _itemTextStyle =
    new TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0);
