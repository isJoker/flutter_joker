import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
///通过Switch和Checkbox我们可以看到，虽然它们本身是与状态（是否选中）关联的，
///但它们却不是自己来维护状态，而是需要父组件来管理状态，然后当用户点击时，
///再通过事件通知给父组件，这样是合理的，因为Switch和Checkbox是否选中本就和用户数据关联，
///而这些用户数据也不可能是它们的私有状态。
///
class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {

  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected, //当前状态
          activeColor: Colors.green,//选中颜色
          activeThumbImage: AssetImage("assets/images/ic_home_press.png"),// 选中显示图标
          inactiveThumbImage: AssetImage("assets/images/ic_home_normal.png"),// 未选中显示图标
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}
