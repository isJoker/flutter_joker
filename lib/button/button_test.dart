import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 默认带有阴影和灰色背景
    RaisedButton(
      onPressed: () {},
      child: Text('RaisedButton'),
    );

    // RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数
    RaisedButton.icon(
      icon: Icon(Icons.send),
      label: Text("发送"),
      onPressed: () {},
    );

    // 默认背景透明并不带阴影
    FlatButton(
      onPressed: () {},
      child: Text('RaisedButton'),
    );

    // 默认有一个边框，不带阴影且背景透明
    OutlineButton(
      onPressed: () {},
      child: Text('RaisedButton'),
    );

    // 是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.thumb_up),
    );

    return RaisedButton(
      color: Colors.red,
      // 按钮背景颜色
      highlightColor: Colors.red[700],
      // 按钮按下时的背景颜色
      colorBrightness: Brightness.dark,
      // 按钮主题，默认是浅色主题
      splashColor: Colors.blueGrey,
      // //点击时，水波动画中水波的颜色
      child: Text("Submit"),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {},
    );
  }
}
