import 'package:flutter/material.dart';

///
///在Flutter中，Sliver通常指可滚动组件子元素（就像一个个薄片一样）。
///但是在CustomScrollView中，需要粘起来的可滚动组件就是CustomScrollView的Sliver了，
///如果直接将ListView、GridView作为CustomScrollView是不行的，
///因为它们本身是可滚动组件而并不是Sliver！因此，为了能让可滚动组件能和CustomScrollView配合使用，
///Flutter提供了一些可滚动组件的Sliver版，如SliverList、SliverGrid等。
///实际上Sliver版的可滚动组件和非Sliver版的可滚动组件最大的区别就是前者不包含滚动模型（自身不能再滚动），
///而后者包含滚动模型 ，也正因如此，CustomScrollView才可以将多个Sliver"粘"在一起，
///这些Sliver共用CustomScrollView的Scrollable，所以最终才实现了统一的滑动效果。
/// 
class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //SliverAppBar对应AppBar，两者不同之处在于SliverAppBar可以集成到CustomScrollView。
          //SliverAppBar可以结合FlexibleSpaceBar实现Material Design中头部伸缩的模型
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                'assets/images/icon2.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.red[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //所有子元素高度都为50像素的List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.orange[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50),
          ),
        ],
      ),
    );
  }
}
