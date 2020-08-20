
import 'package:flutter/material.dart';

import 'my_icons.dart';

class IconPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    Text(icons,
      style: TextStyle(
          fontFamily: "MaterialIcons",
          fontSize: 40.0,
          color: Colors.green
      ),
    );

    // Icons类中包含了所有Material Design图标的IconData静态变量定义。
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.accessible,color: Colors.green,),
        Icon(Icons.error,color: Colors.green,),
        Icon(Icons.fingerprint,color: Colors.green,),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(MyIcons.pencil,color: Colors.amberAccent,size: 80.0,),
        Icon(MyIcons.triangle_ruler,color: Colors.green,size: 80.0),
      ],
    );
  }

}