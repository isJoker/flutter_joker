import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 加载本地图片
    Image.asset(
      "assets/images/icon1.png",
      width: 200.0,
    );

    // 加载网络图片
    Image.network(
        "https://upload-images.jianshu.io/upload_images/9513946-8c0fab7b09adeb1c.png?imageMogr2/auto-orient/strip|imageView2/2/format/webp");

    Image(
      image: AssetImage("assets/images/icon1.png"),
      width: 200.0,
      color: Colors.amberAccent,
      colorBlendMode: BlendMode.difference,
    );

    Column(
      children: [
        Image(
          image: AssetImage("assets/images/icon1.png"),
          width: 200.0,
        ),
        Image(
          image: AssetImage("assets/images/icon1.png"),
          width: 200.0,
          color: Colors.amberAccent,
          colorBlendMode: BlendMode.difference,
        ),
      ],
    );

    return Image(
      image: AssetImage("assets/images/icon1.png"),
      width: 200.0,
      height:500.0,
      repeat: ImageRepeat.repeatY ,
    );
  }
}
