import 'package:flutter/material.dart';
import 'package:flutter_joker/anim/animationPage.dart';
import 'package:flutter_joker/container_page.dart';
import 'package:flutter_joker/msg/edit_text_page.dart';
import 'package:flutter_joker/grid_demo_page.dart';
import 'package:flutter_joker/listview_demo2_page.dart';
import 'package:flutter_joker/listview_card_page.dart';
import 'package:flutter_joker/listview_demo_page.dart';
import 'package:flutter_joker/listview_loadmore.dart';
import 'package:flutter_joker/msg/message_list_page.dart';
import 'package:flutter_joker/net/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /**
     * -------------------------- Offstage ----------------------------
     */
    return new Offstage(
      offstage: false, // true : 不绘制
      child: new Text('test offstage'),
    );

    /**
     * -------------------------- Stack ----------------------------
     */
    /*return new Container(
        color: Colors.yellow,
        height: 150.0,
        width: 500.0,
        child: new Stack(children: <Widget>[
          new Container(
            color: Colors.blueAccent,
            height: 50.0,
            width: 100.0,
            alignment: Alignment.center,
            child: Text('1'),
          ),
          new Positioned(
              left: 40.0,
              top: 80.0,
              child: new Container(
                color: Colors.pink,
                height: 50.0,
                width: 95.0,
                alignment: Alignment.center,
                child: Text('2'),
              )),
        ]));*/

    /**
     * -------------------------- Flex ----------------------------
     */

    /*return new Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: new Container(
            color: Colors.blue,
            height: 60.0,
            alignment: Alignment.center,
            child: const Text('left!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                textDirection: TextDirection.ltr),
          ),
        ),
        new Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: new Container(
            color: Colors.red,
            height: 60.0,
            alignment: Alignment.center,
            child: const Text('right',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
                textDirection: TextDirection.ltr),
          ),
        ),
      ],
    );*/

    /**
     * -------------------------- Flex ----------------------------
     */
    /*return new Flex(direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
            width: 40.0,
            height: 60.0,
            color: Colors.pink,
            child: const Center(
              child: const Text("l"),
            )),
        new Container(
            width: 80.0,
            height: 60.0,
            color: Colors.grey,
            child: const Center(
              child: const Text("m"),
            )),
        new Container(
            width: 60.0,
            height: 60.0,
            color: Colors.yellow,
            child: const Center(
              child: const Text("r"),
            )),
      ],
    );*/

    /**
     * -------------------------- Text ----------------------------
     */
    /*return new Text(
      "hello flutter",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30,
        color: Colors.amber
      ),
    );*/

    /**
     * -------------------------- Container ----------------------------
     */
    /*return new Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(30.0),
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.red,
        ),
        image: const DecorationImage(
          image: const NetworkImage(
            'https://gw.alicdn.com/tfs/TB1CgtkJeuSBuNjy1XcXXcYjFXa-906-520.png',
          ),
          fit: BoxFit.fill,
        ),
        //borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
        borderRadius: const BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(6.0),
          bottomLeft: const Radius.circular(10.0),
          bottomRight: const Radius.circular(0.0),
        ),
      ),
      child: Text('哈哈哈哈哈哈'),
    );*/
  }
}
