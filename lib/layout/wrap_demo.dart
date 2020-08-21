

import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Wrap(
      spacing: 8.0,// 主轴(水平)方向间距
      runSpacing: 4.0,// 纵轴（垂直）方向间距
      alignment: WrapAlignment.start,//沿主轴方向居中
      children: [
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('A'),
          ),
          label: Text('AAAAAAAAAA'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('B'),
          ),
          label: Text('BBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('C'),
          ),
          label: Text('CCCCCCCCCCCCCCCCC'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('D'),
          ),
          label: Text('DDDDD'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('E'),
          ),
          label: Text('EEEEE'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.green,
            child: Text('F'),
          ),
          label: Text('FFFFF'),
        ),
      ],
    );
  }

}
