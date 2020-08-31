import 'package:flutter/material.dart';

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  ///
  /// 使用AnimatedBuilder三个好处:
  /// 1：不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。
  /// 2：动画构建的范围缩小了，如果没有builder，setState()将会在父组件上下文中调用，
  /// 这将会导致父组件的build方法重新调用；而有了builder之后，只会导致动画widget自身的build
  /// 重新调用，避免不必要的rebuild。
  /// 3：通过AnimatedBuilder可以封装常见的过渡效果来复用动画。
  ///
  /// Flutter中正是通过这种方式封装了很多动画，
  /// 如：FadeTransition、ScaleTransition、SizeTransition等，
  /// 很多时候都可以复用这些预置的过渡类。
  ///
  @override
  Widget build(BuildContext context) {
//    return AnimatedImage(animation: animation,);

    /*return AnimatedBuilder(
      animation: animation,
      child: Image.asset("assets/images/icon2.png"),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );*/

    return GrowTransition(
      child: Image.asset("assets/images/icon2.png"),
      animation: animation,
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset("assets/images/icon2.png",
          width: animation.value, height: animation.value),
    );
  }
}
