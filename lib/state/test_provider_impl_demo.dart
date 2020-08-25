import 'dart:collection';

import 'package:flutter/material.dart';

import 'provider_impl_demo.dart';

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Column(
            children: <Widget>[
              Consumer<CartModel>(
                builder: (context, cart) {
                  print("总价 Text build");
                  return Text("总价: ${cart.totalPrice}");
                },
              ),
              Builder(builder: (context) {
                print("商品描述 Text build");
                return Text("商品描述");
              }),
              Builder(builder: (context) {
                print("RaisedButton build");
                return RaisedButton(
                  child: Text("添加商品"),
                  onPressed: () {
                    // listen 设为false，不建立依赖关系
                    ChangeNotifierProvider.of<CartModel>(context, listen: false)
                        .add(Item(20.0, 1));
                  },
                );
              }),
            ],
          );
        }),
      ),
    );
  }
}

///
/// 商品信息
///
class Item {
  Item(this.price, this.count);

  double price; //商品单价
  int count; // 商品份数
}

///
/// 保存购物车内商品数据
/// 跨组件共享的model类
///
class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}
