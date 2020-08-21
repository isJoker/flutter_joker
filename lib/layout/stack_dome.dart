import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      // 指定未定位或部分定位widget的对齐方式
      constraints: BoxConstraints.expand(),
      child: Stack(
//        fit: StackFit.expand,//未定位widget占满Stack整个空间
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 100.0,
            child: Text('Hello'),
          ),
          Container(
            child: Text('Hello World'),
            color: Colors.green,
          ),
          Positioned(
            left: 50.0,
            top: 50.0,
            child: Text('World'),
          ),
        ],
      ),
    );
  }
}
