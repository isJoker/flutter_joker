import 'package:flutter/material.dart';
import 'package:flutter_joker/Toast.dart';

class MessageFormPage extends StatefulWidget {
  @override
  State createState() {
    return _MessageFormPageState();
  }
}

class _MessageFormPageState extends State<MessageFormPage> {
  final editController = TextEditingController();

  // 对象被从 widget 树里永久移除的时候调用 dispose 方法（可以理解为对象要销毁了）
  // 这里我们需要主动再调用 editController.dispose() 以释放资源
  @override
  void dispose() {
    super.dispose();
    editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: buildMessage(),
    );
  }

  Padding buildMessage() {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          // 我们让输入框占满一行里除按钮外的所有空间
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(fontSize: 22.0, color: Colors.black54),
                controller: editController,
                // 自动获取焦点。这样在页面打开时就会自动弹出输入法
                autofocus: true,
              ),
            ),
          ),
          // 也可用GestureDetector  InkWell(有水波纹效果)
          InkWell(
            onTap: () => Toast.toast(context,'tapped'),
            onDoubleTap: () => Toast.toast(context,'double tapped'),
            onLongPress: () => Toast.toast(context,'long tapped'),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text('Send'),
            ),
          )
        ],
      ),
    );
  }
}
