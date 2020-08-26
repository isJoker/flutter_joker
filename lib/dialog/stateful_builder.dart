import 'package:flutter/material.dart';

///
/// 这种方法本质上就是子组件通知父组件（StatefulWidget）重新build子组件本身来实现UI更新的
///
class StatefulBuilder extends StatefulWidget {
  const StatefulBuilder({
    Key key,
    @required this.builder,
  })  : assert(builder != null),
        super(key: key);

  final StatefulWidgetBuilder builder;

  @override
  _StatefulBuilderState createState() => _StatefulBuilderState();
}

class _StatefulBuilderState extends State<StatefulBuilder> {
  @override
  Widget build(BuildContext context) => widget.builder(context, setState);
}
