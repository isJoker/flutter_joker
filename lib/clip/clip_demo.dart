import 'package:flutter/material.dart';

class ClipRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget avatar = Image.asset("assets/images/icon2.png", width: 100.0);

    return Center(
      child: Column(
        children: [
          avatar, //不剪裁
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          ClipRect(
            //将溢出部分剪裁
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: .5, //宽度设为原来宽度一半
              child: avatar,
            ),
          ),
        ],
      ),
    );
  }
}
