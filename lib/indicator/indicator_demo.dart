import 'package:flutter/material.dart';

class IndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 模糊进度条(会执行一个动画)
    Padding(
      padding: EdgeInsets.only(left: 50.0, right: 50.0),
      child: LinearProgressIndicator(
        backgroundColor: Colors.amber,
        valueColor: AlwaysStoppedAnimation(Colors.green),
      ),
    );

    // 进度条显示30%位置
    Padding(
      padding: EdgeInsets.only(left: 50.0, right: 50.0),
      child: LinearProgressIndicator(
        minHeight: 10.0,
        value: 0.3,
        backgroundColor: Colors.amber,
        valueColor: AlwaysStoppedAnimation(Colors.green),
      ),
    );

    // 模糊进度条(会执行一个旋转动画)
    CircularProgressIndicator(
      backgroundColor: Colors.amber,
      valueColor: AlwaysStoppedAnimation(Colors.green),
    );

    //进度条显示3%，会显示一个半圆
    CircularProgressIndicator(
      backgroundColor: Colors.amber,
      valueColor: AlwaysStoppedAnimation(Colors.green),
      value: .3,
    );

    Row();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
          child: LinearProgressIndicator(
            backgroundColor: Colors.amber,
            valueColor: AlwaysStoppedAnimation(Colors.green),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
          child: LinearProgressIndicator(
            value: 0.3,
            backgroundColor: Colors.amber,
            valueColor: AlwaysStoppedAnimation(Colors.green),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.amber,
            valueColor: AlwaysStoppedAnimation(Colors.green),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.amber,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            value: 0.3,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
          child: SizedBox(
            height: 6.0,
            child: LinearProgressIndicator(
              backgroundColor: Colors.amber,
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 50.0),
          child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: CircularProgressIndicator(
              backgroundColor: Colors.amber,
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
          ),
        ),
      ],
    );
  }
}
