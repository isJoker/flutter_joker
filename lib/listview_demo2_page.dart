import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordsPage extends StatefulWidget {
  @override
  createState() => new RandomWordsPageState();
}

class RandomWordsPageState extends State<RandomWordsPage> {
  final _suggestions = <WordPair>[];

  // 保存收藏的单词对
  final _saved = new Set<WordPair>();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map(
        (pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('Saved Suggestions'),
        ),
        body: new ListView(children: divided),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        // itemBuilder 在每次生成一个单词对时被回调
        // 每一行都是用 ListTile 代表
        // 对于偶数行，这个回调函数都添加一个 ListTile 组件来保存单词对
        // 对于奇数行，这个回调函数会添加一个 Divider 组件来在视觉上分割单词对。
        // 注意，在小设备上看到分割物可能会非常困难
        itemBuilder: (context, i) {
          //  在 ListView 组件的每行之前，先添加一个像素高度的分割。
          if (i.isOdd) return new Divider();

          // 这个"i ~/ 2"的表达式将i 除以 2，然后会返回一个整数结果。
          // 例： 1, 2, 3, 4, 5 会变成 0, 1, 1, 2, 2。
          // 这个表达式会计算 ListView 中单词对的真实数量
          final index = i ~/ 2;

          // 如果到达了单词对列表的结尾处...
          if (index >= _suggestions.length) {
            // ...然后生成10个单词对到建议的名称列表中。
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
