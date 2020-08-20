import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joker/test/test_stateful_widget.dart';

class SubStatefulWidget extends TestStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('sub create state');
    return SubState();
  }
}

class SubState extends State<SubStatefulWidget> {

  @override
  void initState() {
    print('sub init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('sub did change dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(TestStatefulWidget oldWidget) {
    print('sub did update widget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('sub deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('sub dispose');
    super.dispose();
  }

  @override
  void reassemble() {
    print('sub reassemble');
    super.reassemble();
  }

  void changeName() {
    setState(() {
      print('sub set state');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('sub build');
    return Text('SubStatefulWidget');
  }
}
