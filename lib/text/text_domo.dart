import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text(
      "hello flutter",
      textAlign: TextAlign.center,
      // 对齐方式
      maxLines: 2,
      // 最大行数
      overflow: TextOverflow.ellipsis,
      // 文本超出末尾...
      textScaleFactor: 1.5,
      // 字体缩放1.5倍
      style: TextStyle(
          // 指定文本显示的样式
          color: Colors.blue,
          fontSize: 18.0,
          // 精确指定字体大小
          height: 1.2,
          // 该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height
          fontFamily: "Courier",
          // 字体
          background: new Paint()..color = Colors.yellow,
          // 背景
          decoration: TextDecoration.underline,
          // 文本装饰，此处是下划线
          decorationStyle: TextDecorationStyle.dashed // 下划线样式，此处为虚线
          ),
    );

    DefaultTextStyle(
      // 设置文本默认样式
      style: TextStyle(
        color: Colors.blue,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("hello world"),
          Text("hello"),
          Text(
            "world",
            style: TextStyle(
                // 不继承默认样式
                inherit: false,
                color: Colors.red),
          ),
        ],
      ),
    );

    const textStyle = const TextStyle(fontFamily: 'DIN', fontSize: 20);
    Text(
      "hello world",
      style: textStyle,
    );

    return Text("hello world");
  }
}
