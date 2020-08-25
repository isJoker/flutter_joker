import 'package:flutter/material.dart';

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        //使用ShareDataWidget
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(), //子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();

    // 如果我们只想在__TestWidgetState中引用ShareDataWidget数据，
    // 但却不希望在ShareDataWidget发生变化时调用__TestWidgetState的didChangeDependencies()
    // 用dependOnInheritedWidgetOfExactType() 和
    // getElementForInheritedWidgetOfExactType()的区别就是前者会注册依赖关系，而后者不会
    return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

///
/// 如果_TestWidget的build方法中没有使用ShareDataWidget的数据，
/// 那么它的didChangeDependencies()将不会被调用，
/// 因为它并没有依赖ShareDataWidget。只有依赖ShareDataWidget的子组件
/// didChangeDependencies()才会被调用
///
/// ，我们将build()方法中依赖ShareDataWidget的代码注释掉了，
/// 然后返回一个固定Text，这样一来，当点击Increment按钮后，
/// ShareDataWidget的data虽然发生变化，
/// 但由于__TestWidgetState并未依赖ShareDataWidget，
/// 所以__TestWidgetState的didChangeDependencies方法不会被调用。
///
class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    print("_TestWidget build");
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());

    // 即使没有使用到InheritedWidget中的共享数据，子组件的build方法仍会被调用
    // 造成这个的原因其实是，点击"Increment"按钮后，会调用_InheritedWidgetTestRouteState
    // 的setState()方法，此时会重新构建整个页面，由于示例中，__TestWidget 并没有任何缓存，
    // 所以它也都会被重新构建，所以也会调用build()方法。
//    return Text('Hello');
  }

  ///
  /// 子widget很少会重写此方法，因为在依赖改变后framework也都会调用build()方法。
  /// 但是，如果你需要在依赖改变后执行一些昂贵的操作，比如网络请求，
  /// 这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作。
  ///
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("_TestWidget Dependencies change");
  }
}
