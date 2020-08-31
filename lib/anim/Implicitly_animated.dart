import 'package:flutter/material.dart';

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}

class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decoration; //定义一个Tween

  ///
  /// 在动画执行过程中，每一帧都会调用build方法，
  /// 调用逻辑在ImplicitlyAnimatedWidgetState中
  ///
  /// 所以在build方法中我们需要构建每一帧的DecoratedBox状态，
  /// 因此得算出每一帧的decoration 状态，这个我们可以通过_decoration.evaluate(animation) 来算出，
  /// 其中animation是ImplicitlyAnimatedWidgetState基类中定义的对象
  ///
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  ///
  /// 用于来更新Tween的初始值的，在下述两种情况下会被调用，一些更新的逻辑被屏蔽在了visitor回调
  ///
  ///  Tween visitor(
  ///     Tween<dynamic> tween, //当前的tween，第一次调用为null
  ///     dynamic targetValue, // 终止状态
  ///     TweenConstructor<dynamic> constructor，//Tween构造器，在上述三种情况下会被调用以更新tween
  ///   );
  ///
  /// 1.AnimatedDecoratedBox首次build，此时直接将其decoration值置为起始状态，
  /// 即_decoration值为DecorationTween(begin: decoration) 。
  /// 2.AnimatedDecoratedBox的decoration更新时，则起始状态为_decoration.animate(animation)，
  /// 即_decoration值为DecorationTween(begin: _decoration.animate(animation)，end:decoration)。
  ///
  @override
  void forEachTween(visitor) {
    // 在需要更新Tween时，基类会调用此方法
    _decoration = visitor(_decoration, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}
