import 'package:flutter/material.dart';
import 'package:flutter_joker/net/demo.dart';

class MyPage extends StatelessWidget {
  final parentContext;

  MyPage(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      //名为"/"的路由作为应用的home(首页)
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: new PageWidget(parentContext),
      // 注册路由表
      routes: <String, WidgetBuilder>{
        "demo1": (BuildContext context) => RouteDemo1(),
//        "demo1": (context) {
//          return RouteDemo1(text: ModalRoute.of(context).settings.arguments);
//        },
        // 等同于 home: new PageWidget(parentContext)
//        "/": (BuildContext context) => PageWidget(parentContext),
      },
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
        });
      },
    );
  }
}

class PageWidget extends StatefulWidget {
  final parentContext;

  PageWidget(this.parentContext);

  @override
  State<StatefulWidget> createState() {
    return new PageState();
  }
}

class PageState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          onPressed: _pushPage,
          child: new Text("跳转"),
        ),
      ),
    );
  }

  _pushPage() async {
    // 命名路由传值 需要注册路由表
    var result = await Navigator.of(widget.parentContext)
        .pushNamed("/demo1", arguments: "我是上个页面携带的参数22");

    // 非命名路由传值
//    var result =
//        await Navigator.of(widget.parentContext).push(new MaterialPageRoute(
//      builder: (context) {
//        return RouteDemo1(
//          text: "我是上个页面携带的参数",
//        );
//      },
//    ));

    print("路由返回值： $result");
  }
}
