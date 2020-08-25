import 'package:flutter/material.dart';
import 'package:flutter_joker/util/Toast.dart';

class WillPopScopeTestRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return WillPopScopeTestRouteState();
  }

}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          Toast.toast(context, "再次返回键退出");
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("2秒内连续按两次返回键退出"),
      ),
    );
  }

}