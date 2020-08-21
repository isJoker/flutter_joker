import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.amberAccent,
      child: Align(
        // Align 组件的宽高的缩放因子，会分别乘以子元素的宽高
//        widthFactor: 2,
//        heightFactor: 2,
//        alignment: Alignment.topRight,
//        alignment:Alignment(2,-1),

      alignment: FractionalOffset(0.5,0.5),
        child: FlutterLogo(
          size: 50,
        ),
      ),
    );
  }

}