import 'package:flutter/material.dart';
import 'package:flutter_joker/msg/echo_client.dart';
import 'package:flutter_joker/msg/echo_server.dart';
import 'package:flutter_joker/msg/message.dart';

HttpEchoServer _server;
HttpEchoClient _client;

class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  @override
  State createState() {
    return _MessageListState();
  }
}

class _MessageListState extends State<MessageList> with WidgetsBindingObserver {
  final List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    const port = 6060;
    _server = HttpEchoServer(port);
    // initState 不是一个 async 函数，这里我们不能直接 await _server.start(),
    // future.then(...) 跟 await 是等价的
    _server.start().then((_) {
      // 等服务器启动后才创建客户端
      _client = HttpEchoClient(port);
      // 计算过程中出现的异常由catchError注册的回调函数处理，而then()中产生的异常则由onError注册的回调函数处理。
      // then()、catchError()、whenComplete()返回的值都是Future，因此可以继续注册then、catchError、whenComplete，形成Future链
      _client.getHistory().then((list) {
        setState(() {
          messages.addAll(list);
        });
      });
      WidgetsBinding.instance.addObserver(this);
    },onError: (e){

    });
//    .catchError(onError); // 相当于try-catch
//    .whenComplete(action); // 相当于finally
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          final subtitle = DateTime.fromMillisecondsSinceEpoch(msg.timestamp)
              .toLocal()
              .toIso8601String();
          return ListTile(
            title: Text(msg.msg),
            subtitle: Text(subtitle),
          );
        });
  }

  void addMessage(Message msg) {
    setState(() {
      messages.add(msg);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      var server = _server;
      _server = null;
      server?.close();
    }
  }
}

class MessageListScreen extends StatelessWidget {
  final messageListKey =
      GlobalKey<_MessageListState>(debugLabel: 'messageListKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Echo client'),
        ),
        body: MessageList(key: messageListKey),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // push 一个新的 route 到 Navigator 管理的栈中，以此来打开一个页面
            // Navigator.push 会返回一个 Future<T>，如果你对这里使用的 await
            // 不太熟悉，可以参考
            // https://www.dartlang.org/guides/language/language-tour#asynchrony-support
            final result = await Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddMessageScreen()));
           /* if (result is Message) {
              messageListKey.currentState.addMessage(result);
            }*/
             if (_client == null) return;
            // 现在，我们不是直接构造一个 Message，而是通过 _client 把消息
            // 发送给服务器
            var msg = await _client.send(result);
            if (msg != null) {
              messageListKey.currentState.addMessage(msg);
            } else {
              debugPrint('fail to send $result');
            }
          },
          tooltip: 'Add message',
          child: Icon(Icons.add),
        ));
  }
}

class MessageForm extends StatefulWidget {
  @override
  State createState() {
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
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
    return Padding(
      // 我们让输入框占满一行里除按钮外的所有空间
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Input message',
                  contentPadding: EdgeInsets.all(0.0),
                ),
                style: TextStyle(fontSize: 22.0, color: Colors.black54),
                // 获取文本的关键，这里要设置一个 controller
                controller: editController,
                autofocus: true,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              debugPrint('send: ${editController.text}');
//              Navigator.pop(context, editController.text);
              final msg = Message(
                  editController.text, DateTime.now().millisecondsSinceEpoch);
              Navigator.pop(context, msg);
            },
            onDoubleTap: () => debugPrint('double tapped'),
            onLongPress: () => debugPrint('long pressed'),
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

class AddMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add message'),
      ),
      body: MessageForm(),
    );
  }
}
