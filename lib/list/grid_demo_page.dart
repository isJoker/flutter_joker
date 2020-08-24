import 'package:flutter/material.dart';

/// gridView示例界面1
class GridDemo1Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _GridDemo1PageState();
}

class _GridDemo1PageState extends State<GridDemo1Page> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Grid Page 1 demo'),
        centerTitle: true,
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }

  List<Container> _buildGridTileList(int count) {
    return new List<Container>.generate(
        count,
        (int index) => new Container(
              color: Colors.yellow,
              child: new Image.asset(
                'asset/images/icon${index % 5 + 1}.png',
                fit: BoxFit.contain,
              ),
            ));
  }

  Widget buildGrid() {
    // 指定子项占据的最大宽度
    return new GridView.extent(
      maxCrossAxisExtent: 120.0,
      padding: const EdgeInsets.all(15.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      childAspectRatio: 0.5,
      children: _buildGridTileList(30),
    );

    // 指定列数
    var countGrid = GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(15.0),
      childAspectRatio: 1,
      //横纵比
      children: _buildGridTileList(30),
    );
    return countGrid;
  }
}
