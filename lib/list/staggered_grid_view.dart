import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

///
/// 瀑布流
///
class StaggeredGridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => Container(
          color: Colors.green,
          child: new Center(
            child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text('$index'),
            ),
          )),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 3 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

///-------------------------------------分割线-------------------------------------

const List<Color> _kColors = const <Color>[
  Colors.green,
  Colors.blue,
  Colors.red,
  Colors.pink,
  Colors.indigo,
  Colors.purple,
  Colors.blueGrey,
];

List<StaggeredTile> _generateRandomTiles(int count) {
  Random rnd = Random();
  return List.generate(count,
      (i) => StaggeredTile.count(rnd.nextInt(4) + 1, rnd.nextInt(6) + 1));
}

List<Color> _generateRandomColors(int count) {
  Random rnd = Random();
  return List.generate(count, (i) => _kColors[rnd.nextInt(_kColors.length)]);
}

class StaggeredGridViewRoute2 extends StatelessWidget {
  StaggeredGridViewRoute2()
      : _tiles = _generateRandomTiles(_kItemCount).toList(),
        _colors = _generateRandomColors(_kItemCount).toList();

  static const int _kItemCount = 1000;
  final List<StaggeredTile> _tiles;
  final List<Color> _colors;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: 4,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 4.0,
      staggeredTileBuilder: _getTile,
      itemBuilder: _getChild,
      itemCount: _kItemCount,
    );
  }

  StaggeredTile _getTile(int index) => _tiles[index];

  Widget _getChild(BuildContext context, int index) {
    return new Container(
      key: new ObjectKey('$index'),
      color: _colors[index],
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
    );
  }
}

///-------------------------------------分割线-------------------------------------

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
      (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class StaggeredGridViewRoute3 extends StatelessWidget {
  StaggeredGridViewRoute3() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 1000;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      crossAxisCount: 4,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      itemBuilder: (context, index) => _Tile(index, _sizes[index]),
      staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    );
  }
}

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
//              new Center(child: new CircularProgressIndicator()),
              new Center(
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/${size.width}/${size.height}/',
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Image number $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  'Width: ${size.width}',
                  style: const TextStyle(color: Colors.grey),
                ),
                new Text(
                  'Height: ${size.height}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
