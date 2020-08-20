import 'package:flutter/material.dart';

class SimpleAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimpleAppBarState();
}

class _SimpleAppBarState extends State<SimpleAppBar> with SingleTickerProviderStateMixin{
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return null;
  }

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }
}
