import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///
/// 当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，
/// 会有200毫秒左右的延时，这是因为当用户点击完之后很可能会再次点击以触发双击事件，
/// 所以GestureDetector会等一段时间来确定是否为双击事件。
/// 如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时
///
class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: () => updateText("DoubleTap"), //双击
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

/// ------------------------------------分割线---------------------------------------

class DragRoute extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<DragRoute> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //手指按下时会触发此回调
              /*onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },*/

              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }),
        )
      ],
    );
  }
}

/// ------------------------------------分割线---------------------------------------

class MyScaleTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyScaleTestRouteState();
  }
}

class _MyScaleTestRouteState extends State<MyScaleTestRoute> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("assets/images/icon2.png", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

/// ------------------------------------分割线---------------------------------------
/// 注意：使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）
///
class GestureRecognizerDemoRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureRecognizerDemoRouteState();
  }
}

class _GestureRecognizerDemoRouteState
    extends State<GestureRecognizerDemoRoute> {
  TapGestureRecognizer _tapGestureRecognizer;
  bool _toggle = false; //变色开关

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          _toggle = !_toggle;
        });
      };
  }

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "你好世界"),
        TextSpan(
          text: "点我变色",
          style: TextStyle(
              fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
          recognizer: _tapGestureRecognizer,
        ),
        TextSpan(text: "你好世界"),
      ])),
    );
  }
}
