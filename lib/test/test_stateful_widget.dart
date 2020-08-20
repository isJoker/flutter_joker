import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joker/test/sub_test_stateful_widget.dart';

class TestStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('create state');
    return TestState();
  }
}

class TestState extends State<TestStatefulWidget> {
  /// 定义 state [count] 计算器
  int count = 1;

  /// 定义 state [name] 为当前描述字符串
  String name = 'test';

  @override
  void initState() {
    print('init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(TestStatefulWidget oldWidget) {
    count++;
    print('did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    print('reassemble');
    super.reassemble();
  }

  void changeName() {
    setState(() {
      print('set state');
      this.name = 'Flutter';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Column(
      children: <Widget>[
        FlatButton(
            child: Text('$name $count'), onPressed: () => this.changeName()),
//        SubStatefulWidget()
      ],
    );
  }
}
